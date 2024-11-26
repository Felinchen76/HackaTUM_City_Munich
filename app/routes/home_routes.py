from flask import Blueprint, render_template
from app.models.post import Post
from app.models.user import User
from app.models.category import Category
from app.models.post_category import PostCategory
from app.models.user_interest import UserInterest


home_routes = Blueprint('home_routes', __name__)

#Dummyyyy --> for full Implementation we will need Log In available
@home_routes.route('/')
def index():
    user = User.query.first() ####dummy####
    if user:
        print(user.user_id)
    else:
        print("Kein Benutzer gefunden.")  ####dummy####  einfach dann die ersten 10 Einträge zeigen
    user_interests = UserInterest.query.filter_by(user_id=user.user_id).all()
    for interest in user_interests:
        print(interest.user_id, interest.category_id)
    category_ids = [interest.category_id for interest in user_interests]
    for category in category_ids:
        print(category)

    posts_for_user = Post.query.join(PostCategory).join(Category).filter(
        Category.category_id.in_(category_ids)
    ).all()

    for post in posts_for_user:
        print(post.title, post.content)


    return render_template('index.html', posts=posts_for_user)

