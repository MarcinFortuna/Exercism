def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")

    if number == 1:
        return "deficient"
    
    factors = []
    i = 1
    while i*i <= number:
        if number % i == 0:
            factors.append(i)
            if number // i != i and i > 1:
                factors.append(number // i) 
        i += 1

    factor_sum = sum(factors)
    print(factors, factor_sum)
    if factor_sum == number:
        return "perfect"
    if factor_sum < number:
        return "deficient"
    return "abundant"