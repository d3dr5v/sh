#!/bin/bash

# Path to timesheets file
TIMESHEETS="$HOME/@/txt/9WJXc/timesheets"

# Get commit message from arguments
COMMIT_MSG="$*"

if [ -z "$COMMIT_MSG" ]; then
    echo "Error: No commit message provided"
    exit 1
fi

# Ensure directory and file exist
mkdir -p "$(dirname "$TIMESHEETS")"
touch "$TIMESHEETS"

# Check if file is empty or last line is empty
if [ ! -s "$TIMESHEETS" ]; then
    # File is empty - start new line with just the commit message
    echo "$COMMIT_MSG" >> "$TIMESHEETS"
else
    # Read last line
    LAST_LINE=$(tail -n 1 "$TIMESHEETS")

    # Append new commit to existing commits
    NEW_COMMITS="${LAST_LINE}. ${COMMIT_MSG}"

    # Remove last line
    sed -i '' -e '$ d' "$TIMESHEETS"

    # Write updated commits line
    echo "$NEW_COMMITS" >> "$TIMESHEETS"
fi

# Perform the actual git commit
git commit -m "$COMMIT_MSG"
