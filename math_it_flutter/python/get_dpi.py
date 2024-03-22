import json
import tkinter as tk
from get_paths import get_path

def get_dpi():
    root = tk.Tk()
    info = {}
    # Get the screen width and height
    screen_width = root.winfo_screenmmwidth()
    screen_height = root.winfo_screenmmheight()

    # Get the screen width and height in inches
    screen_width_inches = screen_width / 25.4
    screen_height_inches = screen_height / 25.4

    # Get the screen width and height in pixels
    screen_width_pixels = root.winfo_screenwidth()
    screen_height_pixels = root.winfo_screenheight()

    # Calculate DPI (dots per inch) for both width and height
    dpi_width = screen_width_pixels / screen_width_inches
    dpi_height = screen_height_pixels / screen_height_inches

    info["width"] = screen_width
    info["height"] = screen_height
    info["height_inches"] = screen_height_inches
    info["width_inches"] = screen_width_inches
    info["height_pxs"] = screen_height_pixels
    info["width_pxs"] = screen_width_pixels
    info["height_dpi"] = dpi_height
    info["width_dpi"] = dpi_width

    root.destroy()

    data_path = get_path("data")

    with open(f"{data_path}screen_info.json", "w") as file:
        file.write(json.dumps(info, indent=4))
    

get_dpi()
