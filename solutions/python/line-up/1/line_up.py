import re

def line_up(name, number):
    str_num = str(number)
    if re.match(r"(^|\d*[02-9])1$", str_num):
        suffix = "st"
    elif re.match(r"(^|\d*[02-9])2$", str_num):
        suffix = "nd"
    elif re.match(r"(^|\d*[02-9])3$", str_num):
        suffix = "rd"
    else:
        suffix = "th"

    return f"{name}, you are the {number}{suffix} customer we serve today. Thank you!"
