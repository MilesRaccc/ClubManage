class Reservation:
    def __init__(self, id=None, entry_datetime=None, name=None, guests_amount=None, promoter=None, table=None, deposit=None, reservation_datetime=None, prepay=None, payed=False, parking=False, guards=False):
        self.__id = id
        self.__entry_datetime = entry_datetime
        self.__name = name
        self.__guests_amount = guests_amount
        self.__promoter = promoter
        self.__table = table
        self.__deposit = deposit
        self.__reservation_datetime = reservation_datetime
        self.__prepay = prepay
        self.__payed = payed
        self.__parking = parking
        self.__guards = guards