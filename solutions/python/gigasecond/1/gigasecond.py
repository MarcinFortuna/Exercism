from datetime import datetime

def add(moment):
    return datetime.fromtimestamp(moment.timestamp() + 1000000000)