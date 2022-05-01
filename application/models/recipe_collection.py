from application import db
from dataclasses import dataclass

@dataclass
class RecipeCollection(db.Model):
    # the declarations below are important for turning the object into JSON
    recipe_collection_id: int

    recipe_collection_id = db.Column(db.Integer, primary_key=True)
    collection_id = db.Column(db.Integer, db.ForeignKey('collection.collection_id'), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipe.recipe_id'), nullable=False)

