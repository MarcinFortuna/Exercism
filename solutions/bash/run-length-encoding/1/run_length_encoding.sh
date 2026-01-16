#!/usr/bin/env bash

input="$2"
[[ -z $input ]] && { exit; }

mode="$1"

encode() {
    output=""
    while (( "${#input}" > 0 )); do
        char="${input:$1:1}"
        sequence=$(echo "$input" | grep -Eo "^${char}+")
        len="${#sequence}"
        (( len > 1 )) && { output="$output$len"; }
        output+="$char"
        input="${input:$len}"
    done
    echo "$output"
}

decode() {
    output=""
    num=1
    while (( "${#input}" > 0 )); do
        if [[ "${input}" =~ ^[0-9] ]]; then
            num=$(echo "$input" | grep -Eo "^[0-9]+")
            num_len="${#num}"
            input="${input:$num_len}"
        else
            char="${input:0:1}"
            for (( i=0; i<num; i++ )); do
                output+="$char"
            done
            input="${input:1}"
            num=1
        fi
    done
    echo "$output"
}

$mode