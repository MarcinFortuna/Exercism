#!/usr/bin/env bash

level=$1
argv=("$@")

find_multiples_until_threshold() {
    threshold=$(( $1 - 1 ))
    num=$2
    if [[ $num -gt 0 ]]; then
        seq -s " " $num $num $threshold
    else
        echo "0"
    fi
}

multiples=""

for (( i=1; i<"$#"; i++ )); do
    multiples_of_arg=$(find_multiples_until_threshold $level ${argv[$i]})
    multiples+=" $multiples_of_arg"
done

multiples=$(echo $multiples | sed -e "s/^[[:space:]]*//" -e "s/[[:space:]]*$//")

[[ ! $multiples =~ [1-9] ]] && { echo "0"; exit; }

echo -n $multiples | tr " " "\n" | sort -n | uniq | tr "\n" "+" | sed -e "s/+$/\n/" | bc