#!/usr/bin/env bash

input=$1

declare -A codons=(
    [AUG]="Methionine"
    [UUU]="Phenylalanine"
    [UUC]="Phenylalanine"
    [UUA]="Leucine"
    [UUG]="Leucine"
    [UCU]="Serine"
    [UCC]="Serine"
    [UCA]="Serine"
    [UCG]="Serine"
    [UAU]="Tyrosine"
    [UAC]="Tyrosine"
    [UGU]="Cysteine"
    [UGC]="Cysteine"
    [UGG]="Tryptophan"
    [UAA]="STOP"
    [UAG]="STOP"
    [UGA]="STOP"
)

triplets=($(echo $input | fold -w3 | tr "\n" " "))

output=()

for triplet in "${triplets[@]}"; do
    if [[ ${codons[$triplet]} == "STOP" ]]; then
        echo ${output[*]}
        exit
    elif [[ -z ${codons[$triplet]} ]]; then
        echo "Invalid codon"
        exit 1
    else
        output+=("${codons[$triplet]}")
    fi
done

echo ${output[*]}
