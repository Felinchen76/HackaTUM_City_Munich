from flask import Blueprint, request, jsonify, render_template
from ..models import db
from ..models.post import Post
from ..models.organization import Organization  # Import Organization

create_post_routes = Blueprint('create_post_routes', __name__)

@create_post_routes.route('/create_post', methods=['POST', 'GET'])
def create_post():
    if request.method == 'POST':
        data = request.get_json()
        print(data)

        # Check if required fields are present
        if not all(key in data for key in ['title', 'content', 'orga_id']):
            return jsonify({"error": "Missing required fields"}), 400

        # Validate orga_id
        organization = Organization.query.get(data['orga_id'])
        if not organization:
            return jsonify({"error": "Invalid orga_id"}), 400

        # Create new post
        new_post = Post(
            title=data['title'],
            content=data['content'],
            orga_id=data['orga_id']
        )

        try:
            db.session.add(new_post)
            db.session.commit()
            response = jsonify({"message": "Post created successfully!"})
            new_post.match_with_users()
            response.headers['Content-Type'] = 'application/json'
            return response, 201
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": f"Error: {str(e)}"}), 500

    elif request.method == 'GET':
        return render_template('create_post.html')
