def to_rna(dna_strand):
    output = ""
    
    for char in dna_strand:
        output += transl[char] if char in transl else char

    return output
        
transl = {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U"
}
