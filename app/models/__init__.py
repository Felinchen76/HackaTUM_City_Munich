from flask_sqlalchemy import SQLAlchemy

# definition of db instance
db = SQLAlchemy()

# import of the models, so they are available
from .user import User
from .organization import Organization
from .post import Post
from .category import Category
from .post_category import PostCategory
from .user_interest import UserInterest
