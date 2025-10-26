# app/app.py
from flask import Flask, jsonify, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/health")
def health():
    return jsonify(status="ok")

@app.route("/predict")
def predict():
    # demo endpoint, replace with your logic later
    return jsonify(result="Hello from Flask + Dockerized CI/CD!")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
