def find_anagrams(word, candidates):
    return [cand for cand in candidates if word.lower() != cand.lower() and "".join(sorted(list(word.lower()))) == "".join(sorted(list(cand.lower())))]
