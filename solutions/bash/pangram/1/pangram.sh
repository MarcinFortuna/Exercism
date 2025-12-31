#!/usr/bin/env bash

str=$1
alphabet="abcdefghijklmnopqrstuvwxyz"
lower_case_str="${str,,}"

for ((i=0; i<"${#alphabet}"; i++)); do
    if [[ ! $lower_case_str =~ ${alphabet:$i:1} ]]; then
        echo "false"
        exit
    fi
done

echo "true"
