#!/bin/sh

# The current working directory where the torrent files are located
directory="${PWD#*/}"

# The pattern used to match the files you want to add
pattern='*.torrent'

# For each file that match the pattern in the directory
for file in $directory/$pattern; do
    # Add the file to Transmission-cli
    transmission-cli -w $directory $file
done
