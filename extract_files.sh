#!/bin/bash

# Loop through all the .zip files in the current directory
for file in *.zip; do
  # Get the filename without the extension
  folder_name="${file%.zip}"
  
  # Check if the folder already exists
  if [ -d "$folder_name" ]; then
    echo "Skipping $file as $folder_name already exists."
    continue  # Skip to the next file
  fi

  # Create a new folder
  mkdir -p "$folder_name"

  # Move the zip file into the corresponding folder
  mv "$file" "$folder_name/"
  
  # Extract the zip file inside its folder
  unzip "$folder_name/$file" -d "$folder_name"
  
  echo "Extracted $file into $folder_name/"
done

echo "All files have been processed."
