#!/bin/bash

##
# gvl.sh
#
# Récupère le dernier numéro de version de Git pour Windows sur la page web des downloads
#
# Usage :
# gvl

# Url de la dernière version de Git 
latest_source_release_url="https://git-scm.com/downloads"
# Fichier temporaire pour dernier numéro de version de Git
temp_file="latestGitVersion.txt"

# Télécharge HTML dernière version de Git dans fichier latestGitVersion.txt
# Paramètre --silent : supprime les statistiques 
curl --silent ${latest_source_release_url} > ${myPath100}${temp_file}

# Récupération HTML partiel dans une variable, comprenant le dernier numéro de version de Git
version_number=`grep -A 1 "span class=\"version\"" ${myPath100}${temp_file}`

# Envoi le l'extraction de texte dans le fichier temporaire (Réécriture totale)
echo ${version_number} > ${myPath100}${temp_file}

# Découpage du numéro de version dans une variable
latest_source_release_version=`cut -d ' ' -f 3 ${myPath100}${temp_file}`

# Affichage du dernier numéro de Git pour Windows
echo "Dernière version de Git pour Windows de : https://git-scm.com/downloads"
echo ${latest_source_release_version}

# Suppression du fichier temporaire
rm ${myPath100}${temp_file}
