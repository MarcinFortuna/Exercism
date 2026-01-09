#!/usr/bin/env bash

input=("$@")

pig_latin() {
    word="$1"
    if [[ $word =~ ^[aeiou] || $word =~ ^(xr|yt) ]]; then
        echo "${word}ay"
    elif [[ $word =~ ^[^aeiou]{0,}qu ]]; then
        echo "$word" | sed -E 's/^([^aeiou]*qu)(.*)/\2\1ay/'
    elif [[ $word =~ ^[^aeiouy]{1,}y ]]; then
        echo "$word" | sed -E 's/^([^aeiouy]+)(.*)/\2\1ay/'
    elif [[ $word =~ ^[^aeiou]{1,} ]]; then
        echo "$word" | sed -E 's/^([^aeiou]+)(.*)/\2\1ay/'
    else
        echo "ERROR! Invalid input."
        exit 1
    fi
}

output=()

for el in "${input[@]}"; do
    output+=($(pig_latin "$el"))
done

echo "${output[*]}"

