#!/usr/bin/env bash

bottles=$1
verses=$2

if [[ ! $# -eq 2 ]]; then
    echo "2 arguments expected"
    exit 1
fi

if [[ verses -gt bottles ]]; then 
    echo "you cannot generate more verses than bottles"
    exit 1
fi

numerals=("no" "One" "Two" "Three" "Four" "Five" "Six" "Seven" "Eight" "Nine" "Ten")

for (( i=bottles; i>bottles-verses; i-- )); do
    echo "${numerals[$i]} green bottle$((($i == 1)) && echo "" || echo "s") hanging on the wall,"
    echo "${numerals[$i]} green bottle$((($i == 1)) && echo "" || echo "s") hanging on the wall,"
    echo "And if one green bottle should accidentally fall,"
    echo "There'll be ${numerals[$i-1],,} green bottle$((($i == 2)) && echo "" || echo "s") hanging on the wall."
    echo #newline at the end of each verse
done
