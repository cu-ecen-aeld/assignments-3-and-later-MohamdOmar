#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

# Assign the command line arguments to variables
writefile="$1"
writestr="$2"

# Check if writefile argument is specified
if [ -z "$writefile" ]; then
    echo "Error: writefile argument is not specified."
    exit 1
fi

# Check if writestr argument is specified
if [ -z "$writestr" ]; then
    echo "Error: writestr argument is not specified."
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file."
    exit 1
fi

# Print success message
echo "File created: $writefile"
