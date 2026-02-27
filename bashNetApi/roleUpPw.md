📄 generador.ps1 (PowerShell versión Windows 11)

Guárdalo como:

generador.ps1

Contenido:

# <#

Script: generador.ps1
Descripción:
Genera estructura profesional: - Minimal API .NET - Proyecto de pruebas (xUnit) - Solución (.sln) - Referencias - Paquetes - Dockerfile
============================================================

Uso:
.\generador.ps1
.\generador.ps1 -TestName MiProyectoTests
#>

param (
[string]$AppName = "NetAPI",
    [string]$TestName
)

if (-not $TestName) {
    $TestName = "$AppName.Tests"
}

$SolutionName = "$AppName.sln"

Write-Host "📦 Creando solución..."
dotnet new sln -n $AppName

Write-Host "🚀 Creando proyecto Minimal API..."
dotnet new web -n $AppName

Write-Host "🧪 Creando proyecto de pruebas ($TestName)..."
dotnet new xunit -n $TestName

Write-Host "🔗 Agregando proyectos a la solución..."
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

COPY _.sln .
COPY $AppName/_.csproj $AppName/
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
Write-Host " - $SolutionName"
Write-Host " - $AppName/"
Write-Host " - $TestName/"
Write-Host ""
Write-Host "🚀 Ejecuta:"
Write-Host " cd $AppName"
Write-Host " dotnet run"
🔥 Cómo ejecutarlo en Windows 11

Primero habilita ejecución de scripts (una sola vez):

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Luego ejecuta:

.\generador.ps1

Con nombre personalizado:

.\generador.ps1 -TestName MiProyectoTests

O incluso cambiar nombre principal:

.\generador.ps1 -AppName MiAPI -TestName MiAPI.Tests
🎯 Diferencia clave Bash vs PowerShell
Bash (.sh) PowerShell (.ps1)
Linux / WSL Windows nativo
chmod +x Set-ExecutionPolicy
$1 -ParameterName
