from flask import Flask, request, redirect, render_template, session
from flask_mysqldb import MySQL

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']
    print(email, password)
    
    from flask import Flask, request, redirect, render_template, session
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'your-secret-key-here'  # Required for session management

@app.route('/')
def index():
    return render_template('index.html', user=session.get('user'))

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']
    
    if email == '123@gmail.com' and password == '123':
        session['user'] = {
            'name': 'John Doe',
            'email': email,
            'profile_pic': 'https://via.placeholder.com/40x40'  # Replace with actual profile picture URL
        }
        return redirect('/')
    else:
        return redirect('/')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')


# Route for index page
@app.route("/")
def home():
    return render_template("index.html")


if __name__ == '__main__':
    app.run(debug=True)
