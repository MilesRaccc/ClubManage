from dataclasses import dataclass
import uuid
from datetime import datetime
from UserService import User
from TableService import Table
from DepositService import Deposit


@dataclass(frozen=True)
class Reservation:
    id: uuid
    entry_datetime: datetime
    name: str
    guests_amount: int
    promoter: User
    table: Table
    deposit: Deposit
    reservation_datetime: datetime
    prepay: int = 0
    payed: bool = False
    parking: bool = False
    guards: bool = False
