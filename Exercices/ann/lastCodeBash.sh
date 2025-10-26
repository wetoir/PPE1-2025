# !/usr/bin/bash   # ligne shebang, indique que le script 
# doit être exécuté avec l'interprétateur bash, situté là-bas*
if [ $# -ne 1 ] 
then
    echo "ce programme demande un argument"
        exit
fi  # cond ci-dessus termine le script si on ne donne pas 
# exactement 1 argument
FICHIER_URLS=$1 # ce var prends le 1er argu donné -> un fic txtuel à analyser
OK=0    # compteur pr le nb d'urls valides (ligne)
NOK=0   # cpt pr le nb d'urls invalides (ligne)
while read -r LINE; # lit une ligne du fic et la stocke ds la var LINE
do  # -r empêche l'interprétation des caractères d'échappement (\)
    echo " la ligne : $LINE "
    if [[ $LINE =~ ^https?:// ]] 
    then 
        echo "ressemble à une URL valide" 
        OK=$(expr $OK + 1) # expr exécute une opé arithmétique
    else 
        echo "ne ressemble pas à une URL valide" #ensuite incrémente le cpt
        NOK=$(($NOK + 1)) # on peut écrire de cette façon aussi
    fi
done < $FICHIER_URLS    # la redirect° indique la boucle lit ds ce fic
echo "$OK URLs et $NOK lignes douteuses" # affiche le rés final

# [[ ... =~ regex ]] : syntaxe Bash pour tester si une chaîne correspond à une expression régulière.
# ^ -> début de la ligne
# http -> commence par “http”
# s? -> le s est facultatif (donc “http” ou “https”)
# :// -> suivi de ://
# =>Donc la ligne est considérée comme une URL valide si elle commence par http:// ou https://.
