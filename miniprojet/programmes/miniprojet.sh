#!/usr/bin/bash

# while read -r line;
# do
# 	echo ${line};
# done < "../urls/fr.txt";

## Ex1 : lire les lignes d'un fic en bash
# 1. On ne fait pas cat "../urls/fr.txt" | while read ... afin de
# ne pas relire le fichier deux fois et qu'on puisse mieux manipuler les variables 
# dans la boucle car sinon pas sûr qu'on peut stocker la valeur d'un sous-shell créé par cat et pipe

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
SITE=""	# Faire une copie de l'entête du site en html afin d'éviter envoyer trop de requête et prendre un code 429 en pleine face 
#mais marche pas avec lynx car lynx ne prend pas de text c'est pour ça j'ai essayé d'autre truc en bas mais marche pas forcément avec un fichier temporaire
echo -e "Ord\tLien\tCodeDeRep\tEncodage\tNbMots" 1>../tableaux/tableau-fr.tsv
while read -r line;
do 
	SITE=$(curl -siL ${line} | grep -e HTTP/ -e charset)
	# curl -s : silent (pas de barre de progression)
  	# curl -i : inclut les en-têtes HTTP
	# curl -L : déroute à la nouvelle adresse (si existe) si l'ancienne ne marche plus, sans cette option les adresses sans https:// au début ne sont pas valides code 301
	# grep HTTP/ chercher l'endroit où y'a le code 
	# cut -d ' ' -f2 change le délimiteur de \t en ' ' puis afficher le 2e champ
	CODE=$(echo "$SITE" | grep HTTP/ | cut -d ' ' -f2 | head -n 2 | tail -n 1)
	CPT=$((CPT + 1))
	# ne garder que la 1ère ligne avec charset, puis couper la ligne en 2 pour garder que le charset=UTF-8, puis le couper en deux aussi
	ENCODAGE=$(echo "$SITE" | grep charset | tail -n 1 | cut -d '"' -f2) 
	# (head -n 1 | cut -d ';' -f2 | cut -d '=' -f2) le premier charset fini par \n donc affichage pas ouf, on peut faire tr -d '\n' afin de supprimer le \n à la fin mais long
	if [[ "$CODE" = "" ]]	# si le site n'existe pas alors le code de réponse et l'encodage sont définis comme ci-dessous
	then 
		CODE="notExiste"
		ENCODAGE="notExiste"
	fi
	# pr dumper le site sans liste des liens, puis pipe pour compter le nb de mots sur ce site, pas curl car sinon compte aussi les balises HTML
	NBMOTS=$(lynx -dump -nolist ${line} | wc -w)
	# echo -e pr reconnaître \t pour séparer avec les tabulations
	echo -e "${CPT}\t${line}\t${CODE}\t${ENCODAGE}\t${NBMOTS}" 1>>../tableaux/tableau-fr.tsv
done < $FICHIER_URLS_CHEMIN


# Essaie avec un fichier temporaire qui donne pas vraiement un résultat fiable
# FICHIER_URLS_CHEMIN=$1
# CPT=-1
# CODE=""
# ENCODAGE=""
# NBMOTS=0
# SITE=""
# TEMPSITE=(mktemp)
# while read -r line;
# do 
#     # SITE=$(curl -siL ${line} | grep -e HTTP/ -e charset) echo "$SITE" puis chercher charset et code marche avec ça mais pas lynx donc besoin TempSite mais résultat pas très positive
# 	curl -siL ${line} -o "$TEMPSITE"
# 	CODE=$(grep HTTP/ "$TEMPSITE" | cut -d ' ' -f2 | head -n 2 | tail -n 1)
# 	CPT=$((CPT + 1))
# 	ENCODAGE=$(grep charset "$TEMPSITE" | tail -n 1 | cut -d '"' -f2) 
#     NBMOTS=$(lynx -dump -nolist "$TEMPSITE" | wc -w)
# 	echo -e "$CPT\t${line}\t$CODE\t$ENCODAGE\t$NBMOTS" 1>>../tableaux/tableau-fr.tsv
# done < $FICHIER_URLS_CHEMIN