#!/usr/bin/env bash

mode=$1
n=$2

square_of_the_sum() {
    local sq_sum=0
    for (( i=1; i<=$1; i++ )); do
        ((sq_sum += i))
    done
    echo $(( sq_sum ** 2 ))
}

sum_of_the_squares() {
    local sum_sq=0
    for (( i=1; i<=$1; i++ )); do
        (( sum_sq += i ** 2 ))
    done
    echo $sum_sq
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