#!/bin/bash

first=$0
next=$1 && shift;
maybe_last=$1 && shift;
last=$1
date_today=$(date +%e)
today=$(date +%b\ $date_today)
safe_today=$(echo $today | tr ' ' '_')

echo "$first $next $maybe_last $last $today $safe_today"

echo $ARGV
