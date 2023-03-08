#!/bin/bash

# set the source and destination directories

src_dir="$HOME/Desktop"
dest_dir="$HOME/Desktop/screenshots"

# move all files with the "screen" in the filename from the source directory to the destination directory

mv "$src_dir/Screen"*.png "$dest_dir/"
mv "$src_dir/Screen"*.png "$dest_dir/"
mv "$src_dir/Screen"*.png "$dest_dir/"

#organize screenshots into folders by date.

cd "$dest_dir"
for file in *.png *.jpg *.jpeg; do
    if [ -f "$file" ]; then
        date=$(stat -f "%Sm" -t "%Y-%m-%d" "$file")
        year=$(echo "$date" | cut -d'-' -f1)
        month=$(echo "$date" | cut -d'-' -f2)
        mkdir -p "$dest_dir/$year/$month"
        mv "$file" "$dest_dir/$year/$month/"
    fi
done
