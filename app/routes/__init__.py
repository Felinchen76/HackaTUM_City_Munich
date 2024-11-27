from .add_user_routes import add_user_routes
from .home_routes import home_routes
from .create_event_routes import create_event_routes
from .city_routes import city_routes
from .orga_admin_routes import orga_admin_routes
from .user_logging_routes import user_logging_routes



def register_routes(app):
    app.register_blueprint(add_user_routes)
    app.register_blueprint(home_routes)
    app.register_blueprint(create_event_routes)
    app.register_blueprint(city_routes)
    app.register_blueprint(orga_admin_routes)
    app.register_blueprint(user_logging_routes)



