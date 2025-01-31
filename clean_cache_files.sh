#!/bin/bash

# Fonction pour tronquer un fichier en plusieurs parties de 300 tokens
split_file() {
    local file="$1"
    local max_tokens=300
    local part=1

    # Lire le fichier ligne par ligne
    while IFS= read -r line; do
        # Compter le nombre de tokens dans la ligne
        local tokens=$(echo "$line" | wc -w)

        # Si le nombre de tokens dépasse la limite, créer un nouveau fichier
        if (( tokens > max_tokens )); then
            echo "$line" | split -l $max_tokens - "$file.part"
            part=$((part + 1))
        else
            echo "$line" >> "$file.part$part"
        fi
    done < "$file"

    # Supprimer le fichier original
    rm -f "$file"
}

# Fonction pour nettoyer les fichiers de cache
clean_cache_files() {
    local dir="$1"

    # Trouver et traiter les fichiers .ts et .json
    find "$dir" -type f \( -name "*.ts" -o -name "*.json" \) | while read -r file; do
        echo "Traitement du fichier : $file"
        split_file "$file"
    done
}

# Spécifiez le répertoire à analyser
directory_to_scan="$HOME"

# Nettoyer les fichiers de cache
echo "Nettoyage des fichiers de cache dans $directory_to_scan..."
clean_cache_files "$directory_to_scan"
