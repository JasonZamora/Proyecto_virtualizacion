from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def home():
    return '¡Bienvenido! Para sumar los números, visita /sumar/{numero}'

@app.route('/sumar/<int:numero>')
def sumar_numeros(numero):
    resultado = sum(range(numero + 1))
    return f'La suma de los números del 0 al {numero} es: {resultado}'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')