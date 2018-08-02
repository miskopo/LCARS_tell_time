#!/bin/bash

urlencode(){
	python -c "import sys; from urllib.parse import quote; print(quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"
}

urldecode(){
	python -c "import sys; from urllib.parse import unquote; print(unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"
}


for I in {0..23}\ hundred; do
	echo "Downloading $I"
	wget -q -O - 'http://translate.google.com/translate_tts?tl=en&q='$(echo "It's $I hours." | urlencode)'&client=tw-ob' --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" > "$I.mp3";
	sleep 1
done;

for I in {0..23}\ hundred\ {01..59}; do
	echo "Downloading $I"
	wget -q -O - 'http://translate.google.com/translate_tts?tl=en&q='$(echo "It's $I hours." | urlencode)'&client=tw-ob' --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" > "$I.mp3";
	sleep 1
done;

