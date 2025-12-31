#!/usr/bin/env bash
num=$1
str=$(printf "%s" $num)
chars=${#str}
armstrong_sum=0

for (( i=0; i<$chars; i++ )); do
  char="${str:$i:1}"
  power=$((char ** chars))
  ((armstrong_sum += power))
done

[[ $armstrong_sum == $num ]] && echo "true" || echo "false"