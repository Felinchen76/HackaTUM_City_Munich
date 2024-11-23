from . import db

class User(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    surname = db.Column(db.String(100), nullable=False)
    telegram_id = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())
    city_part_id = db.Column(db.Integer, db.ForeignKey('city_parts.city_part_id'), nullable=True)
    radius_preference = db.Column(db.Integer, default=0)  # 0: inform about nothing, 1: own city part, 2: own city part and neighbors


    def __init__(self, name, surname, telegram_id, password):
        self.name = name
        self.surname = surname
        self.telegram_id = telegram_id
        self.password = password