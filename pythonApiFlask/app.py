from flask import Flask, request
from flasgger import Swagger

app = Flask(__name__)
swagger = Swagger(app)

@app.route('/api', methods=['GET'])
def saludar():
    """
    Concatena 'Hola' con la entrada y ' desde la API de Python'
    ---
    parameters:
      - name: mensaje
        in: query
        type: string
        required: false
        description: Cadena de texto a concatenar
    responses:
      200:
        description: Resultado de la concatenación
        schema:
          properties:
            mensaje:
              type: string
              example: "Hola mundo desde la API de Python"
    """
    cadena_entrada = request.args.get('mensaje', '')
    respuesta = f"Hola {cadena_entrada} desde la API de Python"
    return {'mensaje': respuesta}

@app.route('/api/concatenar', methods=['GET'])
def concatenar():
    """
    Endpoint alternativo que concatena 'Hola' con la entrada y ' desde la API de Python'
    ---
    parameters:
      - name: texto
        in: query
        type: string
        required: false
        description: Cadena de texto a concatenar
    responses:
      200:
        description: Resultado de la concatenación
        schema:
          properties:
            resultado:
              type: string
              example: "Hola usuario desde la API de Python"
    """
    texto = request.args.get('texto', '')
    resultado = f"Hola {texto} desde la API de Python"
    return {'resultado': resultado}

if __name__ == '__main__':
    app.run(debug=True, port=5000)
