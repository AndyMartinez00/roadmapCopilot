from flask import Flask, request

app = Flask(__name__)

@app.route('/api', methods=['GET'])
def saludar():
    """
    Endpoint GET que concatena 'Hola' + cadena de entrada + ' desde la API de Python'
    Parámetro: ?mensaje=tu_cadena
    """
    cadena_entrada = request.args.get('mensaje', '')
    respuesta = f"Hola {cadena_entrada} desde la API de Python"
    return {'mensaje': respuesta}

@app.route('/api/concatenar', methods=['GET'])
def concatenar():
    """
    Endpoint alternativo con parámetro 'texto'
    """
    texto = request.args.get('texto', '')
    resultado = f"Hola {texto} desde la API de Python"
    return {'resultado': resultado}

if __name__ == '__main__':
    app.run(debug=True, port=5000)
