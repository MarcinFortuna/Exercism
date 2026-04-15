def find(search_list, value):
    if len(search_list) == 0 or search_list[0] > value or search_list[-1] < value:
        raise ValueError("value not in array")
    
    lower_bound = 0
    upper_bound = len(search_list) - 1

    while lower_bound <= upper_bound:
        mid = lower_bound + (upper_bound - lower_bound) // 2
        if search_list[mid] == value:
            return mid

        if search_list[mid] < value:
            lower_bound = mid + 1
        else:
            upper_bound = mid - 1

    raise ValueError("value not in array")
