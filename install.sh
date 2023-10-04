#!/bin/bash

files="$(ls config)"

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
	echo "./install.sh [--target <target>] [--help, --list, --all] files..."
	echo ""
	echo "Options:"
	echo ""
	echo "	--target <target>:	target folder to copy files to. Default to user's home folder"
	echo ""
	echo "Arguments:"
	echo ""
	echo "	--help:	print this help"
	echo ""
	echo "	--list:	list available config files"
	echo ""
	echo "	--all:	install all files from 'config' folder"
	echo ""
	echo "	files:	list of files from 'config' folder to install"
	exit 0
fi

TARGET=$HOME

if [[ "$1" == "--target" ]]; then
	if [[ -e "$2" && "$2" != "" ]]; then
		TARGET="$2"
	else
		echo "Missing target folder"
		exit 1
	fi
	shift
	shift
fi

if [[ "$1" == "--list" ]]; then
	for f in $files; do
		echo $f
	done
	exit 0
fi

if [[ "$1" == "--all" || $# -eq 0 ]]; then
	for f in $files; do
		if [[ -e config/$f && "$f" != "" ]]; then
			echo $TARGET/.$f
			rm -rf $TARGET/.$f
			cp -a config/$f $TARGET/.$f
		fi
	done
	exit 0
fi

for f in $@; do
	if [[ -e config/$f && "$f" != "" ]]; then
		echo $TARGET/.$f
		rm -rf $TARGET/.$f
		cp -a config/$f $TARGET/.$f
	else
		echo "Skip unknown file $f"
	fi
done