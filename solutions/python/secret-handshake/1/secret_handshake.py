operations = ["wink", "double blink", "close your eyes", "jump"]

def commands(binary_str):
    output = []
    for idx in range(1,6):
        rev_idx = idx - 2 * idx
        if binary_str[rev_idx] == "1":
            if idx < 5:
                output.append(operations[idx-1])
            else:
                output.reverse()

    return output
