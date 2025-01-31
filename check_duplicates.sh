#!/bin/bash

# Rechercher les fichiers en double dans le répertoire spécifié
find_duplicates() {
    local dir="$1"
    local total_files=$(find "$dir" -type f 2>/dev/null | wc -l)
    local progress=0
    local increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find "$dir" -type f 2>/dev/null | while read -r file; do
        if [ -r "$file" ]; then
            progress=$((progress + increment))
            echo "Progress: $progress%"
            md5sum "$file"
        else
            echo "Operation not permitted: $file"
        fi
    done | sort | uniq -w32 -dD
}

# Supprimer les fichiers en double
delete_duplicates() {
    local dir="$1"
    local total_files=$(find "$dir" -type f 2>/dev/null | wc -l)
    local progress=0
    local increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find "$dir" -type f 2>/dev/null | while read -r file; do
        if [ -r "$file" ]; then
            # Vérifier si le fichier se trouve dans le répertoire cloud
            if [[ "$file" == /Users/ericmurray/Library/Mobile\ Documents/com~apple~CloudDocs/* ]]; then
                progress=$((progress + increment))
                echo "Progress: $progress%"
                rm -v "$file"
            else
                echo "File not in cloud directory: $file"
            fi
        else
            echo "Operation not permitted: $file"
        fi
    done
}

# Spécifiez le répertoire à analyser
directory_to_scan="$HOME"

# Rechercher les fichiers en double
echo "Rechercher les fichiers en double dans $directory_to_scan..."
find_duplicates "$directory_to_scan"

# Supprimer les fichiers en double
echo "Supprimer les fichiers en double dans $directory_to_scan..."
delete_duplicates "$directory_to_scan"
