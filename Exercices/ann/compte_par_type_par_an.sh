#!/usr/bin/bash

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires.

# Ex2a : Scripts Bash

TYPE=$1 
ANNEE=2016

# Vérifie que 1 argument est donné
if [ $# -ne 1 ]
then
    echo "Usage: $0 TYPE"
    exit 1
fi

VAR1="$(bash compte_par_type.sh "$TYPE" 2016)"
echo "Le nombre de "$TYPE" en 2016 est : ${VAR1}"
VAR1="$(bash compte_par_type.sh "$TYPE" 2017)"
echo "Le nombre de "$TYPE" en 2017 est : ${VAR1}"
VAR1="$(bash compte_par_type.sh "$TYPE" $(($ANNEE + 2)))"
echo "Le nombre de "$TYPE" en $((ANNEE + 2)) est : ${VAR1}"


