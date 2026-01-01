#!/usr/bin/env bash

str=$1
num=$(($2 % 26))

alphabet_lc="abcdefghijklmnopqrstuvwxyz"
alphabet_uc=${alphabet_lc^^}

shifted_lc="${alphabet_lc:$num}${alphabet_lc:0:$num}"
shifted_uc="${alphabet_uc:$num}${alphabet_uc:0:$num}"

echo $str | tr $alphabet_lc $shifted_lc | tr $alphabet_uc $shifted_uc 
