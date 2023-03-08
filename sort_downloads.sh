#!/bin/bash

# Define the main downloads directory
downloads_dir="$HOME/Downloads"

# Define subdirectories for different file formats
docs_dir="$downloads_dir/Documents"
images_dir="$downloads_dir/Images"
music_dir="$downloads_dir/Music"
videos_dir="$downloads_dir/Videos"
zip_dir="$downloads_dir/Zips"
# Create the subdirectories if they don't already exist
mkdir -p "$docs_dir" "$images_dir" "$music_dir" "$videos_dir" "$zip_dir"

# Move files to the appropriate subdirectories based on the file format
for file in "$downloads_dir"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    extension="${filename##*.}"
    case "$extension" in
    doc | docx | pdf)
      mv "$file" "$docs_dir"
      ;;
    jpg | jpeg | JPEG | JPG | png | gif | heic | HEIC)
      mv "$file" "$images_dir"
      ;;
    mp3 | flac | wav | wave)
      mv "$file" "$music_dir"
      ;;
    mp4 | mov | MOV)
      mv "$file" "$videos_dir"
      ;;
    zip)
      mv "$file" "$zip_dir"
      ;;
    dmg)
      rm "$file"
      ;;
    esac
  fi
done
