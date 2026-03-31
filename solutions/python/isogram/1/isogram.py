def is_isogram(string):
    chars = [char for char in string.lower() if char.isalpha()]
    return len(chars) == len(set(chars))
