def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be of equal length.")

    counter = 0

    for idx in range(len(strand_b)):
        if strand_b[idx] != strand_a[idx]:
            counter += 1

    return counter