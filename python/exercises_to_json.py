import json
import os

def exercises_to_json(exercises):
    exercises_dict = {}

    for c, e in enumerate(zip(exercises[0], exercises[1])):
        exercises_dict[f"exercise{c+1}"] = {f"account": e[0], f"result": e[1]}

    with open(os.getcwd() + "/python/data/exercises.json", 'w') as file:
        file.flush()
        file.write(json.dumps(exercises_dict))