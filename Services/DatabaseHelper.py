import uuid
import mysql.connector
import configparser
# from UserService import User


class DatabaseHelper:
    def __init__(self):
        self.__config = configparser.ConfigParser()
        self.__config.read("settings.ini")

    def open_connection(self):
        self.__cnx = mysql.connector.connect(host=self.__config["DB"]["Host"], port=self.__config["DB"]["Port"],
                                             user=self.__config["DB"]["User"], passwd=self.__config["DB"]["Password"],
                                             db=self.__config["DB"]["Name"])
        self.__cursor = self.__cnx.cursor()

    def execute_query(self, query):
        self.__cursor.execute(query)
        return self.__cursor

    def close_connection(self):
        self.__cursor.close()
        self.__cnx.close()
