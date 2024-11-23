from . import db
from .models import CityPartNeighbor

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

def get_relevant_city_parts(user):
    """
    Return a list of relevant city parts based on the user's radius preference.
    
    Args:
        user (User): The user whose preferences are to be checked.
    
    Returns:
        list: A list of relevant city part IDs.
    """
    if user.radius_preference == 0:
        return []  # No notifications for this user
    elif user.radius_preference == 1:
        return [user.city_part_id]  # Only the user's own city part
    elif user.radius_preference == 2:
        # Get the user's city part and its neighbors
        relevant_city_parts = [user.city_part_id]
        neighbors = db.session.query(CityPartNeighbor).filter(
            CityPartNeighbor.city_part_id == user.city_part_id
        ).all()
        relevant_city_parts.extend([neighbor.neighbor_id for neighbor in neighbors])
        return relevant_city_parts