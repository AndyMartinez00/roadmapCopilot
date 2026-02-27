# saber la version

Ran terminal command: go version

✅ **Go está instalado en tu equipo.** Tienes la versión **go1.26.0** para Windows 64-bit.

Para futuras verificaciones, puedes usar estos comandos:

- **`go version`** - Muestra la versión instalada (lo que acabamos de ejecutar)
- **`where go`** pwshell[ Get-Command go | Select-Object Source] - Muestra la ruta de instalación de Go
- **`go help`** - Muestra la ayuda general de Go

# 🚀 Crear una API en Go – Proyecto `goApi`

Esta guía explica paso a paso cómo crear una API básica en Go utilizando `net/http`.

---

## 📁 1. Crear el directorio del proyecto

```bash
mkdir goApi
cd goApi
```

---

## 📦 2. Inicializar el módulo Go

```bash
go mod init goApi
```

Esto creará el archivo:

```
go.mod
```

---

## 🧠 3. Crear el archivo principal

```bash
touch main.go
```

---

## 🧩 4. Código básico de la API

Abrir `main.go` y pegar el siguiente código:

```go
package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Message struct {
	Message string `json:"message"`
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	response := Message{Message: "API funcionando correctamente 🚀"}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func main() {
	http.HandleFunc("/", homeHandler)

	port := "8080"
	log.Println("Servidor corriendo en puerto", port)

	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatal("Error iniciando servidor:", err)
	}
}
```

---

## ▶️ 5. Ejecutar la API

```bash
go run main.go
```

Salida esperada en consola:

```
Servidor corriendo en puerto 8080
```

---

## 🌐 6. Probar en el navegador

Abrir:

```
http://localhost:8080
http://localhost:8080/api/users
```

Respuesta esperada:

```json
{
  "message": "API funcionando correctamente 🚀"
}
```

---

# 🧱 Estructura recomendada para proyectos más grandes

```
goApi/
│
├── go.mod
├── main.go
└── handlers/
    └── home.go
```

---

# 🚀 Próximos pasos posibles

Puedes mejorar esta API agregando:

- 🔹 Framework como Gin o Fiber
- 🔹 Conexión a base de datos (PostgreSQL / MySQL)
- 🔹 JWT para autenticación
- 🔹 Middleware
- 🔹 Docker
- 🔹 Arquitectura limpia (Clean Architecture)

---

Listo ✅
Tu API en Go ya está funcionando.
