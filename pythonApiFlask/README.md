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

## Pruebas Unitarias

La API incluye pruebas automatizadas usando **pytest**. Las pruebas verifican que todos los endpoints funcionen correctamente.

### Archivo de Pruebas

Todas las pruebas están en [test_app.py](test_app.py) e incluyen:

- ✅ Pruebas con parámetro
- ✅ Pruebas sin parámetro
- ✅ Pruebas con caracteres especiales
- ✅ Verificación de tipos de contenido
- ✅ Pruebas de endpoints inexistentes
- ✅ Verificación de métodos HTTP

### Cómo Ejecutar las Pruebas

**Opción 1: Desde PowerShell o CMD (más sencillo)**

```powershell
pytest
```

**Opción 2: Con más verbosidad (ver detalles)**

```powershell
pytest -v
```

**Opción 3: Ver cobertura de código**

```powershell
pytest --cov=app test_app.py
```

**Opción 4: Ejecutar una prueba específica**

```powershell
pytest test_app.py::TestApiEndpoints::test_api_saludar_con_parametro -v
```

### Ejemplos de Salida

Cuando ejecutas `pytest -v`, verás algo como esto:

```
test_app.py::TestApiEndpoints::test_api_saludar_con_parametro PASSED
test_app.py::TestApiEndpoints::test_api_saludar_sin_parametro PASSED
test_app.py::TestApiEndpoints::test_api_saludar_con_espacios PASSED
test_app.py::TestApiEndpoints::test_api_concatenar_con_parametro PASSED
test_app.py::TestApiEndpoints::test_api_concatenar_sin_parametro PASSED
test_app.py::TestApiEndpoints::test_api_concatenar_con_caracteres_especiales PASSED
test_app.py::TestApiEndpoints::test_api_content_type PASSED
test_app.py::TestApiEndpoints::test_api_endpoint_no_existe PASSED
test_app.py::TestApiEndpoints::test_api_solo_acepta_get PASSED

======================== 9 passed in 0.23s ========================
```

### Antes de Ejecutar Pruebas

Asegúrate de haber instalado las dependencias:

```powershell
pip install -r requirements.txt
```

## Estructura del Proyecto

```
pythonApiFlask/
├── app.py                 # Aplicación Flask con Swagger
├── test_app.py           # Pruebas unitarias con pytest
├── requirements.txt       # Dependencias (incluye flasgger y pytest)
├── run.ps1               # Script para PowerShell
├── run.bat               # Script para CMD
└── README.md             # Este archivo
```
