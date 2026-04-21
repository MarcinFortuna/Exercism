def transform(legacy_data):
    output = {}
    for k, v in legacy_data.items():
        for item in v:
            new_key = item.lower()
            output[new_key] = k
    return output
