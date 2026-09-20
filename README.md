# TP Docker — Equipo #X

Proyecto Web Full-Stack con Docker: MySQL + FastAPI + Frontend estático (Nginx).

## Estructura de carpetas

```
docker-tp/
├── docker-compose.yml       # Orquesta los 3 servicios, la red y el volumen
├── .env.example              # Plantilla de variables de entorno (sin valores reales)
├── .gitignore
├── README.md
│
├── backend/                  # Servicio FastAPI
│   ├── Dockerfile
│   ├── requirements.txt
│   └── app/
│       ├── main.py           # Endpoints de la API
│       ├── database.py       # Conexión a MySQL (SQLAlchemy)
│       ├── models.py         # Modelo ORM de la tabla usuarios
│       └── schemas.py        # Schemas de validación/respuesta (Pydantic)
│
├── frontend/                 # Servicio Nginx + estáticos
│   ├── Dockerfile
│   ├── nginx.conf            # Config de Nginx + reverse proxy a /api
│   └── html/
│       ├── index.html
│       ├── style.css
│       └── script.js         # fetch() al backend vía /api
│
└── db/
    └── init.sql              # Crea la tabla 'usuarios' con datos de ejemplo
```

## Requisitos previos

- Docker Desktop instalado y corriendo

## Cómo levantar el entorno

1. Clonar el repositorio.
2. Copiar `.env.example` a `.env` y completar los valores:
   ```
   cp .env.example .env
   ```
3. Levantar todo con un solo comando:
   ```
   docker compose up --build
   ```
4. Abrir en el navegador: **http://localhost:3000**

La API queda disponible en `http://localhost:8000` (documentación interactiva autogenerada por FastAPI en `http://localhost:8000/docs`).

## Cómo apagar el entorno

```
docker compose down
```

Para borrar también los datos persistidos (reiniciar desde cero):

```
docker compose down -v
```

## Arquitectura

- **Red bridge personalizada** (`tp_network`): permite que los contenedores se resuelvan entre sí por nombre de servicio (`mysql`, `backend`, `frontend`), sin depender de IPs fijas.
- **MySQL**: expone un healthcheck; el backend espera a que la base esté `healthy` antes de arrancar (`depends_on` + `condition: service_healthy`).
- **Volumen persistente** (`mysql_data`): los datos de la base sobreviven a la destrucción y recreación de los contenedores.
- **Nginx**: sirve el frontend estático y actúa como reverse proxy, redirigiendo las peticiones `/api/*` al backend — así el navegador solo se comunica con un único origen.

## Demo en vivo (video)

1. Levantar el entorno con `docker compose up --build`.
2. Consultar la tabla `usuarios` desde la consola interactiva de MySQL:
   ```
   docker exec -it tp_mysql mysql -u <usuario> -p<password> <nombre_bd>
   SELECT * FROM usuarios;
   ```
3. Modificar el campo `nombre` directamente desde esa terminal:
   ```
   UPDATE usuarios SET nombre = 'Nuevo Nombre' WHERE id = 1;
   ```
4. Recargar `http://localhost:3000` y verificar que el mensaje de bienvenida refleja el nuevo valor, sin reiniciar ningún contenedor.