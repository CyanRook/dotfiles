######################
# Internal Libraries #
######################
import sys
import os
import math
import readline
import pdb
import datetime
import atexit
import pprint

######################
# External Libraries #
######################

## Numpy
# Used for numerical processing
try:
    import numpy
except ImportError:
    print("Failed to import numpy")

## Matplotlib
# Used for plotting
try:
    import matplotlib
except ImportError:
    print("Failed to import matplotlib")

## Scipy
# Used for scientific computaitons
try:
    import scipy
except ImportError:
    print("Failed to import scipy")

## Pandas
# Useful dataframes for statistical processing
try:
    import pandas
except ImportError:
    print("Failed to import pandas")


#################
# Color Support #
#################
class TermColors(dict):
    """Gives easy access to ANSI color codes. Attempts to fall back to no color
    for certain TERM values. (Mostly stolen from IPython.)"""

    COLOR_TEMPLATES = (
        ("Black", "0;30"),
        ("Red", "0;31"),
        ("Green", "0;32"),
        ("Brown", "0;33"),
        ("Blue", "0;34"),
        ("Purple", "0;35"),
        ("Cyan", "0;36"),
        ("LightGray", "0;37"),
        ("DarkGray", "1;30"),
        ("LightRed", "1;31"),
        ("LightGreen", "1;32"),
        ("Yellow", "1;33"),
        ("LightBlue", "1;34"),
        ("LightPurple", "1;35"),
        ("LightCyan", "1;36"),
        ("White", "1;37"),
        ("Normal", "0"),
    )

    NoColor = ''
    _base = '\001\033[%sm\002'

    def __init__(self):
        if os.environ.get('TERM') in ('xterm-color', 'xterm-256color', 'linux',
                                      'screen', 'screen-256color', 'screen-bce'):
            self.update(dict([(k, self._base % v) for k, v in self.COLOR_TEMPLATES]))
        else:
            self.update(dict([(k, self.NoColor) for k, v in self.COLOR_TEMPLATES]))


_c = TermColors()

##################
# Enable History #
##################

HISTFILE = "%s/.pyhistory" % os.environ["HOME"]

# Read existing history files
if os.path.exists(HISTFILE):
    readline.read_history_file(HISTFILE)

# Set maximum number of items written to the history file
readline.set_history_length(300)


# Save history funciton
def savehist():
    readline.write_history_file(HISTFILE)


# Save history at exit
atexit.register(savehist)

########################
# Enable Color Prompts #
########################

sys.ps1 = '%s>>> %s' % (_c['Green'], _c['Normal'])
sys.ps2 = '%s... %s' % (_c['Red'], _c['Normal'])


###################
# Improve Display #
###################

def my_displayhook(value):
    if value is not None:
        try:
            import __builtin__
            __builtin__._ = value
        except ImportError:
            __builtins__._ = value
        pprint.pprint(value)


sys.displayhook = my_displayhook
