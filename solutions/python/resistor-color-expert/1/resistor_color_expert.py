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

tolerance_dict = {
    "grey": 0.05,
    "violet": 0.1,
    "blue": 0.25,
    "green": 0.5,
    "brown": 1,
    "red": 2,
    "gold": 5,
    "silver": 10
}

def resistor_label(colors):
    if len(colors) == 1:
        return "0 ohms"
    
    ohms = int(f"{"".join(str(color_dict[col]) for col in colors[0:-2])}{color_dict[colors[-2]] * "0"}")

    if ohms >= 1000000000:
        ohms /= 1000000000.0
        output = f"{ohms:g} gigaohms"
    elif ohms >= 1000000:
        ohms /= 1000000.0
        output = f"{ohms:g} megaohms"
    elif ohms >= 1000:
        ohms /= 1000.0
        output = f"{ohms:g} kiloohms"
    else:
        output = f"{ohms:g} ohms"
    
    output += f" ±{tolerance_dict[colors[-1]]}%"

    return output