import json
import subprocess
from os import getcwd
from get_dpi import get_dpi
from flask import Flask, request
from get_paths import get_path, save_infos
from save_to_history import save_to_history
from exercises_to_json import exercises_to_json
from generate_big_graph import generate_big_graph
from generate_small_graph import generate_small_graph
from generate_exercises_module import generate_exercise


app = Flask(__name__)

data_path = get_path("data")

@app.route("/first-boot")
def first_boot():
    save_infos()
    get_dpi()

@app.route('/gent-big-graph', methods=['GET'])
def get_big_graph():
    generate_big_graph()

@app.route('/gent-small-graph', methods=['GET'])
def get_small_graph():
    generate_small_graph()

@app.route('/gent-tasks/<string:difficulty>', methods=['GET'])
def generate_exercises(difficulty):
    exercises = generate_exercise(difficulty)
    exercises_to_json(exercises)

@app.route('/times-scores', methods=['POST'])
def save_time_score():
    filepath = data_path + "times-scores.json"
    with open(filepath, 'r') as file:
        time_score = json.load(file.read())

    save_to_history(time_score)

@app.route("/shutdown")
def shutdown():
    subprocess.run("shutdown -h 0", shell=True, check=True)
    return "Shutting down!"
    

if __name__ == '__main__':
    app.run(debug=True)
