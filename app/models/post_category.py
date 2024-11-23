from app import db


class PostCategory(db.Model):
    __tablename__ = 'post_categories'

    post_id = db.Column(db.Integer, db.ForeignKey('posts.post_id'), primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey('categories.category_id'), primary_key=True)

    post = db.relationship('Post', backref=db.backref('post_categories', cascade='all, delete-orphan'))
    category = db.relationship('Category', backref=db.backref('post_categories', cascade='all, delete-orphan'))