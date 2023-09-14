import argparse
import psycopg2
import requests
from configparser import ConfigParser
import sys

conn = None


# Mapeo de tags a URLs de API y nombres de tabla
API_MAP = {
    "centros": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadocentros", "table": "centros"},
    "periodos": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/descripcionperiodo", "table": "periodos"},
    "especialidades": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadoespecialidades", "table": "especialidades"},
    "cursos": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadocursos", "table": "cursos"},    
    "horarios": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/horarioscursos", "table": "horarios"},
}

# Mapeo de campos de la tabla y el json (ya que no son iguales)
COL_MAP = {
    'centros': {
                    'Centro': 'centro', 
                    'Centro_Nombre': 'nombre',
                    'Departamento':'departamento',
                    'Municipio':'municipio',
                    'Direccion':'direccion',
                    'Telefono':'telefono',
                    'Encargado':'encargado',
                    'Email':'email'
                },
    'periodos': {
                    'Carrera': 'carrera', 
                    'Periodo': 'periodo',
                    'Descripcion': 'descripcion'
                },
    'especialidades': {
                    'Carrera': 'carrera', 
                    'Pensum': 'pensum',
                    'Nombre': 'nombre'
                },
    'cursos': {
                    'Carrera': 'carrera',                     
                    'Descripcion': 'nombre_curso',
                    'Seccion': 'seccion',
                    'Tipoasig': 'tipoasig',
                    'Periodo': 'periodo',
                    'Curso': 'curso',
                    'Centro': 'centro',
                    'Pensum': 'pensum',
                    'Ciclo': 'ciclo',
                    'Jornada': 'jornada',
                    'Desc_Seccion': 'desc_seccion',
                    'Inicio': 'inicio',
                    'Fin': 'fin'                    
                },
    'horarios': {
                    'Carrera': 'carrera',                     
                    'Descripcion': 'nombre_curso',
                    'Seccion': 'seccion',
                    'Tipoasig': 'tipoasig',
                    'Periodo': 'periodo',
                    'Curso': 'curso',
                    'Centro': 'centro',
                    'Pensum': 'pensum',
                    'Ciclo': 'ciclo',
                    'Jornada': 'jornada',
                    'Desc_Seccion': 'desc_seccion',
                    'Inicio': 'inicio',
                    'Fin': 'fin'                    
                }
}

def config(filename='database.ini', section='postgresql'):
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return db

def obtener_datos(api_url):
    response = requests.get(api_url)
    if response.status_code == 200:
        ljson = len(response.json())        
        print(f"Se encontraron {ljson} registros en la url: {api_url}")        
        return response.json()
    else:
        return None

def guardar_datos(table_name, data):
    conn = None
    # Conectar a la db
    params = config()
    conn = psycopg2.connect(**params)

    # test de data
    #print(data)
    #sys.exit()

    fila_insertada_count = 0

    for single_data in data:
        # Crear un nuevo diccionario vacío para almacenar los datos transformados
        single_data_transformed = {}
        # Obtén el mapeo de columnas correspondiente a la tabla actual
        column_mapping = COL_MAP.get(table_name, {})
        # Iterar a través de cada par clave-valor en single_data
        for k, v in single_data.items():
            # Obtener la nueva clave del mapeo de columnas, o usar la clave original si no hay un mapeo correspondiente
            new_key = column_mapping.get(k, k)
        
            # Información de la tabla actual corregida
            single_data_transformed[new_key] = v

        # listado de columnas
        columns = ", ".join(single_data_transformed.keys())
        
        # listado de valores
        #placeholders = ", ".join(["%s"] * len(single_data))
        placeholders = ", ".join(["%s"] * len(single_data_transformed))
        
        # Generar la consulta SQL en base a columnas y valores
        query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"    


        valores_dict = single_data.values()
        lista_valores = list(valores_dict)

        # create a cursor
        cur = conn.cursor()
        cur.execute(query, lista_valores)

         # Commitea la transacción
        conn.commit()

        #cuenta filas afectadas
        fila_insertada_count += cur.rowcount
        
         # Cierra la conexión
        cur.close()
        cur.close()

    
    print(f"Se insertaron {fila_insertada_count} registros en la tabla {table_name}")
        
    


def main(api_tags):
    results = []
    for tag in api_tags:
        endpoint = API_MAP.get(tag)
        if endpoint:
            #print(endpoint["url"])
            # respuesta de la api esta en data
            data = obtener_datos(endpoint["url"])                       
            if data:
                row_id = guardar_datos(endpoint["table"], data)
            else:
                print('No hay datos para el endpoint ', endpoint["url"])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Obtenga datos de las API y guárdelos en la base de datos.')
    parser.add_argument('api_tags', type=str, nargs='+', help='Id para llamar a la API')
    args = parser.parse_args()    
    main(args.api_tags)
