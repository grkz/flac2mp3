#!/bin/bash

mp3dir=~/Muzyka

read -p "Podaj początek nazwy folderu: " letter
echo "Wybierz folder"
select artist in "$letter"*/; do test -n "$artist" && break; echo "Zły katalog."; done
cd "$artist"

echo "Wybierz album"
select album in */; do test -n "$album" && break; echo "Zły album."; done
cd "$album"

#read -p "Parametr kodeka mp3 lame (vbr lub cbr): " codec
codec=cbr

mkdir -p "$mp3dir/$artist/$album"

if [ "$codec" == "vbr" ]; then
	for i in *.flac; do
		avconv -i "$i" -c:a libmp3lame -q:a 0 "$mp3dir/$artist/$album/${i/%flac/mp3}"
	done
elif [ "$codec" == "cbr" ]; then
	for i in *.flac; do
		avconv -i "$i" -c:a libmp3lame -b:a 320k "$mp3dir/$artist/$album/${i/%flac/mp3}"
	done
else
	echo "Zły parametr."
fi

read -rsp "Koniec! Naciśnij dowolny klawisz aby zakończyć." -n1 key

