#!/bin/sh


# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

# Assign the command line arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

#files_count='find "$filesdir" -type f | wc -l'

# Find the number of files and matching lines
file_count=0
line_count=0

# Recursive function to search files in a directory and its subdirectories
search_files() {
    local dir="$1"

    # Iterate over files and directories in the current directory
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            # Increment the file count
            file_count=$((file_count + 1))

            # Count the matching lines in the file
            lines=$(grep -c "$searchstr" "$file")
            line_count=$((line_count + lines))
            # grep -c "$searchstr" "$file" > /dev/null 2>&1
            # if [ $? -eq 0 ]; then
            # match_count=$((match_count + $(grep -c "$searchstr" "$file")))
            # fi
        elif [ -d "$file" ]; then
            # Recursively search files in subdirectories
            search_files "$file"
        fi
    done
}

# Call the search_files func with the specified directory
search_files "$filesdir"

echo "The number of files are $file_count and the number of matching lines are $line_count"
