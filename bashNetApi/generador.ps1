<#
============================================================
Script: generador.ps1
Descripción:
    Genera estructura profesional:
    - Minimal API .NET
    - Proyecto de pruebas (xUnit)
    - Solución (.sln o .slnx según versión .NET)
    - Referencias
    - Paquetes
    - Dockerfile
============================================================

Uso:
    .\generador.ps1
    .\generador.ps1 -TestName MiProyectoTests
#>

param (
    [string]$AppName = "NetAPI",
    [string]$TestName
)

$ErrorActionPreference = "Stop"

if (-not $TestName) {
    $TestName = "$AppName.Tests"
}

Write-Host "📦 Creando solución..."
dotnet new sln -n $AppName

# Detectar automáticamente si se creó .sln o .slnx
if (Test-Path "$AppName.sln") {
    $SolutionName = "$AppName.sln"
}
elseif (Test-Path "$AppName.slnx") {
    $SolutionName = "$AppName.slnx"
}
else {
    Write-Host "❌ No se encontró archivo de solución (.sln o .slnx)."
    exit 1
}

Write-Host "🚀 Creando proyecto Minimal API..."
dotnet new web -n $AppName

Write-Host "🧪 Creando proyecto de pruebas ($TestName)..."
dotnet new xunit -n $TestName

Write-Host "🔗 Agregando proyectos a la solución ($SolutionName)..."
dotnet sln $SolutionName add "$AppName\$AppName.csproj"
dotnet sln $SolutionName add "$TestName\$TestName.csproj"

Write-Host "🔗 Asociando proyecto de pruebas con API..."
dotnet add "$TestName\$TestName.csproj" reference "$AppName\$AppName.csproj"

Write-Host "📚 Agregando paquetes necesarios..."
dotnet add "$AppName\$AppName.csproj" package Swashbuckle.AspNetCore
dotnet add "$AppName\$AppName.csproj" package Microsoft.AspNetCore.OpenApi

Write-Host "🐳 Creando Dockerfile..."

@"
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY *.sln* .
COPY $AppName/*.csproj $AppName/
RUN dotnet restore

COPY . .
RUN dotnet publish $AppName -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

COPY --from=build /app/out .

ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "$AppName.dll"]
"@ | Out-File -FilePath "$AppName\Dockerfile" -Encoding UTF8

Write-Host "🚫 Creando .dockerignore..."

@"
bin/
obj/
.git/
.vscode/
"@ | Out-File -FilePath "$AppName\.dockerignore" -Encoding UTF8

Write-Host ""
Write-Host "✅ Proyecto generado correctamente!"
Write-Host "📂 Estructura creada:"
Write-Host "   - $SolutionName"
Write-Host "   - $AppName/"
Write-Host "   - $TestName/"
Write-Host ""
Write-Host "🚀 Ejecuta:"
Write-Host "   cd $AppName"
Write-Host "   dotnet run"