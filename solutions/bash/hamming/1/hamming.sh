#!/usr/bin/env bash

usage_str="Usage: hamming.sh <string1> <string2>"
length_str="Comparison failed: strands must be of equal length"

if [[ $# != 2 ]]; then
    echo $usage_str
    exit 1
fi

dna_1=$1
dna_2=$2

if [[ ${#dna_1} != ${#dna_2} ]]; then
    echo $length_str
    exit 1
fi

differences=0

for (( i=0; i<"${#dna_1}"; i++ )); do
    if [[ "${dna_1:$i:1}" != "${dna_2:$i:1}" ]]; then
        ((differences++))
    fi
done

echo $differences
