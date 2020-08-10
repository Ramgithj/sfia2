from flask import Flask, request, render_template
from application import app
import random
import requests

@app.route('/', methods=['GET'])
def get_users():
    response = requests.get('http://backend:5000/backend').json()
    return render_template('index.html', title='Home', response=response)
