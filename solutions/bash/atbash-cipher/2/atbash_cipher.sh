#!/usr/bin/env bash

mode=$1
str=$(echo "$2" | tr -d " " | tr "[:upper:]" "[:lower:]")

alphabet=$(echo {a..z})
reverse=$(echo {z..a})

transformed=$(echo "$str" | tr "$alphabet" "$reverse")

if [[ $mode == "encode" ]]; then
    echo -n "$transformed" | tr -d "[:punct:]" | fold -b -w5 | tr "\n" " "
else
    echo "$transformed"
fi