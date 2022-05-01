from application import db


def add_new_user(user):
    db.session.add(user)
    db.session.commit()
