import telebot
import mysql.connector
import configparser


config = configparser.ConfigParser()
config.read("settings.ini")
bot = telebot.TeleBot(config["Bot"]["token"], parse_mode=None)


@bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    bot.reply_to(message, "Howdy, how are you doing?")


@bot.message_handler(func=lambda message: True)
def echo_all(message):
    # ID = message.chat.id
    bot.reply_to(message, message.text + "\n")


if __name__ == '__main__':
    cnx = mysql.connector.connect(host=config["DB"]["Host"], port=config["DB"]["Port"], user=config["DB"]["User"], passwd=config["DB"]["Password"], db=config["DB"]["Name"])
    cursor = cnx.cursor()
    query = "select Name from roles"

    cursor.execute(query)

    for Name in cursor:
        print(Name)

    cursor.close()
    cnx.close()

    bot.polling(none_stop=True)
