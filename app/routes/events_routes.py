from flask import Blueprint, render_template

city_admin_routes = Blueprint('city_admin_routes', __name__)

@city_admin_routes.route('/events', methods=['GET'])
def render_create_post_form():
    return render_template('events.html')