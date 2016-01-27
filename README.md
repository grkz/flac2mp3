# flac2mp3

Converts all FLAC audio files from ./ARTIST_NAME/ALBUM_NAME/ to MP3 files and saves them in $mp3dir/ARTIST_NAME/ALBUM_NAME/ directory. Uses avconv from libav (libav-tools package on Ubuntu/Mint). Works also with ffmpeg instead of avconv.

(Google Music Manager does not re-encode mp3 files converted with lame using constant bitrate - CBR: 320 kbit/s)
