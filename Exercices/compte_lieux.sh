#!/usr/bin/bash

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires.


ANNEE=$1
MOIS=$2
NBLIEUX=$3

PATTERN="$ANNEE/$ANNEE"_"$MOIS"_*

#echo $ANNEE/$ANNEE\_$MOIS\_*
#cat "$ANNEE"/"$ANNEE"\_"$MOIS"\_*
cat $PATTERN | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NBLIEUX

