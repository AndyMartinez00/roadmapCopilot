# API Flask - Concatenador de Cadenas

API sencilla creada con Flask que concatena una cadena de entrada con un prefijo y sufijo específicos.

## Descripción

La API cuenta con un método GET que:

- Recibe una cadena de entrada como parámetro
- La concatena con "Hola" al inicio y " desde la API de Python" al final
- Devuelve el resultado en formato JSON

## Requisitos

- Python 3.x
- Flask
- Werkzeug

## Instalación y Ejecución

### Opción 1: Usando Script (Recomendado - Valida venv automáticamente)

**PowerShell:**

```powershell
.\run.ps1
```

**CMD:**

```cmd
run.bat
```

El script automáticamente:

- ✅ Crea el entorno virtual si no existe
- ✅ Lo activa (tanto si estaba activo como inactivo)
- ✅ Instala las dependencias
- ✅ Ejecuta la aplicación

### Opción 2: Manual (Paso a paso)

**Crear el entorno virtual:**

```powershell
python -m venv venv
```

**Activar el entorno virtual:**

PowerShell:

```powershell
.\venv\Scripts\Activate.ps1
```

CMD:

```cmd
venv\Scripts\activate.bat
```

**Instalar dependencias:**

```powershell
pip install -r requirements.txt
```

**Ejecutar la aplicación:**

```powershell
python app.py
```

## Endpoints

### GET /api

Concatena con parámetro `mensaje`

**Ejemplo:**

```
GET http://localhost:5000/api?mensaje=mundo
```

**Respuesta:**

```json
{
  "mensaje": "Hola mundo desde la API de Python"
}
```

### GET /api/concatenar

Concatena con parámetro `texto`

**Ejemplo:**

```
GET http://localhost:5000/api/concatenar?texto=usuario
```

**Respuesta:**

```json
{
  "resultado": "Hola usuario desde la API de Python"
}
```

## Dejar de Usar el Entorno Virtual

Para salir del entorno virtual:

```powershell
deactivate
```

## Swagger - Documentación Interactiva

La API incluye **Swagger** para documentación interactiva. Una vez que ejecutes la aplicación, puedes acceder a la interfaz Swagger en:

### Acceso a Swagger UI

**URL:** `http://localhost:5000/apidocs/`

Aquí puedes:

- ✅ Ver toda la documentación de los endpoints
- ✅ Probar los endpoints directamente desde el navegador
- ✅ Ver los parámetros requeridos
- ✅ Ver las respuestas esperadas

### Cómo Probar un Endpoint en Swagger

1. **Abre** `http://localhost:5000/apidocs/`
2. **Haz clic** en el endpoint que deseas probar (ej: `/api`)
3. **Haz clic** en "Try it out"
4. **Ingresa** el valor para el parámetro (ej: `mensaje=Python`)
5. **Haz clic** en "Execute"
6. **Ve** la respuesta en la sección "Response"

### Alternativa: Swagger JSON

Si deseas ver la especificación OpenAPI en formato JSON:

```
GET http://localhost:5000/swagger.json
```

## Estructura del Proyecto

```
pythonApiFlask/
├── app.py                 # Aplicación Flask con Swagger
├── requirements.txt       # Dependencias (incluye flasgger)
├── run.ps1               # Script para PowerShell
├── run.bat               # Script para CMD
└── README.md             # Este archivo
```
