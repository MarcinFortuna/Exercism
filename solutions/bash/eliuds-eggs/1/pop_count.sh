#!/usr/bin/env bash

convert_dec_to_binary() {
    dec=$1
    bin=""
    while (( $dec > 0 )); do
        bin="$(( dec % 2 ))${bin}"
        dec=$(( dec / 2 ))
    done
    echo "$bin"
}

count_ones_in_bin_string() {
    echo -n $1 | tr -d "0" | wc -m
}

count_ones_in_bin_string $(convert_dec_to_binary $1)
