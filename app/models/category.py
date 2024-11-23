from flask_sqlalchemy import SQLAlchemy
from . import db


class Category(db.Model):
    __tablename__ = 'categories'
    category_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), unique=True)

