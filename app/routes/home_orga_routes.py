from flask import Blueprint, render_template

home_orga_routes = Blueprint('home_orga_routes', __name__)

@home_orga_routes.route('/home_orga', methods=['GET'])
def render_site():
    return render_template('orga_admin_page.html')