import os
import json
from get_paths import get_path
import generate_exercises_module

def exercises_to_json(exercises):
    exercises_dict = {}
    data_path = get_path("data")

    for c, e in enumerate(zip(exercises[0], exercises[1])):
        exercises_dict[f"exercise{c+1}"] = {f"account": e[0], f"result": e[1]}

    with open(data_path + "exercises.json", 'w') as file:
        file.flush()
        file.write(json.dumps(exercises_dict, indent=4))
