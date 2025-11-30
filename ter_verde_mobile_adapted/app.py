import os
from flask import Flask, render_template

try:
    from dotenv import load_dotenv
    load_dotenv()
except Exception:
    pass

app = Flask(__name__)

@app.route('/')
def index():
    parks = [
        {'id': 1, 'name': 'Parque Nacional', 'summary': 'Parque com belíssimas trilhas e cachoeiras.'},
        {'id': 2, 'name': 'Parque Municipal', 'summary': 'Área de lazer e piqueniques.'}
    ]
    return render_template('index.html', parks=parks)

@app.route('/parque/<int:id>')
def parque(id):
    park = {'id': id, 'name': f'Parque {id}', 'description': 'Descrição completa do parque.'}
    trails = [{'name': 'Trilha A', 'difficulty': 'Médio'}, {'name': 'Trilha B', 'difficulty': 'Fácil'}]
    events = [{'title': 'Caminhada ecológica', 'date': '2025-08-15'}]
    return render_template('parque.html', park=park, trails=trails, events=events)

@app.route('/trilhas')
def trilhas():
    return render_template('trilhas.html')

@app.route('/eventos')
def eventos():
    return render_template('eventos.html')

if __name__ == '__main__':
    debug = os.getenv('DEBUG', 'True')
    debug_flag = False if str(debug).lower() in ('0', 'false', 'no') else True
    port = int(os.getenv('PORT', 5000))
    host = os.getenv('HOST', '127.0.0.1')

    app.run(debug=debug_flag, host=host, port=port)
