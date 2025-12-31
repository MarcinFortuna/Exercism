#!/usr/bin/env bash

input=$(echo ${1,,} | tr -d " " | tr -d "-")

org_input_length=${#input}
dedupl_input_length=$(echo $input | fold -w1 | sort -u | tr -d "\n" | wc -m)

[[ $org_input_length -eq $dedupl_input_length ]] && echo "true" || echo "false"

