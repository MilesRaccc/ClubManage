import telebot
import configparser
from Services.DatabaseHelper import DatabaseHelper


config = configparser.ConfigParser()
config.read("settings.ini")
bot = telebot.TeleBot(config["Bot"]["token"], parse_mode=None)


@bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    bot.reply_to(message, "Howdy, how are you doing?")


@bot.message_handler(func=lambda message: True)
def echo_all(message):
    bot.reply_to(message, message.text)


if __name__ == '__main__':
    dbHelper = DatabaseHelper()
    dbHelper.open_connection()
    query = ""

    cursor = dbHelper.execute_query(query)

    for Name in cursor:
        print(Name)

    print(cursor.column_names)
    dbHelper.close_connection()

    bot.polling(none_stop=True)
