import argparse
#import requests
#from sqlalchemy import create_engine

# Mapeo de tags a URLs de API y nombres de tabla
API_MAP = {
    "centros": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadocentros", "table": "api_data_1"},
    "periodos": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadoespecialidades", "table": "api_data_2"},
    "especialidades": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadoespecialidades", "table": "api_data_2"},
    "cursos": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/listadocursos", "table": "api_data_2"},    
    "horarios": {"url": "https://informatica.galileo.edu/apicentrosidea/api/consulta/horarioscursos", "table": "api_data_2"},
}


def main(api_tags):
    results = []
    for tag in api_tags:
        endpoint = API_MAP.get(tag)
        if endpoint:
            print(endpoint["url"])
            #data = fetch_data(endpoint["url"])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Obtenga datos de las API y guárdelos en la base de datos.')
    parser.add_argument('api_tags', type=str, nargs='+', help='Id para llamar a la API')
    args = parser.parse_args()    
    main(args.api_tags)
