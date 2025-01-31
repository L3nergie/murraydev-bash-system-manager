# Murraydev Bash System Manager

Ce dépôt contient une collection de scripts Bash pour gérer divers aspects de votre système. Chaque script est conçu pour être modulaire, facile à utiliser et à maintenir. Voici une description détaillée de chaque script et de ses fonctionnalités.

---

## Scripts

### 1. `main.sh`

Ce script est le point d'entrée principal du système. Il offre un menu interactif pour exécuter les différents scripts de gestion.

### Fonctionnalités

- **Menu principal** : Interface utilisateur simple pour sélectionner une action.
- **Appel des scripts** : Exécute les scripts correspondants en fonction du choix de l'utilisateur.
- **Journalisation** : Enregistre les résultats dans un fichier de logs pour un suivi ultérieur.

### Utilités

- Vérifier les fichiers en double
- Nettoyer les fichiers temporaires
- Gérer les processus
- Compter les fichiers
- Nettoyer les fichiers de cache
- Vérifier les fichiers en double (version améliorée)

---

### 2. `check_duplicates.sh`

Ce script recherche et supprime les fichiers en double dans un répertoire spécifié.

### Fonctionnalités

- **Recherche récursive** : Parcourt les sous-répertoires pour trouver les fichiers en double.
- **Suppression sécurisée** : Supprime les fichiers en double après confirmation.
- **Progression** : Affiche une barre de progression pour suivre l'avancement.

 Utilités

- Rechercher les fichiers en double
- Supprimer les fichiers en double

---

### 3. `clean_tmp_files.sh`

Ce script nettoie les fichiers temporaires et les caches système pour libérer de l'espace disque.

 Fonctionnalités

- **Nettoyage ciblé** : Supprime les fichiers temporaires et les caches système.
- **Support multi-plateforme** : Nettoie les caches de Visual Studio Code, Android, Flutter, Xcode, etc.
- **Journalisation** : Enregistre les fichiers supprimés dans un fichier de logs.

 Utilités

- Nettoyer les fichiers temporaires
- Nettoyer les caches système

---

### 4. `manage_processes.sh`

Ce script permet de surveiller et de gérer les processus en cours d'exécution.

 Fonctionnalités

- **Surveillance** : Affiche les processus les plus gourmands en CPU et en mémoire.
- **Gestion des processus** : Permet de suspendre ou de reprendre un processus par son PID.
- **Interface interactive** : Menu pour sélectionner les actions à effectuer.

 Utilités

- Afficher les processus gourmands
- Suspendre ou reprendre un processus

---

### 5. `count_files.sh`

Ce script compte les fichiers par extension dans un répertoire spécifié.

 Fonctionnalités

- **Comptage récursif** : Parcourt les sous-répertoires pour compter les fichiers.
- **Affichage structuré** : Affiche le nombre de fichiers par extension et par dossier.
- **Export des résultats** : Option pour exporter les résultats dans un fichier CSV.

 Utilités

- Compter les fichiers par extension

---

### 6. `clean_cache_files.sh`

Ce script nettoie les fichiers de cache en les tronquant ou en les supprimant.

 Fonctionnalités

- **Tronquage intelligent** : Tronque les fichiers `.ts` et `.json` en plusieurs parties de 300 tokens.
- **Suppression sécurisée** : Supprime les fichiers d'origine après tronquage.
- **Journalisation** : Enregistre les actions effectuées dans un fichier de logs.

 Utilités

- Nettoyer les fichiers de cache

---

### 7. `check_duplicates_improved.sh`

Ce script est une version améliorée de `check_duplicates.sh` avec des fonctionnalités supplémentaires.

 Fonctionnalités

- **Vérification des permissions** : Vérifie les permissions de lecture et d'écriture avant toute action.
- **Progression améliorée** : Affiche une barre de progression plus détaillée.
- **Confirmation interactive** : Demande une confirmation avant de supprimer les fichiers en double.

 Utilités

- Rechercher et supprimer les fichiers en double de manière sécurisée

---

## Suggestions d'amélioration

1. **Sécurité renforcée** :
   - Ajouter des vérifications de permissions plus strictes pour éviter les erreurs critiques.
   - Implémenter une option de "mode secours" pour annuler les dernières actions.

2. **Expérience utilisateur** :
   - Améliorer l'affichage de la progression avec des indicateurs visuels (barres de progression, couleurs, etc.).
   - Ajouter des options interactives pour confirmer les actions critiques (comme la suppression de fichiers).

3. **Journalisation avancée** :
   - Ajouter des logs détaillés avec des timestamps et des niveaux de gravité (info, warning, error).
   - Permettre l'export des logs dans différents formats (CSV, JSON).

4. **Documentation** :
   - Ajouter des commentaires détaillés dans chaque script pour faciliter la maintenance.
   - Créer un guide utilisateur complet avec des exemples d'utilisation.

5. **Modularité** :
   - Rendre les scripts plus modulaires pour permettre une réutilisation facile dans d'autres projets.
   - Implémenter des fonctions communes dans un fichier séparé (par exemple, `utils.sh`).

6. **Tests automatisés** :
   - Ajouter des tests unitaires pour chaque script afin de garantir leur fiabilité.
   - Utiliser un framework de test comme `bats` (Bash Automated Testing System).

7. **Compatibilité multi-plateforme** :
   - Adapter les scripts pour fonctionner sur différents systèmes d'exploitation (Linux, macOS, Windows via WSL).

8. **Intégration continue** :
   - Mettre en place un pipeline CI/CD pour automatiser les tests et les déploiements.

---

## Contribution

Les contributions sont les bienvenues ! Voici comment vous pouvez participer :

- **Ouvrir une issue** : Pour signaler un bug ou proposer une amélioration.
- **Soumettre une pull request** : Pour contribuer directement au code.
- **Documentation** : Améliorer la documentation existante ou ajouter des exemples d'utilisation.

Merci de respecter les bonnes pratiques de codage et de tester vos modifications avant de soumettre une pull request.
