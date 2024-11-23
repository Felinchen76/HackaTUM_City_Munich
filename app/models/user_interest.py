
from . import db


class UserInterest(db.Model):
    __tablename__ = 'user_interests'
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey('categories.category_id'), primary_key=True)