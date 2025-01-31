#!/bin/bash

# Nettoyer les fichiers temporaires
clean_tmp_files() {
    echo "Nettoyage des fichiers temporaires..."

    # Nettoyage des caches système
    local total_files=$(find /Library/Caches/ -type f | wc -l)
    local progress=0
    local increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /Library/Caches/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find ~/Library/Caches/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Caches/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find /Applications/ -name "Xcode*.app" -type d | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /Applications/ -name "Xcode*.app" -type d | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find ~/Library/Developer/Xcode/DerivedData/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Developer/Xcode/DerivedData/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    total_files=$(find ~/Library/Developer/Xcode/Archives/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Developer/Xcode/Archives/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    du -sh ~/* | sort -h

    # Nettoyage des caches de Visual Studio Code
    total_files=$(find ~/Library/Application\ Support/Code/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Application\ Support/Code/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    # Nettoyage des caches Android
    total_files=$(find ~/.android/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/.android/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    total_files=$(find ~/.gradle/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/.gradle/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    total_files=$(find ~/Library/Android/sdk/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Android/sdk/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    total_files=$(find ~/Library/Application\ Support/Google/AndroidStudio*/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Application\ Support/Google/AndroidStudio*/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    # Nettoyage des caches Flutter
    flutter clean
    total_files=$(find ~/.pub-cache/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/.pub-cache/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    total_files=$(find ~/Library/Developer/CoreSimulator/Caches/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Developer/CoreSimulator/Caches/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    # Nettoyage des caches Xcode
    total_files=$(find ~/Library/Developer/Xcode/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Developer/Xcode/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$file"
    done

    # Nettoyage des caches système supplémentaires
    total_files=$(find /private/var/folders/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /private/var/folders/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    # Nettoyage des logs système
    total_files=$(find /private/var/log/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /private/var/log/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find /Library/Logs/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /Library/Logs/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find ~/Library/Logs/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find ~/Library/Logs/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    # Nettoyage des fichiers temporaires
    total_files=$(find /tmp/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /tmp/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    total_files=$(find /var/tmp/ -type f | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /var/tmp/ -type f | while read -r file; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        sudo rm -rf "$file"
    done

    # Nettoyage des dossiers contenant "cache" ou "caches" dans le cloud
    total_files=$(find /Users/ericmurray/Library/Mobile\ Documents/com~apple~CloudDocs/ -type d -name "*cache*" -o -name "*caches*" | wc -l)
    progress=0
    increment=$((total_files / 100))
    if [ $increment -eq 0 ]; then
        increment=1
    fi
    find /Users/ericmurray/Library/Mobile\ Documents/com~apple~CloudDocs/ -type d -name "*cache*" -o -name "*caches*" | while read -r dir; do
        progress=$((progress + increment))
        echo "Progress: $progress%"
        rm -rf "$dir"
    done

    echo "Nettoyage terminé."
}

# Exécution de la fonction de nettoyage
clean_tmp_files
