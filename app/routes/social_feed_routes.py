from flask import Blueprint, render_template

social_feed_routes = Blueprint('social_feed_routes', __name__)

@social_feed_routes.route('/social_feed', methods=['GET'])
def render_create_post_form():
    return render_template('social.html')