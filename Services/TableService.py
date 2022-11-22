import uuid
from UserService import User
from dataclasses import dataclass
from datetime import datetime


@dataclass(frozen=True)
class Table:
    id: uuid = None
    number: int = 0
    status_free: bool = True
    status_changed_by: User = None
    status_changed_datetime: datetime = None
