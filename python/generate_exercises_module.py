import random
import pandas
import os
from exercises_to_json import exercises_to_json

def generate_exercise(difficulty="Beginner"):
    data_path = os.getcwd() + "/python/data/"
    levels = pandas.read_json(f'{data_path}levels.json')
    num1 = 0
    num2 = 0

    account = None
    list_return = []
    accounts_list = []
    results_list = []
    current_symbol = ""

    num_min = levels[difficulty]["Num_Min"]
    num_max = levels[difficulty]["Num_Max"]

    operations = levels[difficulty]["Operations"]
    expressions_allowed = levels[difficulty]["ExpressionsAllowed"]
    
    if expressions_allowed is not True:
        for c in range(0, int(levels[difficulty]["Accounts(Max)"]/10)):
            for b in range(0, 10):
                num1 = random.randint(num_min, num_max)
                num2 = random.randint(num_min, num_max)
                if num2 > num1 and difficulty == "Beginner":
                    num3 = num2
                    num2 = num1
                    num1 = num3
                current_symbol = operations[random.randint(0, len(operations)-1)]
                account = str(num1) + ' ' + current_symbol + ' ' + str(num2)
                result = f"{eval(account):.2f}"
                accounts_list.append(account)
                results_list.append(result)
        
    else:    
        for c in range(0, int(levels[difficulty]["Accounts(Max)"]/10)):
            num1 = random.randint(num_min, num_max)
            num2 = random.randint(num_min, num_max)
            current_symbol = operations[random.randint(0, len(operations)-1)]

            while current_symbol == "/" and num1 == 0 or num2 == 0:
                    num1 = random.randint(num_min, num_max)
                    num2 = random.randint(num_min, num_max)
                    current_symbol = operations[random.randint(0, len(operations)-1)]

            account = f"{num1} {current_symbol} {num2}"
            for b in range(0, 8):
                current_account = 0
                num2 = random.randint(num_min, num_max)
                current_symbol = operations[random.randint(0, len(operations)-1)]

                while current_symbol == "/" and num2 == 0:
                    num2 = random.randint(num_min, num_max)
                    current_symbol = operations[random.randint(0, len(operations)-1)]
                
                account += ' ' + current_symbol + ' ' + str(num2)

            result = f"{eval(account):.2f}"
            accounts_list.append(account)
            results_list.append(result)

    list_return = [accounts_list, results_list]
    return list_return

exercises_to_json(generate_exercise())
