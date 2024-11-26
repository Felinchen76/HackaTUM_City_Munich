from datetime import timedelta

from flask import Flask

from .models import db
from .routes import register_routes

import os
from dotenv import load_dotenv

def create_app():

    # load envs
    load_dotenv()
    app = Flask(__name__, template_folder='../templates', static_folder='../static')
    app.secret_key = 'SECRET_KEY'
    app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=130)

    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # initialize db
    db.init_app(app)

    # register routes
    register_routes(app)


    return app

