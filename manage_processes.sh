#!/bin/bash
# filepath: manage_processes.sh

# Fonction pour afficher les processus les plus gourmands
show_heavy_processes() {
    echo "Top 10 processus les plus gourmands en CPU :"
    ps aux | sort -nr -k 3 | head -10
    echo -e "\nTop 10 processus les plus gourmands en mémoire :"
    ps aux | sort -nr -k 4 | head -10
}

# Fonction pour suspendre un processus
suspend_process() {
    local pid=$1
    if [ -n "$pid" ]; then
        kill -STOP $pid
        echo "Processus $pid suspendu"
    fi
}

# Fonction pour reprendre un processus
resume_process() {
    local pid=$1
    if [ -n "$pid" ]; then
        kill -CONT $pid
        echo "Processus $pid repris"
    fi
}

# Menu principal
while true; do
    clear
    echo "=== Gestionnaire de Processus ==="
    echo "1. Afficher les processus gourmands"
    echo "2. Suspendre un processus (PID)"
    echo "3. Reprendre un processus (PID)"
    echo "4. Quitter"
    read -p "Choix : " choice

    case $choice in
        1)
            show_heavy_processes
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        2)
            read -p "Entrez le PID du processus à suspendre : " pid
            suspend_process $pid
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        3)
            read -p "Entrez le PID du processus à reprendre : " pid
            resume_process $pid
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Choix invalide"
            sleep 2
            ;;
    esac
done
