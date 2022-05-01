from application import db
from dataclasses import dataclass


@dataclass
class Gender(db.Model):
    # the declarations below are important for turning the object into JSON
    gender_id: int
    gender_name: str

    gender_id = db.Column(db.Integer, primary_key=True)
    gender_name = db.Column(db.String(20), nullable=False)

    user_table = db.relationship('UserTable', backref='user_table')