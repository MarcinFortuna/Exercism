#!/usr/bin/env bash

mode=$1
n=$2

square_of_the_sum() {
    #Formula: (n * (n+1) / 2) ** 2
    echo $(((($1 * ($1 + 1))/2)**2)) 
}

sum_of_the_squares() {
    #Formula: (n*(n+1)*(2n+1))/6
    echo $(( ($1 * ($1 + 1) * (2 * $1 + 1)) / 6 ))
}

if [[ $mode == "square_of_sum" ]]; then
    square_of_the_sum $n
elif [[ $mode == "sum_of_squares" ]]; then
    sum_of_the_squares $n
elif [[ $mode == "difference" ]]; then
    sq_sum=$(square_of_the_sum $n)
    sum_sq=$(sum_of_the_squares $n)
    echo $(( sq_sum - sum_sq ))
else
    echo "Invalid mode!"
    exit 1
fi