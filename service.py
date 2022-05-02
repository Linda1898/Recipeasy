from application import db
from application.models.recipe import Recipe



def add_new_user(user):
    db.session.add(user)
    db.session.commit()

def get_recipe_dict(id):
    if id > 0:
        return Recipe.query.get(id)
    else:
        return none