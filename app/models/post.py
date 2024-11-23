from flask_sqlalchemy import SQLAlchemy

from . import db


class Post(db.Model):
    __tablename__ = 'posts'
    post_id = db.Column(db.Integer, primary_key=True)
    orga_id = db.Column(db.Integer, db.ForeignKey('organizations.orga_id'), nullable=False)
    title = db.Column(db.String(255))
    content = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())

    organization = db.relationship('Organization', backref='posts')
