from .add_user_routes import add_user_routes
from .home_routes import home_routes
from .create_post_routes import create_post_routes



def register_routes(app):
    app.register_blueprint(add_user_routes)
    app.register_blueprint(home_routes)
    app.register_blueprint(create_post_routes)
