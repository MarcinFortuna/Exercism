#!/usr/bin/env bash

input=${1// /}

[[ ! $input =~ ^[0-9]{2,}$ ]] && { echo "false"; exit; }

luhn_str=""

for (( i=0; i<"${#input}"; i++ )); do
    idx=$(("${#input}" - i - 1));
    if (( i % 2 == 0 )); then
        new_digit=${input:$idx:1}
    else
        new_digit=$(( ${input:$idx:1} * 2 ))
        [[ new_digit -gt 9 ]] && (( new_digit-=9 ))
    fi
    luhn_str="$new_digit$luhn_str"
done

sum=0

for (( i=0; i<"${#luhn_str}"; i++ )); do
    (( sum += "${luhn_str:$i:1}" ))
done

(( sum % 10 == 0 )) && echo "true" || echo "false"