#!/usr/bin/env bash

planet=$1
age_seconds=$2

declare -A planets_years=(
    [Mercury]=0.2408467
    [Venus]=0.61519726
    [Earth]=1.0
    [Mars]=1.8808158
    [Jupiter]=11.862615
    [Saturn]=29.447498
    [Uranus]=84.016846
    [Neptune]=164.79132
)

if [[ -z ${planets_years[$planet]} ]]; then
    echo "not a planet"
    exit 1
fi

result=$(echo "scale=10; ($2 / ( 365.25 * 24 * 3600 ) / ${planets_years[$planet]})" | bc)

printf "%.2f" $result