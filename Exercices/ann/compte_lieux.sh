#!/usr/bin/bash

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires.

# Ex2b : Scripts Bash

# set -f   # Désactive l'expansion des jokers (*) pour garder les * littéraux
# faut faire ça dans le terminal avant d'exécuter ce script
# puis faire set +f pr revenir au comportement initual du shell
# sans cette option il faut utiliser "*" dans le shell

ANNEE=$1
MOIS=$2
NBLIEUX=$3

# Vérifie que 3 arguments sont donnés
if [ $# -ne 3 ]
then
    echo "Usage: $0 ANNEE MOIS NBLIEUX"
    exit 1
fi

# if [ "$ANNEE"!="*" ] || [ "$MOIS"!="*" ]
# then   
#     ANNEE=$1
#     MOIS=$2
# else
#     ANNEE="*"
#     MOIS="*"
# fi

### Cette condition ci-dessus ne sert à rien dans l'option set +f 
### car le shell interprète * avant d'exécuter le script donc 
### rien à comparer ici avec les "*" dans le script

if ( 
    ! [[ "$ANNEE" =~ ^(2016|2017|2018|\*)$ ]] || # si ANNEE n'est pas une de ces années ou *
    ( ! [[ "$MOIS" =~ ^(\*)$ ]] && # ou si MOIS n'est pas * et que MOIS < 1 
    ( [[ "$MOIS" -lt 1 ]] || [[ "$MOIS" -gt "12" ]] ) # ou MOIS > 12
    )
)
then
    echo "wrong arguments"
else
    PATTERN="$ANNEE/$ANNEE"_"$MOIS"_*
    cat $PATTERN | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NBLIEUX
fi

# PATTERN="$ANNEE/$ANNEE"_"$MOIS"_*

# echo $PATTERN
#echo $ANNEE/$ANNEE\_$MOIS\_*
#cat "$ANNEE"/"$ANNEE"\_"$MOIS"\_*
# cat $PATTERN | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NBLIEUX