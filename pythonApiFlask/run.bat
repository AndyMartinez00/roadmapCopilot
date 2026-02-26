@echo off
REM Script para ejecutar Flask - valida venv (activo o inactivo)

echo.
echo ===== Flask API - Verificador de Entorno Virtual =====
echo.

REM Verificar si el entorno virtual existe
if not exist "venv\Scripts\activate.bat" (
    echo [*] Creando entorno virtual...
    python -m venv venv
    echo [OK] Entorno virtual creado
)

REM Activar el entorno virtual
echo [*] Activando entorno virtual...
call venv\Scripts\activate.bat
echo [OK] Entorno virtual activado
echo.

REM Instalar dependencias
echo [*] Instalando dependencias...
pip install -r requirements.txt
echo.

REM Ejecutar la aplicación
echo.
echo ===== Iniciando API Flask =====
echo URL: http://localhost:5000/api?mensaje=tu_texto
echo.

python app.py
