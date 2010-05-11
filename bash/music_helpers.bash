#!/bin/bash

function clean_spaces () {
	echo "$1" | tr ' ' '_' | sed 's/_-_/-/'
}

function clean_file () {
	local files=$1
	for f in $files
	do
		file_name=`basename "$f"`
		new_name=`clean_spaces "$file_name"`
		if [[ ! -f "$new_name" ]]
		then
			echo mv "$f" "$new_name"
		fi
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
		new_name=`echo $file_name | sed "s/$strip_off//"`
		if [[ ! -f "$new_name" ]]
		then
			mv "$f" "$new_name"
		fi
	done
}

function dasherize_track_and_title () {
	local files=$1
	for f in $files
	do
		file_name=`basename $f`
		new_name=`echo $file_name | sed 's/\(..\)_/\1-/'`
		if [[ ! -f "$new_name" ]]
		then
			mv "$f" "$new_name"
		fi
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
		file_name=`basename $f .ogg`
		twolame "$f" "$file_name.mp2"
		lame "$file_name.mp2" "$file_name.mp3"
		rm "$file_name.ogg"
		rm "$file_name.mp2"
	done
}

function organize_by_metadata () {
	oifs=$IFS
	IFS=''
	local files="$1"

	for fil in $files
	do
		extension=`echo "$fil" | cut -d '.' -f 2`		
		album=` mp3info -p "%l" "$fil"`
		album=`clean_spaces $album`

		artist=`mp3info -p "%a" "$fil"`
		artist=`clean_spaces $artist`

		artist_initial=`echo $artist | sed 's/^\(.\).*/\1/'`

		track=` mp3info -p "%n" "$fil"`
		track=` clean_spaces $track`

		title=` mp3info -p "%t" "$fil"`
		title=` clean_spaces $title`

		bdir="$extension/$artist_initial/$artist/$album/"
		if [[ ! -d $bdir ]]
		then
			mkdir -p $bdir
		fi
		mv "$fil" "$bdir/$track-$title.$extension"
	done
	IFS=$oifs
}
