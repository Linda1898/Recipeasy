from application import db
from dataclasses import dataclass


@dataclass
class Ingredient(db.Model):
    # the declarations below are important for turning the object into JSON
    ingredient_id: int
    category: str

    ingredient_id = db.Column(db.Integer, primary_key=True)
    food_id = db.Column(db.Integer, db.ForeignKey('food_item.food_id'), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipe.recipe_id'), nullable=False)
    category = db.Column(db.String(50))
