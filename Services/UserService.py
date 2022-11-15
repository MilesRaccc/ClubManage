from Classes.Enums import Roles
from DatabaseHelper import DatabaseHelper


class User:
    def __init__(self, id=None, name=None, phone=None, role=None, telegram_id=None):
        self.__id = id
        self.__name = name
        self.__phone = phone
        self.__role = role
        self.__tele_id = telegram_id

    @property
    def id(self):
        return self.__id

    @property
    def name(self):
        return self.__name

    @property
    def phone(self):
        return self.__phone

    @property
    def role(self):
        return self.__role[1]

    def role_id(self):
        return self.__role[0]

    @property
    def tele_id(self):
        return self.__tele_id


class UserService:
    def __init__(self):
        db_con = DatabaseHelper.open_connection()