from flask import Blueprint, render_template

orga_admin_routes = Blueprint('orga_admin_routes', __name__)

@orga_admin_routes.route('/orga_admin', methods=['GET'])
def render_create_post_form():
    return render_template('orga_admin_page.html')