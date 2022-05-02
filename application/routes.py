import json
from flask import render_template, request, jsonify, session, redirect, url_for, Flask
import service
from application import app, dbscript
from application.forms.new_user_form import SignUpForm
from application.models.food_group import FoodGroup
from application.models.recipe import Recipe
from application.models.user_table import UserTable


# SIGNUP PAGE: uses a python class SignUpForm made in new_user_form (in the forms folder) which is presented
# to the user via Signup.html (templates) and when filled out correctly shows the page welcome_new_user.html (templates)
@app.route('/signup', methods =['GET', 'POST'])
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
        else:
            users_form_details = UserTable(username=input_username, user_name=input_user_name, password=input_password)
            service.add_new_user(users_form_details)
            return render_template('welcome_new_user.html', user_name=input_user_name)
    return render_template('signup.html', form=form, message=error)


@app.route("/home")
@app.route("/")
def home():
    # if collections button is pushed....
    #     return rendertemplate("collections.html")
    return render_template("home.html")

@app.route("/recipes")
def recipes():
    # recipe1 = service.get_recipe_dict(1)
    # if not recipe1:
    #     return render_template("recipes.html")
    # return jsonify("recipes.html", recipe1)
    recipe_table = Recipe.query.filter_by(recipe_id=1).first()
    recipe_name = recipe_table.recipe_name
    recipe_description = recipe_table.recipe_description
    recipe_method = recipe_table.recipe_method
    ingredient_quantity = recipe_table.ingredient_quantity
    course = recipe_table.course
    cuisine = recipe_table.cuisine
    prep_time = recipe_table.prep_time
    cook_time = recipe_table.cook_time
    serving = recipe_table.serving
    return render_template("recipes.html", recipe_name=recipe_name, recipe_description=recipe_description, recipe_method=recipe_method,ingredient_quantity=ingredient_quantity, course=course, cuisine=cuisine, prep_time=prep_time, cook_time=cook_time, serving=serving)

@app.route('/user_name')
def user_name():
    return render_template('welcome_new_user.html', user_name=user_name)