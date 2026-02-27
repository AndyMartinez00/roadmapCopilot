# 🚀 Generador de Proyecto .NET Minimal API

## 📌 Descripción

Este proyecto contiene un script en **PowerShell (`generador.ps1`)** que automatiza la creación de una estructura profesional para una aplicación **.NET Minimal API**.

El script crea automáticamente:

- ✅ Proyecto Minimal API
- ✅ Proyecto de pruebas (xUnit)
- ✅ Archivo de solución (.sln o .slnx según versión de .NET)
- ✅ Asociación entre proyectos
- ✅ Instalación de paquetes necesarios (Swagger / OpenAPI)
- ✅ Dockerfile listo para contenerización
- ✅ Archivo `.dockerignore`

---

## 🧱 Estructura generada

Después de ejecutar el script, la estructura será similar a:

```
NetAPI.sln (o .slnx)
│
├── NetAPI/
│   ├── Program.cs
│   ├── NetAPI.csproj
│   ├── Dockerfile
│   └── .dockerignore
│
└── NetAPI.Tests/
    ├── UnitTest1.cs
    └── NetAPI.Tests.csproj
```

---

## ⚙️ Requisitos

- Windows 11
- PowerShell
- .NET SDK (8, 9 o 10)
- Docker (opcional, para contenerización)

Verificar versión instalada:

```powershell
dotnet --version
```

---

## ▶️ Cómo usar el script

### 1️⃣ Permitir ejecución de scripts (una sola vez)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 2️⃣ Ejecutar el generador

Con valores por defecto:

```powershell
.\generador.ps1
```

Con nombre personalizado para el proyecto de pruebas:

```powershell
.\generador.ps1 -TestName MiProyectoTests
```

---

## 🧪 Ejecutar la aplicación

```powershell
cd NetAPI
dotnet run
```

Probar en navegador:

```
http://localhost:5000
```

(O el puerto asignado por .NET)

---

## 🐳 Ejecutar con Docker

Construir imagen:

```bash
docker build -t netapi:1.0 .
```

Ejecutar contenedor:

```bash
docker run -p 8080:8080 netapi:1.0
```

Probar en navegador:

```
http://localhost:8080
```

---

## 📦 Paquetes incluidos

- `Swashbuckle.AspNetCore` (Swagger UI)
- `Microsoft.AspNetCore.OpenApi`

---

## 🎯 Objetivo del proyecto

Este generador permite estandarizar la creación de proyectos .NET con:

- Estructura organizada
- Buenas prácticas iniciales
- Preparación para pruebas unitarias
- Contenerización lista para producción

Ideal para:

- Equipos de desarrollo
- Bootstrapping rápido de APIs
- Estandarización de arquitectura base
- Automatización de entornos

---

## 🚀 Próximas mejoras posibles

- Soporte para Clean Architecture
- Selección de versión .NET automática
- Opción para Controllers tradicionales
- Integración con docker-compose
- Generación de pipeline CI/CD

---

## 📄 Licencia

Uso interno / educativo / profesional según necesidad del equipo.
