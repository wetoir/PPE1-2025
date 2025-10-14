#!/usr/bin/bash

#Ce programme s'exécute correctement lorsqu'il se situe dans le dossier ann qui contient les sous-dossiers 2016, 2017 et 2018 qui à leur tour contiennent les fichiers .ann nécessaires. 

echo "Nombre de Location en 2016 est : "
cat 2016/* | grep Location | wc -l 
echo "Nombre de Location en 2017 est : "
cat 2017/* | grep Location | wc -l
echo "Nombre de Location en 2018 est : "
cat 2018/* | grep Location | wc -l
