#!/usr/bin/env bash

# ============================================================
# Script: generador.sh
# Autor: Equipo Desarrollo
# Descripción:
#   Genera automáticamente una estructura profesional para:
#   - Minimal API en .NET
#   - Proyecto de pruebas (xUnit)
#   - Archivo de solución (.sln)
#   - Asociación entre proyectos
#   - Instalación de paquetes necesarios
#   - Dockerfile listo para contenerización
#   - Archivo .dockerignore
#
# Uso:
#   ./generador.sh                -> usa nombre por defecto
#   ./generador.sh MiProyectoTests -> usa nombre personalizado para tests
# ============================================================

set -euo pipefail

# -------------------------------
# Variables principales
# -------------------------------
APP_NAME="NetAPI"                          # Nombre del proyecto principal

# Si el usuario pasa un argumento, se usa como nombre del proyecto de pruebas
# Si no pasa nada, se usa el nombre por defecto
if [ $# -ge 1 ]; then
  TEST_NAME="$1"
else
  TEST_NAME="${APP_NAME}.Tests"
fi

SOLUTION_NAME="${APP_NAME}.sln"            # Nombre de la solución

# -------------------------------
# Crear archivo de solución
# -------------------------------
echo "📦 Creando solución..."
dotnet new sln -n $APP_NAME

# -------------------------------
# Crear proyecto Minimal API
# -------------------------------
echo "🚀 Creando proyecto Minimal API..."
dotnet new web -n $APP_NAME

# -------------------------------
# Crear proyecto de pruebas (xUnit)
# -------------------------------
echo "🧪 Creando proyecto de pruebas ($TEST_NAME)..."
dotnet new xunit -n $TEST_NAME

# -------------------------------
# Agregar proyectos a la solución
# -------------------------------
echo "🔗 Agregando proyectos a la solución..."
dotnet sln $SOLUTION_NAME add $APP_NAME/$APP_NAME.csproj

dotnet sln $SOLUTION_NAME add $TEST_NAME/$TEST_NAME.csproj

# -------------------------------
# Asociar referencia del proyecto principal
# al proyecto de pruebas
# -------------------------------
echo "🔗 Asociando proyecto de pruebas con API..."
dotnet add $TEST_NAME/$TEST_NAME.csproj reference $APP_NAME/$APP_NAME.csproj

# -------------------------------
# Agregar paquetes necesarios
# -------------------------------
echo "📚 Agregando paquetes necesarios..."
dotnet add $APP_NAME/$APP_NAME.csproj package Swashbuckle.AspNetCore

dotnet add $APP_NAME/$APP_NAME.csproj package Microsoft.AspNetCore.OpenApi

# -------------------------------
# Crear Dockerfile automáticamente
# -------------------------------
echo "🐳 Creando Dockerfile..."

cat > $APP_NAME/Dockerfile <<EOF
# --------- Build Stage ---------
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /app

COPY *.sln .
COPY $APP_NAME/*.csproj $APP_NAME/
RUN dotnet restore

COPY . .
RUN dotnet publish $APP_NAME -c Release -o out

# --------- Runtime Stage ---------
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app

COPY --from=build /app/out .

ENV ASPNETCORE_URLS=http://+:8082
EXPOSE 8082

ENTRYPOINT ["dotnet", "$APP_NAME.dll"]
EOF

# -------------------------------
# Crear archivo .dockerignore
# -------------------------------
echo "🚫 Creando .dockerignore..."

cat > $APP_NAME/.dockerignore <<EOF
bin/
obj/
.git/
.vscode/
EOF

# -------------------------------
# Mensaje final
# -------------------------------
echo ""
echo "✅ Proyecto generado correctamente!"
echo "📂 Estructura creada:"
echo "   - $SOLUTION_NAME"
echo "   - $APP_NAME/"
echo "   - $TEST_NAME/"
echo ""
echo "🚀 Próximos pasos sugeridos:"
echo "   cd $APP_NAME"
echo "   dotnet run"S