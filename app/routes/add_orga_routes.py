from flask import Blueprint, request, jsonify, render_template
from ..models import db, User
from werkzeug.security import generate_password_hash  # For password hashing



####TO DO####


# Define the Blueprint for user creation route
add_user_routes = Blueprint('add_orga_routes', __name__)

# Route for adding a new user
@add_user_routes.route('/add_orga', methods=['POST', 'GET'])
def add_user():
    if request.method == 'POST':
        # Extract JSON data from the request
        data = request.get_json()  # Get JSON data from the incoming request

        # Check if all required fields are present
        if not data.get('name') or not data.get('surname') or not data.get('email') or not data.get('password'):
            return jsonify({"error": "Missing required fields"}), 400

        # Hash the password for security
        hashed_password = generate_password_hash(data['password'], method='pbkdf2')

        # Create a new User instance
        new_user = User(
            name=data['name'],
            surname=data['surname'],
            email=data['email'],
            password=hashed_password
        )

        try:
            # Add the new user to the session and commit it to the database
            db.session.add(new_user)
            db.session.commit()
            response = jsonify({"message": "User added successfully!"})
            response.headers['Content-Type'] = 'application/json'
            return response, 201
        except Exception as e:
            # If something goes wrong, rollback the session to maintain consistency
            db.session.rollback()
            return jsonify({"error": str(e)}), 500


    elif request.method == 'GET':
    # Handle GET request, for example, return a list of users or a message
        #users = User.query.all()  # Fetch all users from the database
        #user_list = [{"name": user.name, "surname": user.surname, "email": user.email} for user in users]

            # You can also return a general message or status
        #return jsonify({
                #"message": "GET request received. User list fetched.",
                #"users": user_list
           # }), 200
        return render_template('register_user.html')
