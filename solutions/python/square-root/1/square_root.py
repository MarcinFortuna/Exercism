def square_root(number):
    left_bound = 0
    right_bound = number + 1

    while left_bound != right_bound - 1:
        midpoint = (left_bound + right_bound ) // 2 
        if midpoint * midpoint <= number:
            left_bound = midpoint
        else:
            right_bound = midpoint
            
    return left_bound
    