#!/usr/bin/env bash

score=$(($1 % 256))
mode=$2

allergies=()
if [[ score -ge 128 ]]; then
    score=$(( score - 128 ))
    allergies+=("cats")
fi
if [[ score -ge 64 ]]; then
    score=$(( score - 64 ))
    allergies+=("pollen")
fi
if [[ score -ge 32 ]]; then
    score=$(( score - 32 ))
    allergies+=("chocolate")
fi
if [[ score -ge 16 ]]; then
    score=$(( score - 16 ))
    allergies+=("tomatoes")
fi
if [[ score -ge 8 ]]; then
    score=$(( score - 8 ))
    allergies+=("strawberries")
fi
if [[ score -ge 4 ]]; then
    score=$(( score - 4 ))
    allergies+=("shellfish")
fi
if [[ score -ge 2 ]]; then
    score=$(( score - 2 ))
    allergies+=("peanuts")
fi
if [[ score -ge 1 ]]; then
    score=$(( score - 1 ))
    allergies+=("eggs")
fi

# At this point, the score should be = 0
if [[ $score -gt 0 ]]; then exit 1; fi

if [[ $mode == "list" ]]; then
    if [[ "${#allergies[@]}" -ge 1 ]]; then
        str=$(printf "%s\n" "${allergies[@]}" | tac | tr '\n' ' ' | sed 's/[[:space:]]*$//')
        echo $str
    fi
elif [[ $mode == "allergic_to" ]]; then
    checked_allergen=$3
    if [[ "${allergies[*]}" =~ ${checked_allergen} ]]; then
        echo "true"
    else
        echo "false"
    fi
else
    echo "Incorrect mode"
    exit 1
fi