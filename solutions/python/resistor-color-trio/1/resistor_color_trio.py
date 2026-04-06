import re

color_dict = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9
}

def label(colors):
    ohms = f"{color_dict[colors[0]]}{color_dict[colors[1]]}{color_dict[colors[2]] * "0"}"

    if re.search("000000000$", ohms):
        output = f"{ohms[0:-9]} gigaohms"
    elif re.search("000000$", ohms):
        output = f"{ohms[0:-6]} megaohms"
    elif re.search("000$", ohms):
        output = f"{ohms[0:-3]} kiloohms"
    else:
        output = f"{ohms} ohms"
    while output[0] == "0" and output[1].isalnum():
        output = output[1:]

    return output
