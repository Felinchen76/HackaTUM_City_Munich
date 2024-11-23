from flask import Flask

from .models import db
from .routes import register_routes

def create_app():
    app = Flask(__name__, template_folder='../templates')
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost/user_management_db_hackatum'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # initialize db
    db.init_app(app)

    # register routes
    register_routes(app)

    return app

