from application import db
from dataclasses import dataclass


@dataclass
class Nutrition(db.Model):
    # the declarations below are important for turning the object into JSON
    nutrition_id: int
    energy_kcal: int
    energy_kj: int
    fat: float
    saturate: float
    carbohydrate: float
    sugar: float
    starch: float
    fibre: float
    protein: float
    salt: float

    nutrition_id = db.Column(db.Integer, primary_key=True)
    energy_kcal = db.Column(db.Integer)
    energy_kj = db.Column(db.Integer)
    fat = db.Column(db.Float)
    saturate = db.Column(db.Float)
    carbohydrate = db.Column(db.Float)
    sugar = db.Column(db.Float)
    starch = db.Column(db.Float)
    fibre = db.Column(db.Float)
    protein = db.Column(db.Float)
    salt = db.Column(db.Float)

    food_item = db.relationship('FoodItem', backref='food_item3')

#     TODO: ask Martina if we need to call any collumn that uses a forgeign ID we need to use a different collumn name
#       to the one we take the foreign id from. As in when her heroes table took id from teams it called the collumn
#           teamsid not id. However this may have only been because she already had a collumn with the name id
