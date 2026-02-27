package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
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
		Message: "Bienvenido a la API Go con Gorilla 🦍",
		Status:  "success",
	}
	json.NewEncoder(w).Encode(response)
}

// Handler para GET /api/users
func handleGetUsers(w http.ResponseWriter, r *http.Request) {
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

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// Handler para POST /api/users
func handleCreateUser(w http.ResponseWriter, r *http.Request) {
	var user map[string]interface{}
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		http.Error(w, "Error al decodificar JSON", http.StatusBadRequest)
		return
	}

	response := Response{
		Message: "Usuario creado exitosamente",
		Status:  "success",
		Data:    user,
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(response)
}

// Handler para GET /api/health
func handleHealth(w http.ResponseWriter, r *http.Request) {
	response := Response{
		Message: "API funcionando correctamente",
		Status:  "healthy",
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func main() {
	r := mux.NewRouter()

	// Definir rutas con métodos estrictos
	r.HandleFunc("/", handleRoot).Methods("GET")
	r.HandleFunc("/api/health", handleHealth).Methods("GET")
	r.HandleFunc("/api/users", handleGetUsers).Methods("GET")
	r.HandleFunc("/api/users", handleCreateUser).Methods("POST")

	port := ":8080"
	fmt.Printf("🚀 Servidor iniciado en http://localhost%s\n", port)

	log.Fatal(http.ListenAndServe(port, r))
}
