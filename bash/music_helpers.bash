#!/bin/bash

function clean_file () {
	local files=$1
	for f in $files
	do
		file_name=`basename $f`
		mv $f `echo $file_name | tr ' ' '_' | sed 's/_-_/-/'`
	done
}

function title () {
	local file_name=$1
	file_name=`basename $file_name`
	echo $file_name | cut -d '.' -f 1 | cut -d '-' -f 2 | tr '_' ' '
}

function track () {
	local file_name=$1
	file_name=`basename $file_name`
	echo $file_name | cut -d '-' -f 1
}

function strip_part () {
	local strip_off=$1
	local files=$2
	for f in $files
	do
		file_name=`basename $f`
		mv $f `echo $file_name | sed "s/$strip_off//"`
	done
}

function dasherize_track_and_title () {
	local files=$1
	for f in $files
	do
		file_name=`basename $f`
		mv $f `echo $file_name | sed 's/\(..\)_/\1-/'`
	done
}

function set_track_and_title () {
	local files=$1
	for f in $files
	do
		mp3info -n `track $f` -t "`title $f`" $f
	done
}

function ogg2mp3 () {
	for f in *.ogg
	do
		fname=`basename $f .ogg`
		twolame $f $fname.mp2
		lame $fname.mp2 $fname.mp3
		rm $fname.ogg
		rm $fname.mp2
	done
}
