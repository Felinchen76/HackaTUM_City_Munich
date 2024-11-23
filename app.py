from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# config database connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost/user_management_db_hackatum'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# initialize db object
db = SQLAlchemy(app)

# Route for index page
@app.route("/")
def home():
    print("nice")
    return render_template("index.html")

# Entry Point
if __name__ == "__main__":
    app.run(debug=True)
