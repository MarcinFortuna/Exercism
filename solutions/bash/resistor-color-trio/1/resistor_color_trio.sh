#!/usr/bin/env bash

colors=("$@")

declare -A resistor_values=(
    [black]="0"
    [brown]="1"
    [red]="2"
    [orange]="3"
    [yellow]="4"
    [green]="5"
    [blue]="6"
    [violet]="7"
    [grey]="8"
    [white]="9"
)

output=""

for i in 0 1 2; do
    val="${resistor_values[${colors[i]}]}"
    if [[ -z $val ]]; then
        echo "Invalid color"
        exit 1
    fi
    if [[ $i < 2 ]]; then
        output="$output$val"
    elif [[ $i == 2 ]]; then
        zeroes=$(printf %${val}s | tr " " "0")
        output="$output$zeroes"
        if [[ $output =~ 0{9}$ ]]; then
            output="${output:0:-9} gigaohms"
        elif [[ $output =~ 0{6}$ ]]; then
            output="${output:0:-6} megaohms"
        elif [[ $output =~ 0{3}$ ]]; then
            output="${output:0:-3} kiloohms"
        else
            output="$output ohms"
        fi
    fi
done

echo $output | sed -e 's/^0\([0-9]\)/\1/'