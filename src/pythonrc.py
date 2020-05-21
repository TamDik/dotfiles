import atexit
import os
import readline

dir_ = os.getenv('DOTFILES', os.path.expanduser('~'))
histfile = os.path.join(dir_, "python/history")
try:
    readline.read_history_file(histfile)
    readline.set_history_length(10000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
