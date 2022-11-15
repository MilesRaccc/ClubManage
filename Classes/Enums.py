import uuid
import enum


class Roles(enum.Enum):
    Admin = [uuid.UUID('{9615d89b-4489-11ed-aa8f-0250210083a2}'), "Admin"],
    Promoter = [uuid.UUID('{81eadf5b-4489-11ed-aa8f-0250210083a2}'), "Promoter"],
    Analytics = [uuid.UUID('{9b19e15c-4489-11ed-aa8f-0250210083a2}'), "Analytics"]
