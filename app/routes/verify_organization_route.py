from flask import Blueprint, request, jsonify, render_template
from ..models import db

# Define the Blueprint for verifying organization route
verify_organization = Blueprint('verify_organization', __name__)

# Route for verifying 
@app.route('/admin/verify_organization/<int:orga_id>', methods=['POST'])
def verify_organization(orga_id):
    orga = Organization.query.get_or_404(orga_id)
    orga.verified = True
    db.session.commit()
    return jsonify({"message": f"Organization {orga.name} verified successfully!"})
