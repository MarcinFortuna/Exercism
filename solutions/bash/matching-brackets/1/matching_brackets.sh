#!/usr/bin/env bash

input=$(echo -n "$1" | awk '{ gsub(/[^(){}\]\[]/, ""); print }')

# Get rid of all instances of consecutive pairs until there are none left
while [[ $(echo $input | grep -oE "(\[\]|\{\}|\(\))") ]]; do
    input=$(echo -n "$input" | awk '{ gsub(/({}|\(\)|\[\])/, ""); print }')
done
    
((${#input} == 0)) && echo "true" || echo "false"




