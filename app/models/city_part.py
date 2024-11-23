from . import db

class CityPart(db.Model):
    __tablename__ = 'city_parts'

    city_part_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    neighbors = db.relationship(
        'CityPart',
        secondary='city_part_neighbors',
        primaryjoin='CityPart.city_part_id==CityPartNeighbor.city_part_id',
        secondaryjoin='CityPart.city_part_id==CityPartNeighbor.neighbor_id',
        backref='neighboring_to'
    )

class CityPartNeighbor(db.Model):
    __tablename__ = 'city_part_neighbors'

    city_part_id = db.Column(db.Integer, db.ForeignKey('city_parts.city_part_id'), primary_key=True)
    neighbor_id = db.Column(db.Integer, db.ForeignKey('city_parts.city_part_id'), primary_key=True)
