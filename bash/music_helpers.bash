#!/bin/bash

function clean_file () {
	local file_name=$1
	echo $file_name | tr ' ' '_' | sed 's/_-_/-/'
}

function title () {
	local file_name=$1
	echo $file_name | cut -d '.' -f 1 | cut -d '-' -f 2 | tr '_' ' '
}

function track () {
	local file_name=$1
	echo $file_name | cut -d '-' -f 1
}

function strip_part () {
	local strip_off=$1
	local file_name=$2
	echo $file_name | sed s/$strip_off//
}

function dasherize_track_and_title () {
	local file_name=$1
	echo $file_name | sed 's/\(..\)_/\1-/'
}
