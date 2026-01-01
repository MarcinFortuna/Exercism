#!/usr/bin/env bash

ord_nums=(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
gifts=("a Partridge in a Pear Tree" "two Turtle Doves" "three French Hens" "four Calling Birds" "five Gold Rings" "six Geese-a-Laying" "seven Swans-a-Swimming" "eight Maids-a-Milking" "nine Ladies Dancing" "ten Lords-a-Leaping" "eleven Pipers Piping" "twelve Drummers Drumming")

generate_verse() {
    verse_no=$1
    local l_gifts_str=""
    for (( i=$verse_no-1; i>=0; i-- )); do
        l_gifts_str="${l_gifts_str}${gifts[$i]}"
        if (( i == 1)); then
            l_gifts_str="${l_gifts_str}, and "
        elif (( i != 0 )); then
            l_gifts_str="${l_gifts_str}, "
        fi
    done    
    echo "On the ${ord_nums[$verse_no-1]} day of Christmas my true love gave to me: ${l_gifts_str}."
}

for i in `seq $1 $2`; do
    generate_verse $i
done