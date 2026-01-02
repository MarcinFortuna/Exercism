#!/usr/bin/env bash

input_base="$1"
list="$2"
output_base="$3"

if [[ $input_base -lt 2 || $output_base -lt 2 ]]; then
    echo "All bases must be > 2"
    exit 1
elif [[ $list =~ - ]]; then
    echo "The list cannot contain negative digits"
    exit 1
fi

#Check if the whole list is in the declared input base
list_arr=($list)
max_val=$(( input_base - 1 ))
for el in "${list_arr[@]}"; do
    if (( el > max_val )); then
        echo "Invalid item in the list"
        exit 1
    fi
done

toDigits() {
    num=$1
    base=$2
    # Convert a positive number 'num' to its digit representation in any base
    digits=""
    while (( num > 0 )); do
        mod=$(( num % base ))
        digits="$mod $digits"
        num=$(( num / base ))
    done
    if [[ -z $digits ]]; then
        echo "0"
    else
        echo $digits
    fi
}

fromDigits() {
    # Compute the number given by digits in base b.
    num=0
    digits=($1) # Turn to array
    base="$2"
    for digit in "${digits[@]}"; do
        num=$(( base * num + digit ))
    done
    echo $num
}

decimal=$(fromDigits "$list" $input_base)
(( $output_base == 10 )) && { echo $decimal | fold -w1 | tr "\n" " " | xargs ; exit; }

toDigits $decimal $output_base

#####
# REFERENCES
# Solution adapted to Bash from:
# Andrej Bauer (https://cs.stackexchange.com/users/1329/andrej-bauer), The math behind converting from any base to any base without going through base 10?, URL (version: 2022-02-23): https://cs.stackexchange.com/q/10321
#####