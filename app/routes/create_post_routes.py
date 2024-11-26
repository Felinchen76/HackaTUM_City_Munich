from flask import Blueprint, request, jsonify, render_template
from ..models import db
from ..models.post import Post
from ..models.organization import Organization

create_post_routes = Blueprint('create_post_routes', __name__)


@create_post_routes.route('/create_post', methods=['GET'])
#so the categories are dynamically displayed and there is a fixed selection
def render_create_post_form():
    from ..models.category import Category
    categories = Category.query.all()
    category_list = [{"id": category.category_id, "name": category.name} for category in categories]
    return render_template('create_post.html', categories=category_list)


@create_post_routes.route('/create_post', methods=['POST'])
def create_post_action():
    try:
        data = request.get_json()
        print(data)

        #check for missing data
        if not all(key in data for key in ['title', 'content', 'orga_id']):
            return jsonify({"error": "Missing required fields"}), 400
        #check for invalid orga
        organization = Organization.query.get(data['orga_id'])
        if not organization:
            return jsonify({"error": "Invalid orga_id"}), 400

        new_post = Post(
            title=data['title'],
            content=data['content'],
            orga_id=data['orga_id']
        )

        #add new post to db
        db.session.add(new_post)
        db.session.commit()
        response = jsonify({"message": "Post created successfully!"})
        new_post.match_with_users()
        response.headers['Content-Type'] = 'application/json'
        return response, 201
    except Exception as e:
        #don't mess with db when inserting
        db.session.rollback()
        error_message = f"Error creating post: {str(e)}"
        print(error_message)
        return jsonify({"error": error_message}), 500


@create_post_routes.route('/get_categories')
def get_categories():
    try:
        #late import against circularity imports
        from ..models.category import Category
        #get all categories from db
        categories = db.session.query(
            Category).all()
        #write them all into a dict
        categories_list = [{"id": category.category_id, "name": category.name} for category in categories]
        return jsonify(categories_list)

    except Exception as e:
        return jsonify({"error": str(e)}), 500
