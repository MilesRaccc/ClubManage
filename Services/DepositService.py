import uuid
from dataclasses import dataclass
from TableService import Table
from UserService import User
from datetime import time, datetime


@dataclass(frozen=True)
class Deposit:
    id: uuid
    table: Table
    amount: int
    time_from: time
    time_to: time
    last_modified_user: User
    last_modified_datetime: datetime
