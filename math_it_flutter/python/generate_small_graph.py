import json
import numpy as np
import pandas as pd
from os import getcwd
from get_paths import get_path
import matplotlib.pyplot as plt


def generate_small_graph():
    images_path = get_path("images")
    data_path = get_path("data")

    df = pd.DataFrame(pd.read_json(data_path + "test_db.json"))

    with open(data_path + "screen_info.json") as file:
        info = json.load(file)

    dpi = round((info["height_dpi"] + info["width_dpi"]) / 2)

    fig = plt.figure(figsize=(7.7,7.5))
    ax = plt.gca()

    last_three = pd.DataFrame([df[0].iloc[-3:], df[1].iloc[-3:]]).transpose()

    plt.barh(last_three[0], last_three[1], color='#E76C6A')
    # plt.ylabel("Time", fontsize=20)
    plt.yticks(fontsize=20)
    # plt.xlabel("N_Tasks", fontsize=20)
    plt.xticks(fontsize=20)

    ax.spines["bottom"].set_visible(False)
    ax.spines["left"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)

    fig.savefig(images_path + "small_graph.png", transparent=True, dpi=dpi)
    