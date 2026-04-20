def append(list1, list2):
    return list1 + list2


def concat(lists):
    output = []
    for list in lists:
        output += list
    return output


def filter(function, list):
    return [item for item in list if function(item)]


def length(list):
    return len(list)


def map(function, list):
    return [function(item) for item in list]


def foldl(function, list, initial):
    out = initial
    for item in list:
        out = function(out, item)
    return out


def foldr(function, list, initial):
    out = initial
    for item in list[::-1]:
        out = function(out, item)
    return out


def reverse(list):
    return list[::-1]