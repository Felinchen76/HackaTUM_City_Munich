import asyncio
import os
from datetime import datetime

from sqlalchemy.orm import aliased

from . import db
from ..tele_bot import TelegramBot

from playsound import playsound


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

    def match_with_users(self, category_id):
        from .user import User
        from .user_interest import UserInterest

        # nutzer mit demselben Interesse filtern wie in dem Post angelegt wurde
        user_with_interest_query = db.session.query(User).join(
            UserInterest, User.user_id == UserInterest.user_id).filter(
            UserInterest.category_id == category_id
        ).subquery()
        # Alias damit ich subquery wie tabelle behandeln kann
        user_with_interest = aliased(User, user_with_interest_query)

        # TODO limit for event invitation

        # TODO check for distance

        # TODO check for message or call
        # der Einfachheit halber temporär für den Prototyp
        # check ob Telegram ID hinterlegt ist, wenn ja dann message, sonst call
        message_users = db.session.query(user_with_interest).filter(
            User.telegram_id.isnot(None)
        ).all()

        for user in message_users:
            print(user)

        # muss innerhalb der relevanten user filter
        call_users = db.session.query(user_with_interest).filter(
            User.phone_number.isnot(None)
        ).all()

        print(f"anzahl user telegram: {len(message_users)}")
        print(f"anzahl user call: {len(message_users)}")

        for message_user in message_users:
            asyncio.run(self.message_users_action(message_user))

        for call_user in call_users:
            self.call_users_action(call_user)

    async def message_users_action(self, user):
        import os
        from dotenv import load_dotenv
        # load envs
        load_dotenv()
        bot_token = os.getenv('BOT_TOKEN')

        # initialize bot
        bot = TelegramBot(bot_token)

        try:  # send message
            print(f"User {user.name} sollte über den neuen Post benachrichtigt werden: {self.title}")
            response = await bot.send_message(user.telegram_id, f"Neuer Post: {self.title}\n{self.content}")
            print('Nachricht erfolgreich gesendet:', response)
        except Exception as e:
            print(f"Fehler beim Senden der Nachricht an {user.name}: {e}")

    def call_users_action(self, user):
        # call simulieren. da twilio api zur demo nicht verwendet werden soll
        base_dir = os.path.dirname(os.path.abspath(__file__))
        mp3_path = os.path.join(base_dir, '..', '..', 'static', 'alert.mp3')
        if os.path.exists(mp3_path):
            playsound(mp3_path)
        else:
            print(f"Datei nicht gefunden")