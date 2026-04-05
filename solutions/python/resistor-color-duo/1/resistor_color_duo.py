val_dict = {
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

def value(colors):
    if colors[0] == "black":
        return val_dict[colors[1]]
    
    return int(str(val_dict[colors[0]]) + str(val_dict[colors[1]]))
