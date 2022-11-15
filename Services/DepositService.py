class Deposit:
    def __init__(self, id=None, table=None, deposit_amount=None, time_from=None, time_to=None, last_modified_user=None, last_modified_datetime=None):
        self.__id = id
        self.__table = table
        self.__amount = deposit_amount
        self.__from = time_from
        self.__to = time_to
        self.__last_modified = last_modified_user
        self.__last_modified_datetime = last_modified_datetime