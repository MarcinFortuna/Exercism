import re

def is_valid(isbn):
    isbn = isbn.replace("-", "")
    if not re.match(r"^\d{9}(\d|X)$", isbn):
        return False

    formula_sum = 0
    for i in range(10):
        num = int(isbn[i]) if isbn[i] != "X" else 10
        formula_sum += num * (10 - i)

    return formula_sum % 11 == 0