#!/bin/bash

	# check user input for browser choice
	if [ "$1" == "f" ]
	then
		BROWSER="firefox"
	elif [ "$1" == "c" ]
	then
		BROWSER="chromium"
	else
		BROWSER="safari"
	fi

echo

function searchWeb {
	echo
	echo "type in your query"
	echo
	read INPUT
	num=$(echo $INPUT | wc -w)

	# check for multiple words query
	if [ $num == 1 ]
	then
		open -a $BROWSER $1$INPUT
	elif [ $num -gt 1 ]
	then
		NEWIN=${INPUT// /+}
		# https://www.google.com/search?q=just+an+example
		open -a $BROWSER $1$NEWIN
	else
		echo "nope"
	fi
}

# check for search engine
read -n 1 -p "where do you want to search, google or youtube? (g/y) " CHOICE;

	case $CHOICE in
		g|G)
			GOOGLE="https://www.google.com/search?q="
			searchWeb $GOOGLE;;
		y|Y)
			YOUTUBE="https://www.youtube.com/results?search_query="
			searchWeb $YOUTUBE;;
		*)
			echo "bye"
			exit;;
	esac

exit 1
