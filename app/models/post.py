from datetime import datetime

from . import db


class Post(db.Model):
    __tablename__ = 'posts'

    post_id = db.Column(db.Integer, primary_key=True)
    orga_id = db.Column(db.Integer, db.ForeignKey('organizations.orga_id'), nullable=False)
    title = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    city_part_id = db.Column(db.Integer, db.ForeignKey('city_parts.city_part_id'), nullable=False)



    categories = db.relationship('Category', secondary='post_categories', backref='posts')


    def __init__(self, title, content, orga_id):
        self.title = title
        self.content = content
        self.orga_id = orga_id

    def match_with_users(self):
        from user import User
        from user_interest import UserInterest
        from category import Category
        # i want to have all users that are interested in the category and send them a notification
        matching_users = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id  # link user with userinterest
        ).join(
            Category, UserInterest.category_id == Category.category_id  # link userinterest with category
        ).filter(
            Category.category_id.in_([category.category_id for category in self.categories])
            # Filter filter for category of post
        ).all()

        #depending on user's preference they will get informed about events in their city part/neighboring city parts regardless of their categories too
        for user in User.query.filter(User.city_part_id.isnot(None)).all():
            relevant_city_parts = get_relevant_city_parts(user)
            if self.city_part_id in relevant_city_parts:
                matching_users.append(user)

        for user in matching_users:
            print(f"User {user.name} should be notified about new post: {self.title}")