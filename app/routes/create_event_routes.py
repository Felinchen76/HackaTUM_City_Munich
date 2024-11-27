from flask import Blueprint, request, jsonify, render_template
from ..models import db
from ..models.post import Post
from ..models.organization import Organization

create_event_routes = Blueprint('create_event_routes', __name__)


@create_event_routes.route('/create_event', methods=['GET'])
#so the categories are dynamically displayed and there is a fixed selection
def render_create_post_form():
    from ..models.category import Category
    categories = Category.query.all()
    category_list = [{"id": category.category_id, "name": category.name} for category in categories]
    return render_template('create_event.html', categories=category_list)


@create_event_routes.route('/create_event', methods=['POST'])
def create_post_action():
    from ..models.post_category import PostCategory
    from ..models.category import Category
    try:
        data = request.get_json()
        print(data)

        #check for missing data
        if not all(key in data for key in ['title', 'content', 'orga_id', 'category']):
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

        #add new post to db and safe it
        db.session.add(new_post)
        db.session.commit()

        #add new post category
        latest_id = new_post.post_id
        category_id = int(data['category']) # Konvertiere die Kategorie-ID in einen Integer
        print(isinstance(category_id, int))
        category = db.session.query(Category).filter_by(
            category_id=category_id).first()
        if not category: return jsonify({"error": "Invalid category_id"}),400
        new_post_category = PostCategory( post_id=latest_id, category_id=category_id )

        #write into database
        db.session.add(new_post_category)
        db.session.commit()

        response = jsonify({"message": "Post created successfully!"})

        new_post.match_with_users(category_id)
        response.headers['Content-Type'] = 'application/json'
        return response, 201
    except Exception as e:
        #don't mess with db when inserting
        db.session.rollback()
        error_message = f"Error creating post: {str(e)}"
        print(error_message)
        return jsonify({"error": error_message}), 500


@create_event_routes.route('/get_categories')
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
