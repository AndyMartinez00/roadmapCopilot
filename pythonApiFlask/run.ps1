# Script para ejecutar Flask - valida venv (activo o inactivo)

# Función para verificar si el entorno virtual existe
function Check-VirtualEnv {
    return Test-Path ".\venv\Scripts\Activate.ps1"
}

# Función para verificar si el entorno virtual está activo
function Is-VirtualEnvActive {
    return $env:VIRTUAL_ENV -ne $null
}

Write-Host "=== Flask API - Verificador de Entorno Virtual ===" -ForegroundColor Cyan

# Crear el entorno virtual si no existe
if (-not (Check-VirtualEnv)) {
    Write-Host "✓ Creando entorno virtual..." -ForegroundColor Yellow
    python -m venv venv
    Write-Host "✓ Entorno virtual creado" -ForegroundColor Green
}

# Activar el entorno virtual si no está activo
if (-not (Is-VirtualEnvActive)) {
    Write-Host "✓ Activando entorno virtual..." -ForegroundColor Yellow
    & .\venv\Scripts\Activate.ps1
    Write-Host "✓ Entorno virtual activado" -ForegroundColor Green
} else {
    Write-Host "✓ Entorno virtual ya está activo" -ForegroundColor Green
}

# Instalar dependencias
Write-Host "✓ Instalando dependencias..." -ForegroundColor Yellow
pip install -r requirements.txt

# Ejecutar la aplicación
Write-Host ""
Write-Host "=== Iniciando API Flask ===" -ForegroundColor Cyan
Write-Host "URL: http://localhost:5000/api?mensaje=tu_texto" -ForegroundColor Green
Write-Host "Presiona Ctrl+C para detener" -ForegroundColor Yellow
Write-Host ""

python app.py
