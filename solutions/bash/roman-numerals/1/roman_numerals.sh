#!/usr/bin/env bash

target="$1"

declare -a arabic_numerals=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
declare -a roman_numerals=(M CM D CD C XC L XL X IX V IV I)

output=""

for (( i=0; i<=12 ; i++)); do
    current_arabic="${arabic_numerals[$i]}"
    while (( target >= current_arabic )); do
        ((target-=current_arabic))
        output+="${roman_numerals[$i]}"
    done
done

echo $output