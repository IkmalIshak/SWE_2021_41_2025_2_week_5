#!/bin/bash

cd "$(dirname "$0")"
FILES_DIR="./files"

for file in "$FILES_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        first_char=$(echo "${filename:0:1}" | tr '[:upper:]' '[:lower:]')
        if [ -d "$first_char" ]; then
            mv "$file" "$first_char"/
            echo "Moved $filename → $first_char/"
        else
            echo "No folder for $filename (starts with '$first_char')"
        fi
    fi
done

echo "✅ Files successfully moved."