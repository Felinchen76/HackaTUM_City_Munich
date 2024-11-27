from flask import Blueprint, render_template

user_logging_routes = Blueprint('user_logging_routes', __name__)

@user_logging_routes.route('/log_in', methods=['GET'])
def render_log_in():
    return render_template('login.html')

@user_logging_routes.route('/log_out', methods=['GET'])
def render_log_out():
    return render_template('logout.html')