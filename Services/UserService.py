from dataclasses import dataclass
import uuid
from Classes.Enums import Roles
from Helpers.DatabaseHelper import DatabaseHelper


@dataclass(frozen=True)
class User:
    id: uuid
    name: str
    phone: str
    role: Roles
    tele_id: int

    @property
    def role(self):
        return self.__role[1]

    def role_id(self):
        return self.__role[0]


class UserService:
    def __init__(self):
        db_con = DatabaseHelper.open_connection()