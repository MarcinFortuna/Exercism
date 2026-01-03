#!/usr/bin/env bash

letter=${1^^}

letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

idx=$(echo $letters | grep -b -o "$letter" | tr -dc 0-9 )

diamond_size=$(( (idx + 1) * 2 - 1 ))

create_line() {
    letter_idx=$1
    char=${letters:${letter_idx}:1}
    spaces_in_the_middle=$(( letter_idx * 2 - 1 ))
    spaces_around=$(( diamond_size / 2 - letter_idx ))
    line="$(printf %${spaces_around}s)$char$((( spaces_in_the_middle > 0 )) && printf %${spaces_in_the_middle}s)$(((letter_idx > 0)) && echo $char)$(printf %${spaces_around}s)"
    echo "$line"
}

# Create the upper half
for (( i=0; i <= idx; i++ )); do
    create_line $i
done

# Create the lower half
for (( i=(( idx - 1 )); i >= 0; i-- )); do
    create_line $i
done


