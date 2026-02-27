# Go API - Roadmap Copilot

API básica en Go con operaciones CRUD simples.

## Requisitos

- Go 1.26 o superior

## Instalación y Ejecución

```bash
# Navegar al directorio
cd goApi

# Ejecutar la aplicación
go run main.go
```

El servidor se iniciará en `http://localhost:8080`

## Endpoints

### GET /

Raíz de la API

```bash
curl http://localhost:8080/
```

### GET /api/health

Verifica el estado de la API

```bash
curl http://localhost:8080/api/health
```

### GET /api/users

Obtiene la lista de usuarios

```bash
curl http://localhost:8080/api/users
```

### POST /api/users

Crea un nuevo usuario

```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Pedro","email":"pedro@example.com"}'
```

## Estructura del Proyecto

```
goApi/
├── main.go          # Archivo principal con los handlers
├── go.mod           # Módulo Go
└── README.md        # Este archivo
```

## Próximos Pasos

Para mejorar la API:

- Agregar base de datos (PostgreSQL, MongoDB)
- Usar framework como [Gin](https://gin-gonic.com/) o [Echo](https://echo.labstack.com/)
- Agregar autenticación (JWT)
- Agregar logging y middleware
- Agregar validación de datos
