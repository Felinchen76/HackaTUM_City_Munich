from flask import Blueprint, request, jsonify, render_template
from ..models import db

admin_dashboard_routes = Blueprint('admin_dashboard_routes', __name__)

# Route for displaying orgaizations to be verified by admin
@app.route('/admin/dashboard')
def admin_dashboard():
    pending_organizations = Organization.query.filter_by(verified=False).all()
    return render_template('admin_dashboard.html', organizations=pending_organizations)
