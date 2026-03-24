def is_armstrong_number(number):
    lst = [int(digit) for digit in list(str(number))]
    return number == sum([digit ** len(lst) for digit in lst])
