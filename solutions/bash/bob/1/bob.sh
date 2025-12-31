#!/usr/bin/env bash

utt="${1//[[:space:]]/}"

question_resp="Sure."
yell_resp="Whoa, chill out!"
yell_question_resp="Calm down, I know what I'm doing!" 
silence_resp="Fine. Be that way!" 
default="Whatever."

if [[ -z $utt ]]; then
    echo $silence_resp
elif [[ $utt =~ [A-Z] && ! $utt =~ [a-z] ]]; then
    [[ ${utt: -1} == "?" ]] && echo $yell_question_resp || echo $yell_resp
elif [[ ${utt: -1} == "?" ]]; then
    echo $question_resp 
else
    echo $default
fi