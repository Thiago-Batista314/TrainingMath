from os import getcwd
import json

def save_infos():
    """Save the most important paths into a json to 
    get_path use to return to the other methods."""

    current_path = getcwd()[::-1]
    data_path = current_path[current_path.find("/"):][::-1] + "lib/data/"
    images_path = current_path[current_path.find("/"):][::-1] + "lib/images/"
    python_path = current_path[current_path.find("/"):][::-1] + "python/"

    infos = {}

    infos["math_it_path"] = current_path[current_path.find("/"):][::-1]
    infos["data_path"] = data_path
    infos["images_path"] = images_path
    infos["python_path"] = python_path

    with open(data_path + "paths-infos.json", "w+") as file:
        file.flush()
        file.write(json.dumps(infos, indent=4))


def get_path(which):
    """Options for which path to choose from paths_infos.json:
        - math_it
        - python
        - data
        - images"""
    
    current_path = getcwd()[::-1]
    abs_path = current_path[current_path.find("/"):][::-1]
    dict_test = {"data": 1, "python": 2, "images": 3}

    with open(abs_path + "lib/data/paths-infos.json") as file:
        infos = json.load(file)

    if f"{which}_path" not in infos.keys():
        which = "Option not valid..."
    
    else:
        if which == "current":
            which = infos["math_it_path"]

        elif which != "current":
            which = infos[f"{which}_path"]
    
    return which
