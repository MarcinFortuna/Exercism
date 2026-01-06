#!/usr/bin/env bash

input=$(echo ${1^^} | tr -d - )

if [[ ! $input =~ ^[0-9]{9}[0-9X]$ ]]; then
    echo "false"
    exit
fi

result=0

for (( i=10; i > (( 10 - ${#input} )); i--)); do
    input_idx=$(( 10 - i ))
    char=${input:${input_idx}:1}
    if [[ $char == "X" ]]; then
        (( result += 10 * i ))
    else
        (( result += char * i ))
    fi
done

(( result % 11 == 0 )) && echo "true" || echo "false"