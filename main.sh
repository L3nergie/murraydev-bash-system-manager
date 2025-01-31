#!/bin/bash

# Fonction pour vérifier les fichiers en double sur le serveur cloud Apple et les nettoyer
check_duplicates() {
    # Appel du script pour vérifier les fichiers en double
    ./check_duplicates.sh
}

# Fonction pour nettoyer les fichiers temporaires
clean_tmp_files() {
    # Appel du script pour nettoyer les fichiers temporaires
    ./clean_tmp_files.sh
}

# Fonction pour gérer les processus
manage_processes() {
    # Appel du script pour gérer les processus
    ./manage_processes.sh
}

# Fonction pour compter les fichiers
count_files() {
    # Appel du script pour compter les fichiers
    ./count_files.sh
}

# Fonction pour nettoyer les fichiers de cache
clean_cache_files() {
    # Appel du script pour nettoyer les fichiers de cache
    ./clean_cache_files.sh
}

# Fonction pour vérifier les fichiers en double amélioré
check_duplicates_improved() {
    # Appel du script pour vérifier les fichiers en double amélioré
    ./check_duplicates_improved.sh
}

# Exécution des fonctions
echo "=== Menu Principal ==="
echo "1. Vérifier les fichiers en double"
echo "2. Nettoyer les fichiers temporaires"
echo "3. Gérer les processus"
echo "4. Compter les fichiers"
echo "5. Nettoyer les fichiers de cache"
echo "6. Vérifier les fichiers en double amélioré"
echo "7. Quitter"
read -p "Choix : " choice

case $choice in
    1)
        check_duplicates
        ;;
    2)
        clean_tmp_files
        ;;
    3)
        manage_processes
        ;;
    4)
        count_files
        ;;
    5)
        clean_cache_files
        ;;
    6)
        check_duplicates_improved
        ;;
    7)
        exit 0
        ;;
    *)
        echo "Choix invalide"
        ;;
esac

# Enregistrement des résultats dans un fichier de logs
echo "Début du nettoyage : $(date)" > clean_log.txt
echo "Vérification des fichiers en double..." >> clean_log.txt
./check_duplicates.sh >> clean_log.txt
echo "Nettoyage des fichiers temporaires..." >> clean_log.txt
./clean_tmp_files.sh >> clean_log.txt
echo "Gestion des processus..." >> clean_log.txt
./manage_processes.sh >> clean_log.txt
echo "Compte des fichiers..." >> clean_log.txt
./count_files.sh >> clean_log.txt
echo "Nettoyage des fichiers de cache..." >> clean_log.txt
./clean_cache_files.sh >> clean_log.txt
echo "Vérification des fichiers en double améliorée..." >> clean_log.txt
./check_duplicates_improved.sh >> clean_log.txt
echo "Nettoyage terminé : $(date)" >> clean_log.txt
