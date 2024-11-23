from datetime import datetime
from . import db
from playsound import playsound
from .user import User
from .user_interest import UserInterest
from .category import Category
from .user import get_relevant_city_parts

class Post(db.Model):
    __tablename__ = 'posts'
    post_id = db.Column(db.Integer, primary_key=True)
    orga_id = db.Column(db.Integer, db.ForeignKey('organizations.orga_id'), nullable=False)
    title = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    city_part_id = db.Column(db.Integer, db.ForeignKey('city_parts.city_part_id'), nullable=False)


    categories = db.relationship('Category', secondary='post_categories', back_populates='posts')
    organization = db.relationship('Organization', back_populates='posts')
    city_part = db.relationship('city_part', backref='posts')

    def __init__(self, title, content, orga_id, city_part_id):
        self.title = title
        self.content = content
        self.orga_id = orga_id
        self.city_part_id = city_part_id


    def match_with_users(self):
        from user import User
        from user_interest import UserInterest
        from category import Category
        matching_users = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id
        ).join(
            Category, UserInterest.category_id == Category.category_id
        ).filter(
            Category.category_id.in_([category.category_id for category in self.categories])
        ).all()

        #depending on user's preference they will get informed about events in their city part/neighboring city parts regardless of their categories too
        for user in User.query.filter(User.city_part_id.isnot(None)).all():
            relevant_city_parts = get_relevant_city_parts(user)
            if self.city_part_id in relevant_city_parts:
                matching_users.append(user)

        for user in matching_users:
            if user.age > 60:
                print(f"Notifying elderly user: {user.name}")
                playsound('old-phone-ringing.mp3')

        for user in matching_users:
            print(f"User {user.name} should be notified about new post: {self.title}")

        # Notify elderly users (over 60) with the ringtone
        
