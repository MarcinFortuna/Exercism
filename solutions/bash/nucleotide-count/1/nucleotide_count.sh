#!/usr/bin/env bash

input=${1^^}

if [[ ! $input =~ ^[ACGT]*$ ]]; then
    echo "Invalid nucleotide in strand"
    exit 1
fi

for nuc in "A" "C" "G" "T"; do
    echo "$nuc: $(echo -n $input | sed -e "s/[^${nuc}]//g" | wc -m)"
done