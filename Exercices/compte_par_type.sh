#!/usr/bin/bash
#echo "Argument à donner (Location, Person, Organization, ...) : $1" 

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires.

#if [ $1 != " " ]

TYPE=$1
ANNEE=$2

if [ -n "$TYPE" ] && [ -n "$ANNEE" ]
then 
	cat $ANNEE/* | grep $TYPE | wc -l
else
	echo "Il faut entrer un argument, recommencez !"
fi

