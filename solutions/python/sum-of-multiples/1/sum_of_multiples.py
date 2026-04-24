def sum_of_multiples(limit, multiples):
    numbers_to_sum = set()
    for el in multiples:
        numbers_to_sum.update(list(range(el, limit, el)) if el > 0 else [0])

    return sum(numbers_to_sum)