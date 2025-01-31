#!/bin/bash

# Fonction pour vérifier les permissions
check_permissions() {
    if [ ! -d "$1" ]; then
        echo "Erreur : $1 n'est pas un répertoire valide"
        exit 1
    fi
    if [ ! -r "$1" ]; then
        echo "Erreur : Pas de permission de lecture sur $1"
        exit 1
    fi
}

# Fonction pour afficher la progression
show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percent=$((current * 100 / total))
    local filled=$((current * width / total))
    printf "\r["
    printf "%${filled}s" | tr ' ' '#'
    printf "%$((width-filled))s" | tr ' ' '-'
    printf "] %3d%%" $percent
}

# Rechercher les fichiers en double
find_duplicates() {
    local dir="$1"
    local total_files=$(find "$dir" -type f 2>/dev/null | wc -l)
    local count=0

    echo "Analyse de $total_files fichiers..."

    find "$dir" -type f 2>/dev/null | while read -r file; do
        if [ -r "$file" ]; then
            count=$((count + 1))
            show_progress $count $total_files
            md5sum "$file"
        else
            echo -e "\nAvertissement : Pas de permission de lecture sur $file"
        fi
    done | sort | uniq -w32 -dD
}

# Supprimer les fichiers en double
delete_duplicates() {
    local dir="$1"
    local duplicates=$(find_duplicates "$dir")

    if [ -z "$duplicates" ]; then
        echo -e "\nAucun fichier en double trouvé."
        return
    fi

    echo -e "\nFichiers en double trouvés :"
    echo "$duplicates"

    read -p "Voulez-vous vraiment supprimer ces fichiers en double ? (y/n) " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        echo "$duplicates" | awk '{print $2}' | while read -r file; do
            if [ -w "$file" ]; then
                rm -v "$file"
            else
                echo "Avertissement : Pas de permission d'écriture sur $file"
            fi
        done
        echo "Suppression terminée."
    else
        echo "Annulation de la suppression."
    fi
}

# Vérifier les arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 /chemin/du/repertoire"
    exit 1
fi

directory_to_scan="$1"

# Vérifier les permissions
check_permissions "$directory_to_scan"
