from application import db
from dataclasses import dataclass


@dataclass
class UserTable(db.Model):
    # the declarations below are important for turning the object into JSON
    user_id: int
    user_name: str
    user_surname: str
    user_age: int
    username: str
    password: str

    user_id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(20), nullable=False)
    user_surname = db.Column(db.String(30))
    gender_id = db.Column(db.Integer, db.ForeignKey('gender.gender_id'))
    user_age = db.Column(db.Integer)
    username = db.Column(db.String(20), nullable=False)
    password = db.Column(db.String(100))

    liked = db.relationship('Liked', backref='liked2')

# TODO: is user's password (varbinary) saved as a str?
# TODO for float (10) do we save like this:db.Column(db.Float(precision=None, asdecimal=False, decimal_return_scale=None, nullable=False) or is this ok db.Column(db.Float, nullable=False)
# TODO: gender need to be a drop down, gender, age surname all optional? Name can be a nickname and used for welcome page?
# TODO: how to make username unique and password default null?
# TODO: gender foreign key in user table
    # TODO: password hash thing
    # todo:make the classes
    # todo image in sql just set up like you did login
    # todo varbinary and not null check with alex first then ask martina
    # todo add my template to lexies template working