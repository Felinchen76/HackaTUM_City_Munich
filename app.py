from flask import Flask, render_template

app = Flask(__name__)

# Route for index page
@app.route("/")
def home():
    return render_template("index.html")

# Entry Point
if __name__ == "__main__":
    app.run(debug=True)
