import telebot
import configparser
import logging
from Helpers.DatabaseHelper import DatabaseHelper
from Classes.Enums import Roles


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
    log_level = logging.DEBUG
    log_fmt = '[%(levelname)s] %(asctime)s - %(message)s'
    logging.basicConfig(level=log_level, format=log_fmt)
    admin_dict = Roles.Admin.value
    logging.info(admin_dict[0])

    DatabaseHelper.open_connection()
    query = "Select Name from roles"

    cursor = DatabaseHelper.execute_query(query)

    for Name in cursor:
        logging.info(Name)

    DatabaseHelper.close_connection()

    bot.polling(none_stop=True)
