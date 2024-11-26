from flask import Blueprint, request, jsonify, render_template, session
from ..models import db
from ..models.user import User
from werkzeug.security import generate_password_hash
import hashlib
import openai

add_user_routes = Blueprint('add_user_routes', __name__)

# api key must be secret
openai.api_key = "OPEN_AI_KEY"

def generate_response(prompt):
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful assistant for registrating user on the platform."},
            {"role": "user", "content": prompt}
        ]
    )
    return response.choices[0].message['content'].strip()

@add_user_routes.route('/chat', methods=['POST'])
def chat():
    user_input = request.json.get("user_input")
    conversation_history = session.get('conversation_history', [])
    conversation_history.append(f"User: {user_input}")

    # first sketch of a prompt
    prompt = f"""
    Bisheriger Gesprächsverlauf: {' '.join(conversation_history)}
    Wie kann ich dir weiterhelfen? (z.B. deinen Namen wissen, Interessen, Kontaktmethode, etc.)
    """

    assistant_response = generate_response(prompt)
    conversation_history.append(f"Assistent: {assistant_response}")

    session['conversation_history'] = conversation_history

    return jsonify({"response": assistant_response})

#TODO Modify for usage with Chatbot registration process
@add_user_routes.route('/register', methods=['POST'])
def register():
    data = request.json
    hashed_password = hash_password(data['password'])
    user = User(name=data['name'], surname=data['surname'],
                telegram_id=data['telegram_id'], phone_number=data['phone_number'],
                password=hashed_password)
    db.session.add(user)
    db.session.commit()
    return jsonify({"message": "Registration successful!"})

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

@add_user_routes.route('/add_user', methods=['POST', 'GET'])
def add_user():
    if request.method == 'POST':
        data = request.get_json()

        if not data.get('name') or not data.get('surname') or not data.get('email') or not data.get('password'):
            return jsonify({"error": "Missing required fields"}), 400

        hashed_password = generate_password_hash(data['password'], method='pbkdf2')

        new_user = User(
            name=data['name'],
            surname=data['surname'],
            telegram_id=data.get('telegram_id'),
            phone_number=data.get('phone_number'),
            password=hashed_password
        )

        try:
            db.session.add(new_user)
            db.session.commit()
            response = jsonify({"message": "User added successfully!"})
            response.headers['Content-Type'] = 'application/json'
            return response, 201
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": str(e)}), 500

    elif request.method == 'GET':
        return render_template('register_user.html')
