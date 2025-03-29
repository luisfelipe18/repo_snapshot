#!/bin/bash

# Output file name
OUTPUT_FILE="repo_content.txt"

# Script name (to ignore it)
SCRIPT_NAME=$(basename "$0")

# Check if tree is installed
if ! command -v tree &> /dev/null; then
    echo "The 'tree' command is not installed. Please install it first."
    exit 1
fi

# Create or overwrite the output file
echo "Repo Structure:" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Run tree and add its output to the file
tree -I "$SCRIPT_NAME|$OUTPUT_FILE" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "===========================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Repo Content:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find all files with the specified extensions
# and exclude this script and the output file
find . -type f \( -name "*.txt" -o -name "*.json" -o -name "*.toml" -o -name "*.yaml" -o -name "*.py" -o -name "*.groovy" -o -name "Dockerfile" -o -name "serve" \) -not -path "*/$SCRIPT_NAME" -not -path "*/$OUTPUT_FILE" | sort | while read -r file; do
    # Check if the file is not this script or the output file
    if [[ "$(basename "$file")" != "$SCRIPT_NAME" && "$(basename "$file")" != "$OUTPUT_FILE" ]]; then
        echo "File: $file" >> "$OUTPUT_FILE"
        echo "===========================================" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "===========================================" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
done

echo "Repository content has been saved to $OUTPUT_FILE"