# 📌 Creación de Proyecto .NET Web API desde Cero

## 🖥️ Entorno

- Sistema Operativo: Windows 11
- Tecnología: .NET (Web API)
- Directorio de trabajo: `netApi`

---

# 1️⃣ Instalación de .NET en Windows 11

## 🔹 Paso 1: Descargar .NET SDK

1. Ir al sitio oficial:
   [https://dotnet.microsoft.com/download](https://dotnet.microsoft.com/download)
2. Descargar la versión **.NET SDK (última LTS recomendada)** para Windows.
3. Ejecutar el instalador descargado.
4. Seguir el asistente hasta finalizar.

> ⚠️ Importante: Instalar el **SDK**, no solo el Runtime.

---

## 🔹 Paso 2: Verificar instalación

Abrir **PowerShell** y ejecutar:

```powershell
dotnet --version
```

Si devuelve una versión (ejemplo `8.0.x`), .NET está correctamente instalado.

Para ver todos los SDK instalados:

```powershell
dotnet --list-sdks
```

---

# 2️⃣ Crear estructura de carpetas

Ubicarse en el directorio donde se alojará el proyecto y ejecutar:

```powershell
cd C:\
mkdir Proyectos
cd Proyectos
mkdir netApi
cd netApi
```

---

# 3️⃣ Crear proyecto Web API

Dentro del directorio `netApi` ejecutar:

```powershell
dotnet new webapi
    Crea el proyecto en la carpeta actual
    Usa el nombre de la carpeta como nombre del proyecto (.csproj)
dotnet new webapi -n NetAPI
    Crea una nueva carpeta llamada NetAPI
    Dentro crea el proyecto
    El .csproj se llamará NetAPI.csproj

```

Si es la primera vez usando el CLI, puede solicitar instalar certificados HTTPS. Aceptar con:

```powershell
dotnet dev-certs https --trust
```

Esto generará la siguiente estructura base:

```
@AM1000897GT ➜ netApi git(main) tree /f
Listado de rutas de carpetas para el volumen Repo
El número de serie del volumen es BCFF-1F23
D:.
│   roleUp.md
│
└───NetAPI
    │   appsettings.Development.json
    │   appsettings.json
    │   NetAPI.csproj
    │   NetAPI.http
    │   Program.cs
    │
    ├───obj
    │       NetAPI.csproj.nuget.dgspec.json
    │       NetAPI.csproj.nuget.g.props
    │       NetAPI.csproj.nuget.g.targets
    │       project.assets.json
    │       project.nuget.cache
    │
    └───Properties
            launchSettings.json
```

---

# 4️⃣ Restaurar dependencias

```powershell
dotnet restore
```

---

# 5️⃣ Ejecutar la API

```powershell
dotnet run
```

Salida esperada:

```
Now listening on: https://localhost:5001
```

Abrir en el navegador:

```
https://localhost:5001/swagger
```

Si Swagger carga correctamente, la API está funcionando.

---

# 6️⃣ Crear proyecto con nombre personalizado

Si se desea especificar el nombre del proyecto:

```powershell
dotnet new webapi -n NetApiProject
```

Luego:

```powershell
cd NetApiProject
dotnet run
```

---

# 7️⃣ Abrir el proyecto en VS Code

Desde el directorio del proyecto:

```powershell
code .
```

Instalar la extensión oficial de **C#** si no está instalada.

---

# ✅ Resultado

Se crea una API funcional en .NET lista para:

- Agregar controladores
- Implementar servicios
- Conectar base de datos
- Configurar autenticación
- Aplicar arquitectura limpia
- Dockerizar el proyecto

---

📄 Documento actualizado para incluir instalación completa del SDK de .NET y proceso de inicialización del proyecto Web API.
