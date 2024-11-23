from flask import Blueprint, request, jsonify, render_template
from ..models import db

create_admin_routes = Blueprint('create_admin_routes', __name__)

# Route for creating a admin
@app.route('/admin/create_post', methods=['POST'])
def create_admin_post():
    data = request.get_json()
    orga_id = data.get('orga_id')

    # Only allow verified organizations to create posts
    orga = Organization.query.get_or_404(orga_id)
    if not orga.verified:
        return jsonify({"error": "Organization not verified by city!"}), 400

    new_post = Post(
        title=data['title'],
        content=data['content'],
        orga_id=orga_id,
        city_part_id=data['city_part_id']
    )
    db.session.add(new_post)
    db.session.commit()
    return jsonify({"message": "Post created successfully!"}), 201