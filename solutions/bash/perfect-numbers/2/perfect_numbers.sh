#!/usr/bin/env bash

num=$1

(( num < 1 )) && { echo "Classification is only possible for natural numbers."; exit 1; }
(( num == 1 )) && { echo "deficient"; exit; }

determine_factors_and_sum() {
    local num=$1
    local list_of_factors=(1)
    local limit=$(bc <<< "scale=0; sqrt("$num")")

    for (( i=2; i<=limit; i++ )); do
        if (( num % i == 0 )); then
            list_of_factors+=("$i")
            list_of_factors+=("$((num / i))")
        fi
    done
    
    #Sort, deduplicate, sum
    bc <<< $(echo "${list_of_factors[*]}" | tr " " "\n" | sort -nu | tr "\n" "+"  | sed -e "s/\+$//")
}

sum=$(determine_factors_and_sum $num)

if (( sum == num )); then 
    echo "perfect"
elif (( sum > num )); then
    echo "abundant"
else
    echo "deficient"
fi