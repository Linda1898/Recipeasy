from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, SubmitField, FloatField


class SearchNutritionForm (FlaskForm):
    search = StringField('Food name')
    quantity = FloatField('Quantity: g')
    # TODO: try and except if this needs to be unique
    # user_age = IntegerField ('Age')
    submit = SubmitField('Search')