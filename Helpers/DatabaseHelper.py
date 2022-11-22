import mysql.connector
import configparser
# from UserService import User


class DatabaseHelper:
    @staticmethod
    def open_connection():
        DatabaseHelper.__config = configparser.ConfigParser()
        DatabaseHelper.__config.read("settings.ini")
        DatabaseHelper.__cnx = mysql.connector.connect(host=DatabaseHelper.__config["DB"]["Host"],
                                                       port=DatabaseHelper.__config["DB"]["Port"],
                                                       user=DatabaseHelper.__config["DB"]["User"],
                                                       passwd=DatabaseHelper.__config["DB"]["Password"],
                                                       db=DatabaseHelper.__config["DB"]["Name"])
        DatabaseHelper.__cursor = DatabaseHelper.__cnx.cursor()

    @staticmethod
    def close_connection():
        DatabaseHelper.__cursor.close()
        DatabaseHelper.__cnx.close()

    @staticmethod
    def execute_query(query):
        DatabaseHelper.__cursor.execute(query)
        return DatabaseHelper.__cursor
