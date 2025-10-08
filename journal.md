<<<<<<< HEAD
### rien juste là pour les conflits
=======
# Journal de bord du projet encadré
>>>>>>> ecb560fbc6020c37318e19f3c982607340755974

## 1er cours (24/09/25) : commandes linux
Pour le premier cours, on a fait un peu de l'histoire du système Linux. Puis on a fait des manipulations afin de créer une clé SSH à la fin mais on n'a pas le temps de finir. On a aussi parlé des pipelines. A la maison, on a une exercice qui nous aide à nous familariser avec les commandes de base d'Unix. En effet, ayant un peu de base, cette exercice n'est pas vraiment une casse-tête pour moi. Cependant elle demande pas mal de temps.

L'avantage avec les commandes de Linux est qu'on peut faire plusieurs choses en temps. Par exemple créer plusieurs dossiers ou de les tous déplacer en même temps. Aussi avec * qu'on peut trier rapidement des fichiers.

Exemples : `mv /home/xubuntu/Downloads 2016*.txt .` 
`mkdir 01 02 03` etc

Après avoir fait cette exercice, je le met sur mon github.


## 2e cours (01/10/25) : git
Pour le deuxième cours, nous avons pris le temps pour corriger l'exercice à faire pour ce 2ème cours sur les commandes d'Unix. 
Puis nous avons fini de créer notre clé SSH et l'importer dans notre git.
Puis nous faisons des manipulations de git comme cloner le répertoire du cours ou de créer une git à nous même et puis la mettre à jour. 
En suite nous mettons à jour un fichier, per exemple README.md avec la commande echo. Voici les étapes :
`echo hello >> README.md`

Puis on met à jour notre git
`git add README.md`

`git commit -m "Modif readme.md"`

`git push`

Puis on fait la configuration de notre git avec git config.
`git config user.email "gialoc2001@gmail.com"`

`git config user.name "Loc PHAM"`

`git show` pour avoir l'info sur dernière action

`git shortlog -n -s` pour avoir l'info sur contribution

`git tag` pour marquer un commit marqueur (par ex dire le moment qu'on a fini une exercice)

`git log` pour voir l'ensemble des commit

## exo git 
J'ai suivi ce qu'il faut faire. à l'étape où il faut vérifier si je suis en retard avec le dépôt à distance, j'ai utilisé `git fetch` afin de récupérer les métadonnées du dépôt distance, puis `git status` pour voir si j'ai du retard. 
Effectivement, on m'a indiqué je suis en retard car le fichier `journal.md` n'existe pas sur le dépôt local.

Puis j'ai créé un fichier `journal.md` dans mon dépôt local et y ai ajouté une ligne de texte différente que celle dans le fichier à distance. 
Puis je fais la mise à jour avec `git add` `git commit` et `git push` mais c'est impossible car je suis en retard avec le dépôt local. 
Je fais ensuite donc un `git pull` mais il y a un conflit entre les deux fichiers `journal.md`.
J'ai fait donc `git config pull.rebase false` afin de pouvoir fusionner les différences entre ces deux fichiers. 

Ensuite je fais `git pull` mais c'est indiqué que le merge automatique a faillit. 
J'ai essayé donc de faire une mise à jour à nouveau, `git add`, `git commit` et `git push` et cette fois c'est bien accepté. 
Ensuite je regarde le `git log` et `git status` et j'ai bien ce qu'il faut. 

Ensuite il reste à faire un tag avec `git tag -a -m "exo git" seance 1`

## 3e cours (08/10/25) : stdin, stdout, stderr
`wc` : word count => compter le nb de mot (ctrl+D afin de marquer la fin de l'input)
#
`grep` : recherche de motifs dans l'entrée (ou dans des fic)
#
`sort` : trier des lignes
#
`uniq` : supprimer les lignes qui se répètent
#
`echo` : affiche un txt (pr formater les résultats)
#
`cut` : sélectionne des colonnes d'un fic tabulaire
#
`tail` : ne garde que les dernières lignes d'un flux ou d'un fic
# 
## Script Bash
### Variables
On peut sauvegarder les arguments à l'aide des variables `$1, $2, etc`
C'est pratique si on donne un chemin à son script avec un variable afin de l'exécuter.
`bash /home/xubuntu/Downloads/exo1.sh .`
### Conditions
```
if [ condition ]
then
    echo " la condition est valide "
else
    echo " la condition n ’ est pas valide "
fi
```
### exo1 de Scripts Bash 
`#!/usr/bin/bash` : exécute le fic en utilisant le Bash shell
# 
sinon pour compter le nb de lieux dans une année, on fait : 
`cat *.ann | grep Location | wc -l`


