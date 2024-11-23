from datetime import datetime
from . import db

class Organization(db.Model):
    __tablename__ = 'organizations'

    orga_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())

    # Eine Organisation hat viele Posts (1:n Beziehung)
    posts = db.relationship('Post', back_populates='organization', cascade='all, delete-orphan')
