package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

// Response estructura para las respuestas de la API
type Response struct {
	Message string `json:"message"`
	Status  string `json:"status"`
	Data    interface{} `json:"data,omitempty"`
}

// Handler para la ruta raíz
func handleRoot(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	response := Response{
		Message: "Bienvenido a la API Go",
		Status:  "success",
	}
	json.NewEncoder(w).Encode(response)
}

// Handler para GET /api/users
func handleGetUsers(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	users := []map[string]interface{}{
		{"id": 1, "name": "Juan"},
		{"id": 2, "name": "María"},
		{"id": 3, "name": "Carlos"},
	}

	response := Response{
		Message: "Usuarios obtenidos exitosamente",
		Status:  "success",
		Data:    users,
	}
	json.NewEncoder(w).Encode(response)
}

// Handler para POST /api/users
func handleCreateUser(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		return
	}

	var user map[string]interface{}
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		http.Error(w, "Error al decodificar JSON", http.StatusBadRequest)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	response := Response{
		Message: "Usuario creado exitosamente",
		Status:  "success",
		Data:    user,
	}
	json.NewEncoder(w).Encode(response)
}

// Handler para GET /api/health
func handleHealth(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	response := Response{
		Message: "API funcionando correctamente",
		Status:  "healthy",
	}
	json.NewEncoder(w).Encode(response)
}

func main() {
	// Rutas
	http.HandleFunc("/", handleRoot)
	http.HandleFunc("/api/health", handleHealth)
	http.HandleFunc("/api/users", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet {
			handleGetUsers(w, r)
		} else if r.Method == http.MethodPost {
			handleCreateUser(w, r)
		} else {
			http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		}
	})

	// Puerto
	port := ":8080"
	fmt.Printf("🚀 Servidor iniciado en http://localhost%s\n", port)
	log.Fatal(http.ListenAndServe(port, nil))
}
