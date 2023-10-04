#!/bin/bash

files="$(ls config)"

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
	echo "./install.sh [--help, --list, --all] files..."
	echo ""
	echo "Arguments:"
	echo "	--help:	print this help"
	echo "	--list:	list available config files"
	echo "	--all:	install all files from 'config' folder"
	echo ""
	echo "	files:	list of files from 'config' folder to install"
	exit 0
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
			echo $f
			rm -rf ~/.$f
			cp -a config/$f ~/.$f
		fi
	done
	exit 0
fi

for f in $@; do
	if [[ -e config/$f && "$f" != "" ]]; then
		echo $f
		rm -rf ~/.$f
		cp -a config/$f ~/.$f
	else
		echo "Skip unknown file $f"
	fi
done