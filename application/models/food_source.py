from application import db
from dataclasses import dataclass


@dataclass
class FoodSource(db.Model):
    # the declarations below are important for turning the object into JSON
    source_id: int
    source_name: str
    source_image: str
    source_fact1: str
    source_fact2: str
    source_fact3: str

    source_id = db.Column(db.Integer, primary_key=True)
    source_name = db.Column(db.String(15))
    source_image = db.Column(db.String(200))
    source_fact1 = db.Column(db.String(500))
    source_fact2 = db.Column(db.String(500))
    source_fact3 = db.Column(db.String(500))

    food_item = db.relationship('FoodItem', backref='food_item2')
