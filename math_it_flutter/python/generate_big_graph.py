import json
import numpy as np
import pandas as pd
from os import getcwd
from get_paths import get_path
import matplotlib.pyplot as plt

def generate_big_graph():
    images_path = get_path("images")
    data_path = get_path("data")

    df = pd.DataFrame(pd.read_json(data_path + "test_db.json"))

    fig = plt.figure(figsize=(12,5))
    ax = plt.gca()

    plt.plot(df[0], df[1], color='red', linewidth=4)
    plt.fill_between(df[0], df[1], color='red', alpha=0.3)
    plt.ylim(df[1].min() - 4, df[1].max() + 4)
    plt.xlabel("Time", fontsize=14)
    plt.ylabel("N_Tasks", fontsize=14)
    plt.xticks(range(min(df[0]), max(df[0]) + 1), fontsize=14)
    plt.yticks(fontsize=14)
    plt.title("All time Time x N. of Tasks", fontsize=24)

    ax.spines["bottom"].set_visible(False)
    ax.spines["left"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)

    
    with open(data_path + "screen_info.json") as file:
        info = json.load(file)

    dpi = round((info["height_dpi"] + info["width_dpi"]) / 2)
    
    fig.savefig(images_path + "graph.png", dpi=dpi, transparent=True)
