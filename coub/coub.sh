#!/usr/bin/env bash

set -e
name=$(echo $1 | cut -d '/' -f 5)
loops=50

youtube-dl -o ${name}_.mp4 "$1"
youtube-dl -f html5-audio-high -o ${name}.mp3 "$1"

printf '\x00\x00' | dd of=${name}_.mp4 bs=1 count=2 conv=notrunc
for i in `seq 1 "$loops"`; do echo "file '${name}_.mp4'" >> ${name}.txt; done

ffmpeg -hide_banner -t 10 -f concat -i ${name}.txt -i ${name}.mp3 -c copy -shortest -movflags faststart "$name".mp4

# Version without watermark
echo '' > "${name}.txt"
./remove_watermark.py "${name}_.mp4"
for i in `seq 1 "$loops"`; do echo "file '${name}_.mp4.avi'" >> ${name}.txt; done
ffmpeg -hide_banner -t 10 -f concat -i ${name}.txt -i ${name}.mp3 -c copy -shortest -movflags faststart "$name".mp4.avi

rm ${name}_.mp4 ${name}.mp3 ${name}.txt ${name}_.mp4.avi

