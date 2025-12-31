#!/usr/bin/env bash

input=$1
invalid_str='Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9'
clean=$(echo -n $input | sed -e "s/[^0-9]//g" | sed -e "s/^1//")

[[ $clean =~ ^[2-9][0-9]{2}[2-9][0-9]{6}$ ]] && echo "$clean" || { echo "$invalid_str"; exit 1; }
