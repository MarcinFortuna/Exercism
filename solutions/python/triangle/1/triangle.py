def check_if_sides_sum_correct(sides):
    if not all(sides):
        return False
    if sides[0] + sides[1] < sides[2] or sides[1] + sides[2] < sides[0] or sides[0] + sides[2] < sides[1]:
        return False
    return True

def equilateral(sides):
    if not check_if_sides_sum_correct(sides):
        return False
    return len(set(sides)) == 1


def isosceles(sides):
    if not check_if_sides_sum_correct(sides):
        return False

    return len(set(sides)) <= 2


def scalene(sides):
    if not check_if_sides_sum_correct(sides):
        return False

    return len(set(sides)) == 3
