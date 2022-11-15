class Table:
    def __init__(self, id=None, number=None, status_free=True, user=None, status_changed_datetime=None):
        self.__id = id
        self.__number = number
        self.__status_free = status_free
        self.__status_changed_by = user
        self.__status_changed_datetime = status_changed_datetime

    @property
    def id(self):
        return self.__id

    @property
    def number(self):
        return self.__number