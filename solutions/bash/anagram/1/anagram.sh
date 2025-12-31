#!/usr/bin/env bash

sort_word_chars() {
    echo "$1" | fold -w1 | sort | tr -d "\n"
}

word_sorted=$(sort_word_chars "${1,,}")

potential_anagrams=($2)
output=()

for el in "${potential_anagrams[@]}"; do
    if [[ "${el,,}" != "${1,,}" ]]; then
        sorted_candidate=$(sort_word_chars "${el,,}")
        if [[ "$sorted_candidate" == "$word_sorted" ]]; then
            output+=("$el")
        fi
    fi
done

echo "${output[@]}"