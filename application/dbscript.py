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

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/foodstories2504', echo=False)
Session = sessionmaker(bind=engine)
session = Session()

def show_recipe(id):
    recipe_table = session.query(Recipe).filter_by(recipe_id=id).first()
    recipe_dict = {'recipe_name': recipe_table.recipe_name, 'recipe_description': recipe_table.recipe_description}
    return recipe_dict

def search_recipe():
    search_results = []
    recipe_table = session.query(Recipe).all()
    user_search = input('search here for recipes: ')
    print(f"Here are the results that match your search: {user_search}")
    for row in recipe_table:
        if user_search in row.recipe_name or user_search in row.recipe_description:
            search_results.append(row.recipe_id)
            print(row.recipe_name)
            print(row.recipe_method)
            print(row.recipe_description)

# test code
# show_recipe(1)
# search_recipe()

def get_nutrition_list(food_id):
    total_nutrition = session.query(Nutrition).filter_by(nutrition_id=food_id).first()
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

get_recipe_nutrition_total()