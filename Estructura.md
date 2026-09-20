# Estructura de carpetas — TP Docker

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