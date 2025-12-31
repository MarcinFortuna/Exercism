#!/usr/bin/env bash
listA="${1:1:(-1)},"
listB="${2:1:(-1)},"
if [[ "$listA" == "$listB" ]]; then
    echo "equal"
elif [[ $listA =~ $listB ]]; then
    echo "superlist"
elif [[ $listB =~ $listA ]]; then
    echo "sublist"
else
    echo "unequal"
fi
