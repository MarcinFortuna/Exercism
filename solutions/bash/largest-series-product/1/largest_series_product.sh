#!/usr/bin/env bash

input=$1
span_length=$2

if [[ ${#input} -lt $span_length ]]; then
    echo "span must not exceed string length"
    exit 1
fi

if [[ ! "$input" =~ ^[0-9]+$ ]]; then
    echo "input must only contain digits"
    exit 1
fi

if [[ "$span_length" -lt 0 ]]; then
    echo "span must not be negative"
    exit 1
fi

largest_product=0

for (( i=0; i<="${#input}-$span_length"; i++ )); do
    product=1
    for (( j=0; j<"$span_length"; j++ )); do
        product=$((product * "${input:i+j:1}"))
    done
    if [[ $product -gt $largest_product  ]]; then
        largest_product=$product
    fi
done

echo $largest_product