import atexit
import os
import readline

histfile = os.getenv("PYTHONHISTORY")

try:
    readline.read_history_file(histfile)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
