import json
from get_paths import get_path

def save_to_history():
    data_path = get_path("data")

    with open(data_path + "history.json", 'r+') as file:
        with open(data_path + "exercises.json", 'r+') as exs:
            exercises = json.load(exs)
 
        new_file = file.readlines()

        if len(new_file) < 1:
            file.write(f"[{json.dumps(exercises, indent=4)}\n\n]")
            
        else:
            empty_line = new_file.index('\n')
            new_file[empty_line] = f",{json.dumps(exercises, indent=4)}\n\n"
            file.seek(0)
            file.truncate()
            file.writelines(new_file)
