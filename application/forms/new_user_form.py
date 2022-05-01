from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, PasswordField, SubmitField


class SignUpForm (FlaskForm):
    username = StringField('Username')
    # TODO: try and except if this needs to be unique
    password = PasswordField('Password')
    user_name = StringField('Name or Nickname')
    # user_age = IntegerField ('Age')
    submit = SubmitField ('Sign up')
