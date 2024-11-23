from telegram import Bot
from telegram.error import TelegramError

class TelegramBot:
    def __init__(self, token):
        self.bot = Bot(token=token)

    def send_message(self, telegram_id, message):
        """Sendet eine Nachricht an einen Benutzer via Telegram."""
        try:
            self.bot.send_message(chat_id=telegram_id, text=message)
        except TelegramError as e:
            print(f"Fehler beim Senden der Nachricht an {telegram_id}: {e}")
