import pytest
from app import app

@pytest.fixture
def client():
    """
    Fixture para crear un cliente de prueba de Flask
    """
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

class TestApiEndpoints:
    """
    Suite de pruebas para los endpoints de la API
    """

    def test_api_saludar_con_parametro(self, client):
        """
        Prueba el endpoint /api con parámetro mensaje
        """
        response = client.get('/api?mensaje=mundo')
        assert response.status_code == 200
        assert response.json['mensaje'] == 'Hola mundo desde la API de Python'

    def test_api_saludar_sin_parametro(self, client):
        """
        Prueba el endpoint /api sin parámetro
        """
        response = client.get('/api')
        assert response.status_code == 200
        assert response.json['mensaje'] == 'Hola  desde la API de Python'

    def test_api_saludar_con_espacios(self, client):
        """
        Prueba el endpoint /api con espacios en la cadena
        """
        response = client.get('/api?mensaje=hola mundo')
        assert response.status_code == 200
        assert response.json['mensaje'] == 'Hola hola mundo desde la API de Python'

    def test_api_concatenar_con_parametro(self, client):
        """
        Prueba el endpoint /api/concatenar con parámetro texto
        """
        response = client.get('/api/concatenar?texto=usuario')
        assert response.status_code == 200
        assert response.json['resultado'] == 'Hola usuario desde la API de Python'

    def test_api_concatenar_sin_parametro(self, client):
        """
        Prueba el endpoint /api/concatenar sin parámetro
        """
        response = client.get('/api/concatenar')
        assert response.status_code == 200
        assert response.json['resultado'] == 'Hola  desde la API de Python'

    def test_api_concatenar_con_caracteres_especiales(self, client):
        """
        Prueba el endpoint /api/concatenar con caracteres especiales
        """
        response = client.get('/api/concatenar?texto=Python@123')
        assert response.status_code == 200
        assert response.json['resultado'] == 'Hola Python@123 desde la API de Python'

    def test_api_content_type(self, client):
        """
        Verifica que la respuesta sea JSON
        """
        response = client.get('/api?mensaje=test')
        assert response.content_type == 'application/json'

    def test_api_endpoint_no_existe(self, client):
        """
        Prueba que acceder a un endpoint inexistente devuelve 404
        """
        response = client.get('/api/inexistente')
        assert response.status_code == 404

    def test_api_solo_acepta_get(self, client):
        """
        Prueba que solo se acepta GET, no POST
        """
        response = client.post('/api?mensaje=test')
        assert response.status_code == 405  # Method Not Allowed
