from application import db
from application.models.food_group import FoodGroup
from application.models.food_source import FoodSource
from application.models.nutrition import Nutrition
from application.models.gender import Gender
from application.models.user_table import UserTable
from application.models.recipe import Recipe
from application.models.food_item import FoodItem
from application.models.ingredient import Ingredient
from application.models.liked import Liked
from application.models.collection import Collection
from application.models.recipe_collection import RecipeCollection

def get_collection_object(id):
    collection = db.session.query(Collection).filter_by(collection_id=id).first()
    return collection


def get_collection_object_all():
    collection = db.session.query(Collection)
    return collection


def get_food_group_object(id):
    food_group = db.session.query(FoodGroup).filter_by(food_group_id=id).first()
    return food_group


def get_food_item_object(id):
    food_item = db.session.query(FoodItem).filter_by(food_id=id).first()
    return food_item


def get_food_source_object(id):
    food_source = db.session.query(FoodSource).filter_by(source_id=id).first()
    return food_source


def get_gender_object(id):
    gender = db.session.query(Gender).filter_by(gender_id=id).first()
    return gender


def get_ingredient_object(id):
    ingredient = db.session.query(Ingredient).filter_by(ingredient=id).first()
    return ingredient



def get_liked_object(id):
    liked = db.session.query(Liked).filter_by(liked=id).first()
    return liked


def get_nutrition_object(id):
    nutrition = db.session.query(Nutrition).filter_by(nutrition_id=id).first()
    return nutrition

print(get_nutrition_object(4))
def get_recipe_object(id):
    recipe = db.session.query(Recipe).filter_by(recipe_id=id).first()
    return recipe

def get_recipe_object_all():
    recipe = db.session.query(Recipe)
    return recipe

def get_recipe_collection_object(id):
    recipe_collection = db.session.query(RecipeCollection).filter_by(recipe_collection_id=id).first()
    return recipe_collection

def get_user_table_object(id):
    user_table = db.session.query(UserTable).filter_by(user_id=id).first()
    return user_table

def add_new_user(user):
    db.session.add(user)
    db.session.commit()

def get_recipe_dict(id):
    if id > 0:
        return Recipe.query.get(id)
    else:
        return None

def get_recipe_by_foodssource(user_search):
    source_name = user_search.lower()
    group = db.session.query(FoodSource).filter_by(source_name=source_name).first()
    source_id = group.source_id
    food = db.session.query(FoodItem).filter_by(source_id=source_id).first()
    food_id = food.food_id
    ingredient = db.session.query(Ingredient).filter_by(food_id=food_id).first()
    ingredient_id = ingredient.ingredient_id
    recipe = db.session.query(Ingredient).filter_by(ingredient_id=ingredient_id).first()
    recipe_id = recipe.recipe_id
    recipe = db.session.query(Recipe).filter_by(recipe_id=recipe_id).first()
    return recipe



# food = get_food_item_object(1)
# print(food)
# food = food.__dict__
# print(food)
def search_food_facts(user_search):
    source_name = user_search.lower()
    group = db.session.query(FoodSource).filter_by(source_name=source_name).first()
    return group

def get_nutrition_by_name(food_name):
    food_name = food_name.lower()
    food = db.session.query(FoodItem).filter_by(food_name=food_name).first()
    food_id = food.food_id
    nutritionList = db.session.query(Nutrition).filter_by(nutrition_id=food_id).first()
    return nutritionList

def get_environmental_impact(food_name):
    food_name = food_name.lower()
    environment = db.session.query(FoodItem).filter_by(food_name=food_name).first()
    return environment

def get_recipe_matching_collection_id(coll_id):
    recipe_collection = db.session.query(RecipeCollection).filter_by(collection_id=coll_id).first()
    if recipe_collection == None:
        print('nothing found')
    else:
        matching_recipe = recipe_collection.recipe_id
        final_recipes = db.session.query(Recipe).filter_by(recipe_id=matching_recipe).first()
        if final_recipes == None:
            print('No')
        else:
            return final_recipes


# NOT SURE ABOUT FILES BELOW THIS POINT:

def search_recipe():
    search_results = []
    recipe_table = db.session.query(Recipe).all()
    user_search = input('search here for recipes: ')
    print(f"Here are the results that match your search: {user_search}")
    for row in recipe_table:
        if user_search in row.recipe_name or user_search in row.recipe_description:
            search_results.append(row.recipe_id)
            print(row.recipe_name)
            print(row.recipe_method)
            print(row.recipe_description)

def get_nutrition_list(food_id):
    total_nutrition = db.session.query(Nutrition).filter_by(nutrition_id=food_id).first()
    nutrition_list = [total_nutrition.energy_kcal, total_nutrition.energy_kj, total_nutrition.fat,
                      total_nutrition.saturate, total_nutrition.carbohydrate, total_nutrition.sugar,
                      total_nutrition.starch, total_nutrition.fibre, total_nutrition.protein, total_nutrition.salt]
    return nutrition_list

def get_recipe_nutrition_total():
     nutrition_list_asparagus = get_nutrition_list(1)
     nutrition_list_beefmince = get_nutrition_list(2)
     nutrition_total_list = []
     for i in range(0, 10):
         nutrition_total_list.append(float(nutrition_list_asparagus[i]) + float(nutrition_list_beefmince[i]))
     print(nutrition_total_list)



