from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, PasswordField, SubmitField


class SearchForm (FlaskForm):
    search = StringField('')
    # TODO: try and except if this needs to be unique
    # user_age = IntegerField ('Age')
    submit = SubmitField('Search')