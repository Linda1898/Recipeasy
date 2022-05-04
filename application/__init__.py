from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from os import getenv
# create a new instance of Flask and store it in app
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:Lexie789@localhost/Foodstories2504"
# app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://username:password@host/database_name"
# app.config['SQLALCHEMY_DATABASE_URI']=('mysql+pymysql://' + getenv('MYSQL_USER') + ':' + getenv('MYSQL_PASSWORD') + '@' + getenv('MYSQL_HOST') + '/' + getenv('MYSQL_DB'))
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# secret key needs to be changed to something secret and randomly generated
app.config['SECRET_KEY'] = 'YOUR_SECRET_KEY'


# link our app to the persistence layer
db = SQLAlchemy(app)