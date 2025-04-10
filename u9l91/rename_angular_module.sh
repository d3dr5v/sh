#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define old and new module names
OLD_NAME="personal"
NEW_NAME="user-dashboard"

# Define the capitalized versions for case-sensitive replacements
OLD_NAME_CAP="Personal"
NEW_NAME_CAP="UserDashboard"

# Move the main module directory
if [ -d "$OLD_NAME" ]; then
    mv "$OLD_NAME" "$NEW_NAME"
    cd "$NEW_NAME"
else
    echo "Directory '$OLD_NAME' not found."
    exit 1
fi

# Function to replace text in files
replace_text_in_files() {
    find . -type f -exec sed -i '' "$1" {} +
}

# Replace instances of the old name with the new name in file contents
replace_text_in_files "s/${OLD_NAME}-/${NEW_NAME}-/g"

# Rename directories containing the old name
find . -depth -type d -name "*${OLD_NAME}*" | while read dir; do
    parent=$(dirname "$dir")
    newdir=$(basename "$dir" | sed "s/${OLD_NAME}/${NEW_NAME}/g")
    mv "$dir" "$parent/$newdir"
done

# Replace capitalized instances of the old name with the new name
replace_text_in_files "s/${OLD_NAME_CAP}/${NEW_NAME_CAP}/g"

# Rename files containing the old name
find . -type f -name "*${OLD_NAME}*" | while read file; do
    dir=$(dirname "$file")
    newfile=$(basename "$file" | sed "s/${OLD_NAME}/${NEW_NAME}/g")
    mv "$file" "$dir/$newfile"
done

# Replace instances of the old name followed by an uppercase letter
replace_text_in_files "s/${OLD_NAME}\([A-Z]\)/${NEW_NAME_CAP}\1/g"

# Replace remaining instances of the old name with the new name
replace_text_in_files "s/${OLD_NAME}/${NEW_NAME}/g"

echo "Module renaming from '${OLD_NAME}' to '${NEW_NAME}' completed successfully."
