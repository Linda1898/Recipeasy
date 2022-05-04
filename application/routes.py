import json
from flask import render_template, request, jsonify, session, redirect, url_for, Flask
import service
from application import app
from application.forms.new_user_form import SignUpForm
from application.models.food_group import FoodGroup
from application.models.recipe import Recipe
from application.models.food_item import FoodItem
from application.models.user_table import UserTable
from application.models.food_source import FoodSource
from application.forms.search_form import SearchForm
from application.forms.searchNutrition import SearchNutritionForm

# SIGNUP PAGE: uses a a python class SignUpForm made in new_user_form (in the forms folder) which is presented
# to the user via Signup.html (templates) and when filled out correctly shows the page welcome_new_user.html (templates)
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    error = ""
    form = SignUpForm()
    if request.method == 'POST':
        form = SignUpForm(request.form)
        print(form.username.data)
        input_username = form.username.data
        input_user_name = form.user_name.data
        input_password = form.password.data
        if len(input_username) == 0 or len(input_password) == 0 or len(input_user_name) == 0:
            error = "Please supply username, password and the name you like to go by"
        if UserTable.query.filter_by(username=input_username).first() != None:
            error = "Username already taken please try again"
            print(error)
        else:
            users_form_details = UserTable(username=input_username, user_name=input_user_name, password=input_password)
            service.add_new_user(users_form_details)
            return render_template('welcome_new_user.html', user_name=input_user_name)
    return render_template('signup.html', form=form, message=error)

@app.route("/home")
@app.route("/")
def home():
    return render_template("home.html")
    # return render_template("home.html")

@app.route("/recipe/<int:recipe_id>")
def recipes(recipe_id):
    recipe = service.get_recipe_object(recipe_id)
    return render_template("recipe.html", recipe=recipe)

print(service.get_recipe_object(6))

@app.route('/user_name')
def user_name():
    return render_template('welcome_new_user.html', user_name=user_name)

@app.route('/collectionsMenu')
def collectionsmenu():
    collections = service.get_collection_object_all()
    return render_template("collectionsMenu.html", collections=collections)


@app.route("/collections/<int:collection_id>")
def collections(collection_id):
    error = ""
    recipes = service.get_recipes_from_collection(collection_id)
    return render_template("collections.html", recipes=recipes, message=error)


@app.route('/search', methods=['GET', 'POST'])
def search():
    error = ""
    form = SearchForm(request.form)
    user_search = form.search.data
    if len(user_search) == 0:
        error = "please enter a food group to search"
    elif FoodSource.query.filter_by(source_name=user_search).first() == None:
        error = "hmmm we don't seem to have any food sources by that name, try something else?"
    else:
        group = service.search_food_facts(user_search)
        foods = service.get_foods_by_foodssource(user_search)
        recipes =
        return render_template('searchresults.html', group=group, foods=foods)
    return render_template('search.html', form=form, message=error)

@app.route('/searchNutrition', methods=['GET', 'POST'])
def searchNutrition():
    error = ""
    form = SearchNutritionForm(request.form)
    user_search = form.search.data
    quantity = form.quantity.data
    if len(user_search) == 0:
        error = "please enter a food to search"
    elif type(quantity) != float:
        error = "you need to enter a numeric quantity"
    elif FoodItem.query.filter_by(food_name=user_search).first() == None:
        error = "hmmm we don't seem to have any foods by that name, try something else?"
    else:
        nutritionList = service.get_nutrition_by_name(user_search)
        environment_list = service.get_environmental_impact(user_search)
        return render_template('searchNutritionResults.html', user_search=user_search, nutritionList=nutritionList, quantity=quantity, environment_list=environment_list)
    return render_template('searchNutrition.html', form=form, message=error)