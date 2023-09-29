import psycopg2
from db_config import config

def limpiar_tabla(tabla):
    """ Borra todos los datos de una tabla especificada """
    # Obtener la configuración de la base de datos
    params = config()

    # Conectar a la base de datos
    conn = psycopg2.connect(**params)

    # Crear un nuevo objeto cursor
    cur = conn.cursor()

    # Ejecutar la consulta para borrar todos los registros de la tabla especificada
    cur.execute(f"DELETE FROM {tabla}")

    # Hacer commit a la transacción
    conn.commit()

    # Cerrar la comunicación con la base de datos
    cur.close()
    conn.close()