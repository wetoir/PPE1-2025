#!/usr/bin/bash

# while read -r line;
# do
# 	echo ${line};
# done < "../urls/fr.txt";

## Ex1 : lire les lignes d'un fic en bash
# 1. On ne fait pas cat "../urls/fr.txt" afin de
# stocker chaque ligne du fichier dans un variable 
# pour mieux les manipuler

# 2. Pour transformer "../urls/fr.txt" en param du script
# et valider l'argument

# 3. affichier le numéro de ligne av chq URL (sur la même ligne)
# et séparer les valeurs par des tabulations

# if [ $# -ne 1 ]
# then
# 	echo "Il faut exactement 1 argument"
# 	echo "Usage: $0 Chemin_au_fichier_d'urls"
#     exit 1
# fi 

# FICHIER_URLS_CHEMIN=$1
# CPT=-1

# while read -r line;
# do 
# 	CPT=$((CPT + 1))
# 	echo -e "$CPT\t${line}"
# done < $FICHIER_URLS_CHEMIN

## Ex2 :
# 1. le code HTTP de réponse à la requête
# 1.1 ??? Les erreurs peuvent être corrigées

# 2. l'encodafe de la page, s'il est présent

# 3. le nombre de mots dans la page

if [ $# -ne 1 ]
then
	echo "Il faut exactement 1 argument"
	echo "Usage: $0 Chemin_au_fichier_d'urls"
    exit 1
fi 

FICHIER_URLS_CHEMIN=$1
CPT=-1
CODE=""
ENCODAGE=""
NBMOTS=0
while read -r line;
do 
	# curl -s : silent (pas de barre de progression)
  	# curl -i : inclut les en-têtes HTTP
	# curl -L : déroute à la nouvelle adresse (si existe) si l'ancienne ne marche plus
	# grep HTTP/ chercher l'endroit où y'a le code 
	# cut -d ' ' -f2 change le délimiteur de \t en ' ' puis afficher le 2e champ
	CODE=$(curl -si ${line} | grep HTTP/ | cut -d ' ' -f2)
	CPT=$((CPT + 1))
	# ne garder que la 1ère ligne avec charset, puis couper la ligne en 2 pour garder que le charset=UTF-8, puis le couper en deux aussi
	ENCODAGE=$(curl -si ${line} | grep charset | head -n 1 | cut -d ';' -f2 | cut -d '=' -f2)
	# pr dumper le site sans liste des liens, puis pipe pour compter le nb de mots sur ce site, pas curl car sinon compte aussi les balises HTML
	NBMOTS=$(lynx -dump -nolist ${line} | wc -c)
	# echo -e pr reconnaître \t pour séparer avec les tabulations
	echo -e "$CPT\t${line}\t$CODE\t$ENCODAGE\t$NBMOTS"
done < $FICHIER_URLS_CHEMIN

