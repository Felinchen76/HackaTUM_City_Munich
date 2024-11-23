from datetime import datetime

from sqlalchemy import and_

from . import db
from ..tele_bot import TelegramBot


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
        from .user import User
        from .user_interest import UserInterest
        from .category import Category

        print("###########################################")

        # get categories
        users_with_interests = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id
        ).all()
        print(f"Users with interests: {[(u.user_id, u.telegram_id) for u in users_with_interests]}")
        # category filter
        category_ids = [category.category_id for category in self.categories]
        user_interests = db.session.query(UserInterest).filter(
            UserInterest.category_id.in_(category_ids)
        ).all()
        print(user_interests)
        relevant_users = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id
        ).join(
            Category, UserInterest.category_id == Category.category_id
        ).filter(
            Category.category_id.in_([category.category_id for category in self.categories])
        ).all()
        print(f"Relevant users (by category): {[(u.user_id, u.telegram_id) for u in relevant_users]}")

        # Telegram-ID
        user = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id
        ).join(
            Category, UserInterest.category_id == Category.category_id
        ).filter(and_(
            Category.category_id.in_([category.category_id for category in self.categories]),
            User.telegram_id == 7098929783
        )).all()

        print(f"Matching users count: {len(user)}")

        # initialize bot
        bot = TelegramBot('7607839281:AAFNEwd7inyHZ4bOaP1L5QpAmX2Zhpx_re0')

        # send message
        for u in user:
            print(f"User {user.name} sollte über den neuen Post benachrichtigt werden: {self.title}")
            bot.send_message(user.telegram_id, f"Neuer Post: {self.title}\n{self.content}")
