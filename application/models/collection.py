from application import db
from dataclasses import dataclass

# @dataclass(frozen=True, order=True)
@dataclass
class Collection(db.Model):
    # the declarations below are important for turning the object into JSON
    collection_id: int
    collection_name: str
    collection_description: str

    collection_id = db.Column(db.Integer, primary_key=True)
    collection_name = db.Column(db.String(50))
    collection_description = db.Column(db.String(100))

    recipe_collection = db.relationship('RecipeCollection', backref='recipe_collection1')
