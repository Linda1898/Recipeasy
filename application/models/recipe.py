from application import db
from dataclasses import dataclass


@dataclass
class Recipe(db.Model):
    # the declarations below are important for turning the object into JSON
    recipe_id: int
    recipe_name: str
    recipe_description: str
    recipe_method: str
    ingredient_quantity: str
    course: str
    cuisine: str
    prep_time: str
    cook_time: str
    serving: int
    collection_id: int

    recipe_id = db.Column(db.Integer, primary_key=True)
    recipe_name = db.Column(db.String(50))
    recipe_description = db.Column(db.String(200))
    recipe_method = db.Column(db.String(1500), nullable=False)
    ingredient_quantity = db.Column(db.String(1000), nullable=False)
    course = db.Column(db.String(20), nullable=False)
    cuisine = db.Column(db.String(30), nullable=False)
    prep_time = db.Column(db.String(20), nullable=False)
    cook_time = db.Column(db.String(20), nullable=False)
    serving = db.Column(db.Integer, nullable=False)
    collection_id = db.Column(db.Integer, nullable=False)

    ingredient = db.relationship('Ingredient', backref='ingredient2')
    recipe_collection = db.relationship('RecipeCollection', backref='recipe_collection2')
    liked = db.relationship('Liked', backref='liked1')
