import argparse
import requests
#from sqlalchemy import create_engine

# Mapeo de tags a URLs de API y nombres de tabla
API_MAP = {
    "centros": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadocentros", "table": "centros"},
    "periodos": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadoespecialidades", "table": "periodos"},
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
                }
}


def obtener_datos(api_url):
    response = requests.get(api_url)
    if response.status_code == 200:
        return response.json()
    else:
        return None

def guardar_datos(table_name, data):
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
        placeholders = ", ".join(["%s"] * len(single_data))
        
        # Generar la consulta SQL
        query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders}) RETURNING id"
        print(query)
        
    # Obtener el mapeo para la tabla actual
    #columnas = COL_MAP.get(nombre_tabla, {})
    # Convertir las claves en los nombres de columnas correctos
    #data = {COL_MAP.get(k, k): v for k, v in data.items()}
    


def main(api_tags):
    results = []
    for tag in api_tags:
        endpoint = API_MAP.get(tag)
        if endpoint:
            #print(endpoint["url"])
            # respuesta de la api esta en data
            data = obtener_datos(endpoint["url"])           
            #print(data)
            if data:
                row_id = guardar_datos(endpoint["table"], data)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Obtenga datos de las API y guárdelos en la base de datos.')
    parser.add_argument('api_tags', type=str, nargs='+', help='Id para llamar a la API')
    args = parser.parse_args()    
    main(args.api_tags)
