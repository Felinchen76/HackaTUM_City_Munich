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
    radius_preference = db.Column(db.Integer, default=1)  # 0: inform about nothing, 1: own city part, 2: own city part and neighbors
    birthdate = db.Column(db.Date, nullable=False)
    phone_number = db.Column(db.Integer, nullable=False)

    @property
    def age(self):
        today = datetime.today()
        return today.year - self.birthdate.year - ((today.month, today.day) < (self.birthdate.month, self.birthdate.day))


    def __init__(self, name, surname, telegram_id, password, city_part_id, radius_preference, birthdate, phone_number):
        self.name = name
        self.surname = surname
        self.telegram_id = telegram_id
        self.password = password
        self.city_part_id = city_part_id
        self.radius_preference = radius_preference
        self.birthdate = birthdate
        self.phone_number = phone_number