from datetime import datetime

from telegram import Bot
from telegram.error import TelegramError

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


    def __init__(self, title, content, orga_id):
        self.title = title
        self.content = content
        self.orga_id = orga_id

    def match_with_users(self):
        from user import User
        from user_interest import UserInterest
        from category import Category
        print("match_with_users() Methode wird aufgerufen.")  # Debugging

        user = db.session.query(User).join( ### DUMMY USER
            UserInterest, User.user_id == UserInterest.user_id
        ).join(
            Category, UserInterest.category_id == Category.category_id
        ).filter(
            Category.category_id.in_([category.category_id for category in self.categories])
        .filter(
            User.telegram_id == 7098929783)
        .all())

        print(f"Matching users count: {len(user)}")

        #for user in matching_user:
        print(f"User {user.name} should be notified about new post: {self.title}")
        self.send_telegram_message(user.telegram_id, f"New post: {self.title}\n{self.content}")

        bot = TelegramBot('7607839281:AAFNEwd7inyHZ4bOaP1L5QpAmX2Zhpx_re0')

        #for user in matching_user:
        print(f"User {user.name} sollte über den neuen Post benachrichtigt werden: {self.title}")
        bot.send_message(user.telegram_id, f"Neuer Post: {self.title}\n{self.content}")

