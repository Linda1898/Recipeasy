from application import db
from dataclasses import dataclass


@dataclass
class Liked(db.Model):
    # the declarations below are important for turning the object into JSON
    liked_id: int

    liked_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user_table.user_id'), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipe.recipe_id'), nullable=False)