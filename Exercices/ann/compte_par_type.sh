#!/usr/bin/bash
#echo "Argument à donner (Location, Person, Organization, Date, Hour, Product ...) : $1" 

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires.

# Ex2a : Scripts Bash

#if [ $1 != " " ]

TYPE=$1
ANNEE=$2

# Vérifie que 2 arguments sont donnés
if [ $# -ne 2 ]
then
    echo "Usage: $0 TYPE ANNEE"
    exit 1
fi

# if [ -n "$TYPE" ] && [ -n "$ANNEE" ]
# then 
# 	cat $ANNEE/* | grep $TYPE | wc -l
# else
# 	echo "Il faut entrer un argument, recommencez !"
# fi

# if [ "$TYPE" != "Location" ] && [ "$TYPE" != "Person" ]
if ! (
	[[ "$TYPE" =~ ^(Location|Person|Organization|Date|Hour|Product)$ ]] && 
	[[ "$ANNEE" =~ ^(2016|2017|2018)$ ]]
)
then
	echo "wrong arguments"
else
	cat $ANNEE/* | grep $TYPE | wc -l
fi