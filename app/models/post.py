from datetime import datetime
from . import db

class Post(db.Model):
    __tablename__ = 'posts'
    post_id = db.Column(db.Integer, primary_key=True)
    orga_id = db.Column(db.Integer, db.ForeignKey('organizations.orga_id'), nullable=False)
    title = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    categories = db.relationship('Category', secondary='post_categories', back_populates='posts')
    organization = db.relationship('Organization', back_populates='posts')

    def __init__(self, title, content, orga_id):
        self.title = title
        self.content = content
        self.orga_id = orga_id


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

        for user in matching_users:
            print(f"User {user.name} should be notified about new post: {self.title}")
