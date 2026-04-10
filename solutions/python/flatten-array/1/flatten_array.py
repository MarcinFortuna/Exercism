def flatten(iterable):
    if isinstance(iterable, list):
        iterable = [el for el in iterable if el is not None]
        if len(iterable) == 0:
            return []
        else:
            return flatten(iterable[0]) + flatten(iterable[1:])
    else:
        return [iterable] if iterable is not None else []