#!/bin/bash -x

#troubleshoot and debug code. 

# Define icloud directory 
icClean_dir="/Library/Mobile\ Documents/com~apple~CloudDocs/Desktop/IC_Cleanup"

# Define subdirectories for different file formats
docs_dir="$icClean_dir/Documents"
images_dir="$icClean_dir/Images"
music_dir="$icClean_dir/Music"
videos_dir="$icClean_dir/Videos"
zip_dir="$icClean_dir/Zips"

# Create the subdirectories if they don't already exist
mkdir -p "$docs_dir" "$images_dir" "$music_dir" "$videos_dir" "$zip_dir"

# Move files to the appropriate subdirectories based on the file format
for file in "$icClean_dir"/*; do
    if [ -f "$file" ]; then
        echo "Processing file: $file"
        filename=$(basename "$file")
        extension="${filename##*.}"
        case "$extension" in
        doc | docx | pdf)
            echo "Moving file to $docs_dir: $file"
            mv "$file" "$docs_dir"
            ;;
        jpg | jpeg | JPEG | JPG | png | gif | heic | HEIC)
            echo "Moving file to $images_dir: $file"
            mv "$file" "$images_dir"
            ;;
        mp3 | flac | wav | wave)
            echo "Moving file to $music_dir: $file"
            mv "$file" "$music_dir"
            ;;
        mp4 | mov | MOV)
            echo "Moving file to $videos_dir: $file"
            mv "$file" "$videos_dir"
            ;;
        zip)
            echo "Moving file to $zip_dir: $file"
            mv "$file" "$zip_dir"
            ;;
        dmg)
            echo "Removing file: $file"
            rm "$file"
            ;;
        esac
    fi
done
