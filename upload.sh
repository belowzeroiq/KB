#!/bin/bash

# Variables
REPO="belowzeroiq/KB" # Replace with your GitHub username/repo
TAG="v1.0"                 # Replace with your desired tag
RELEASE_NAME="Kernel Build $TAG"
FILE_PATH="out/arch/arm64/boot/Image" # Path to the kernel Image output

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "Kernel Image not found at $FILE_PATH"
    exit 1
fi

# Create a release (if it doesn't exist)
gh release create "$TAG" "$FILE_PATH" --repo "$REPO" --title "$RELEASE_NAME" --notes "Kernel build for $TAG"

echo "Kernel Image uploaded to GitHub release: $TAG"