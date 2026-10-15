from flask import Flask, request, jsonify
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier

app = Flask(__name__)

iris = load_iris()
model = RandomForestClassifier(random_state=42)
model.fit(iris.data, iris.target)

@app.route("/")
def home():
    return jsonify({
        "message": "Welcome to the ML Prediction Application!",
        "status": "Running"
    })

@app.route("/health")
def health():
    return jsonify({"status": "ok"})

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()

    try:
        features = [
            float(data["sepal_length"]),
            float(data["sepal_width"]),
            float(data["petal_length"]),
            float(data["petal_width"])
        ]

        prediction = model.predict([features])[0]

        return jsonify({
            "prediction": iris.target_names[prediction].item()
        })

    except (KeyError, TypeError, ValueError):
        return jsonify({
            "error": "Please provide all four numeric measurements."
        }), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
