from .add_user_routes import add_user_routes
from .home_routes import home_routes


def register_routes(app):
    app.register_blueprint(add_user_routes)
    app.register_blueprint(home_routes)
