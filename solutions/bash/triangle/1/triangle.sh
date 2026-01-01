#!/usr/bin/env bash

type=$1
sides=${@:2:3}

sorted_values=($(echo ${sides[*]} | tr " " "\n" | sort -n | tr "\n" " "))

if [[ ${sorted_values[*]} =~ ^0[[:space:]]{0,}0[[:space:]]0$ ]]; then
    echo "false"
    exit
elif (( $(echo "${sorted_values[0]} + ${sorted_values[1]} < ${sorted_values[2]}" | bc -l) )); then
    echo "false"
    exit
fi

no_of_values=$(echo -n ${sorted_values[*]} | tr " " "\n" | sort -u | wc -l)

if [[ $type == "equilateral" ]]; then
    (( no_of_values == 1 )) && echo "true" || echo "false"
elif [[ $type == "isosceles" ]]; then
    (( no_of_values < 3 )) && echo "true" || echo "false"
elif [[ $type == "scalene" ]]; then
    (( no_of_values == 3 )) && echo "true" || echo "false"
fi