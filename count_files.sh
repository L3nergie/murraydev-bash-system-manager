#!/bin/bash

# Fonction pour compter les fichiers et lister les dossiers
count_files() {
    local extension="$1"
    echo "Recherche des fichiers *.$extension..."

    # Trouver et compter les fichiers, puis lister les dossiers avec le nombre de fichiers
    find / -type f -name "*.$extension" 2>/dev/null | awk -F/ '{
        count[$0]++
        dir=""
        for (i=1; i<NF; i++) dir=dir"/"$i
        dir_count[dir]++
    } END {
        for (dir in dir_count) {
            print dir_count[dir], dir
        }
    }' | sort -nr
}

# Compter les fichiers .json
count_files "json"

# Compter les fichiers .ts
count_files "ts"

# Compter les fichiers .db
count_files "db"
