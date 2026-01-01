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

# ROUND FUNCTION: From StackOverflow
# Source - https://stackoverflow.com/a
# Posted by gniourf_gniourf, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-01, License - CC BY-SA 3.0

round() {
    # $1 is expression to round (should be a valid bc expression)
    # $2 is number of decimal figures (optional). Defaults to three if none given
    local df=${2:-3}
    printf '%.*f\n' "$df" "$(bc -l <<< "a=$1; if(a>0) a+=5/10^($df+1) else if (a<0) a-=5/10^($df+1); scale=$df; a/1")"
}

rounded=$(round $result 2)
echo $rounded