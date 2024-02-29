import json

def save_to_history():
    with open('C:/Projects/TrainingMath/data/history.json', 'r+') as file:
        with open('C:/Projects/TrainingMath/data/exercises.json', 'r+') as exs:
            exercises = json.load(exs)

        new_file = file.readlines()

        if len(new_file) < 1:
            file.write(f"[{json.dumps(exercises)}\n\n]")
        else:
            empty_line = new_file.index('\n')
            new_file[empty_line] = f",{json.dumps(exercises)}\n\n"
            file.seek(0)
            file.truncate()
            file.writelines(new_file)

save_to_history()