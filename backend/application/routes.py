from flask import Flask, request, jsonify
from application import app, db
from application.models import *
import requests
import random

@app.route('/backend', methods=['GET'])
def post_numbers():
    userName = Users.query.all()
    users = []
    for user in userName:
        users.append(user.as_dict())
    return jsonify(users)