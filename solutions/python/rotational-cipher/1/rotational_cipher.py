alphabet = "abcdefghijklmnopqrstuvwxyz"

def rotate(text, key):
    output = ""
    
    for char in text:
        if not char.isalpha():
            output += char
        else:
            idx = alphabet.index(char.lower())
            newIdx = (idx + key) % 26
            if char == char.upper():
                output += alphabet[newIdx].upper()
            else:
                output += alphabet[newIdx]

    return output