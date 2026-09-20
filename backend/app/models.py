from sqlalchemy import Column, Integer, String, TIMESTAMP, func
from .database import Base

class Usuario(Base):
    __tablename__ = "usuarios"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100), nullable=False)
    email = Column(String(150), nullable=False, unique=True)
    creado_en = Column(TIMESTAMP, server_default=func.now())