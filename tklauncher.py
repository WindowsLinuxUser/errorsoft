#!/bin/python3
import subprocess
from tkinter import *

try:
    with open('./info/product.string', 'r') as file:
        prodstring = file.read()
except FileNotFoundError:
    print("Product string not found, the script might break!")
except Exception as e:
    print(f"Exception reading product string: {e}")

print(f"This python file is a component of {prodstring}.")

def launch_es():
    subprocess.run(["python", "bios.py"])

def exit_es():
    quit()

root = Tk()

root.title("Test")
root.geometry("240x180")

label = Label(root, text=f"{prodstring} Launcher")
buttonlaunch = Button(root, text="Launch", command=launch_es)
buttonexit = Button(root, text="Exit", command=exit_es)

label.pack()
buttonlaunch.pack()
buttonexit.pack()

root.mainloop()