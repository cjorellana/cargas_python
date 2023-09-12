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

# Mapeo de campos de la tabla y el json


def fetch_data(api_url):
    response = requests.get(api_url)
    if response.status_code == 200:
        return response.json()
    else:
        return None

def store_data(table_name, data):
    pass

def main(api_tags):
    results = []
    for tag in api_tags:
        endpoint = API_MAP.get(tag)
        if endpoint:
            #print(endpoint["url"])
            # respuesta de la api esta en data
            data = fetch_data(endpoint["url"])
            print(data)
            if data:
                row_id = store_data(endpoint["table"], data)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Obtenga datos de las API y guárdelos en la base de datos.')
    parser.add_argument('api_tags', type=str, nargs='+', help='Id para llamar a la API')
    args = parser.parse_args()    
    main(args.api_tags)
