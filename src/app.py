# app.py

import mysql.connector
from config import DATABASE_CONFIG

def connect_to_database():
    """ Conecta ao banco de dados MySQL usando as configurações definidas em config.py """
    try:
        connection = mysql.connector.connect(**DATABASE_CONFIG)
        if connection.is_connected():
            db_info = connection.get_server_info()
            print("Conectado ao servidor MySQL versão ", db_info)
            cursor = connection.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("Conectado ao banco de dados: ", record)
        return connection
    except Exception as e:
        print("Erro ao conectar ao banco de dados MySQL", e)
        return None

def fetch_data():
    """ Busca dados de uma tabela específica """
    try:
        connection = connect_to_database()
        if connection is not None:
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM Mecanico;")  # Modifique a consulta conforme necessário
            rows = cursor.fetchall()
            print("Total de registros retornados: ", len(rows))
            for row in rows:
                print(row)
            cursor.close()
            connection.close()
    except Exception as e:
        print("Erro ao buscar dados", e)

if __name__ == "__main__":
    fetch_data()
