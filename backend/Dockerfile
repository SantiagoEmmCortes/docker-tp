FROM python:3.11-slim

WORKDIR /app

# Copiamos primero SOLO requirements.txt (no todo el código) para
# aprovechar el cache de capas de Docker: si no cambiás las dependencias,
# esta capa no se vuelve a reconstruir, aunque cambies main.py después.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Recién ahora copiamos el resto del código
COPY ./app ./app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]