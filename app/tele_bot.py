import asyncio
from telegram import Bot

class TelegramBot:
    def __init__(self, token):
        self.bot = Bot(token=token)

    async def send_message(self, telegram_id, message):
        try:
            response = await self.bot.send_message(chat_id=telegram_id, text=message)
            print(f"Nachricht erfolgreich gesendet: {response}")
            return response
        except Exception as e:
            print(f"Fehler beim Senden der Nachricht an {telegram_id}: {e}")
            raise e

    def send_message_sync(self, telegram_id, message):
        asyncio.run(self.send_message(telegram_id, message))
