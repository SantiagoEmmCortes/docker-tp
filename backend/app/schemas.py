from pydantic import BaseModel

class UsuarioOut(BaseModel):
    id: int
    nombre: str
    email: str

    class Config:
        from_attributes = True  # permite construir esto desde un objeto SQLAlchemy