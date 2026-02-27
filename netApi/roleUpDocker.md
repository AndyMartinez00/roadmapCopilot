# 📦 Dockerización de Proyecto .NET Web API (NetAPI)

## 🎯 Objetivo

Preparar la Web API para ejecutarse dentro de un contenedor Docker, lista para despliegue en entornos locales o productivos.

---

# 🐳 1️⃣ Crear Dockerfile

Ubicado en la raíz del proyecto (`NetAPI/`):

```dockerfile
# --------- Etapa de build ---------
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /app

# Copiar archivo de proyecto y restaurar dependencias
COPY NetAPI.csproj ./
RUN dotnet restore

# Copiar todo el código
COPY . ./

# Publicar aplicación en modo Release
RUN dotnet publish -c Release -o out

# --------- Etapa runtime ---------
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app

# Copiar archivos publicados
COPY --from=build /app/out .

# Configurar puerto
ENV ASPNETCORE_URLS=http://+:8083
EXPOSE 8083

ENTRYPOINT ["dotnet", "NetAPI.dll"]
```

---

# 🚫 2️⃣ Crear .dockerignore

Archivo en la raíz del proyecto:

```
bin/
obj/
.git/
.vscode/
```

---

# 🏗 3️⃣ Construir imagen Docker

Desde la carpeta donde está el Dockerfile:

```bash
docker build -t netapi-image .
run -d --name netapi-container -p 8083:8083 netapi-image
```

---

# ▶️ 4️⃣ Ejecutar contenedor

```bash
docker run -p 8083:8083 netapi-image
```

---

# 🌐 5️⃣ Probar API

Abrir en navegador:

```
http://localhost:8083/weatherforecast
```

Si responde correctamente, la API está funcionando dentro de Docker.

---

# ✅ Resultado Final

La Web API ahora:

- ✔ Ejecuta localmente con `dotnet run`
- ✔ Ejecuta dentro de Docker
- ✔ Expone puerto 8080
- ✔ Lista para despliegue en Azure, AWS, VPS o Kubernetes

---

# 🚀 Próximos pasos recomendados

- Agregar docker-compose
- Conectar base de datos en contenedor
- Configurar variables de entorno
- Preparar entorno productivo

---

📄 Documento de configuración Docker para proyecto NetAPI.
docker stop netapi-container
doccker images
docker rmi -f netapi-image
docker system prune -a -f
