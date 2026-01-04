#!/usr/bin/env bash

unix_timestamp=$(date -d $1 +"%s")
added_gigasecond=$(( unix_timestamp + 1000000000 ))
date -d @$added_gigasecond +"%Y-%m-%dT%H:%M:%S"