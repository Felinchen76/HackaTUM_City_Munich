from flask import Blueprint, request, jsonify, render_template
from ..models import db
from ..models.post import Post
from ..models.organization import Organization

create_post_routes = Blueprint('create_post_routes', __name__)

@create_post_routes.route('/create_post', methods=['GET'])
def render_create_post_form():
    from ..models.category import Category
    categories = Category.query.all()
    category_list = [{"id": category.category_id, "name": category.name} for category in categories]
    return render_template('create_post.html', categories=category_list)

@create_post_routes.route('/create_post', methods=['POST'])
def create_post_action():
    data = request.get_json()
    print(data)

    if not all(key in data for key in ['title', 'content', 'orga_id']):
        return jsonify({"error": "Missing required fields"}), 400

    organization = Organization.query.get(data['orga_id'])
    if not organization:
        return jsonify({"error": "Invalid orga_id"}), 400

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

