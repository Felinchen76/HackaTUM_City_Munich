from flask import Blueprint, render_template

event_routes = Blueprint('event_routes', __name__)

@event_routes.route('/events', methods=['GET'])
def render_create_post_form():
    return render_template('events.html')