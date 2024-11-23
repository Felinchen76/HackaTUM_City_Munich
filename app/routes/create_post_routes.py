from flask import Blueprint, request, jsonify, render_template
from ..models import db
from werkzeug.security import generate_password_hash  # For password hashing

# Define the Blueprint for user creation route
from ..models.post import Post

create_post_routes = Blueprint('create_post_routes', __name__)

# Route for creating a post
@create_post_routes.route('/create_post', methods=['POST', 'GET'])
def create_post():
    if request.method == 'POST':
        data = request.get_json()

        if not data.get('title') or not data.get('content') or not data.get('orga_id'):
            return jsonify({"error": "Missing required fields"}), 400

        new_post = Post(
            title=data['title'],
            content=data['content'],
            orga_id=data['orga_id']
        )

        try:
            db.session.add(new_post)
            db.session.commit()
            response = jsonify({"message": "Post created successfully!"})
            response.headers['Content-Type'] = 'application/json'
            return response, 201
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": str(e)}), 500

    elif request.method == 'GET':
        return render_template('create_post.html')