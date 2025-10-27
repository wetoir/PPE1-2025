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

### exo git 
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
###
`grep` : recherche de motifs dans l'entrée (ou dans des fic)
###
`sort` : trier des lignes
###
`uniq` : supprimer les lignes qui se répètent
###
`echo` : affiche un txt (pr formater les résultats)
###
`cut` : sélectionne des colonnes d'un fic tabulaire
###
`tail` : ne garde que les dernières lignes d'un flux ou d'un fic
### 
### Script Bash
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
### 
sinon pour compter le nb de lieux dans une année, on fait : 
`cat *.ann | grep Location | wc -l`

## 4e cours (15/10/25) : correction tp bash scripts
Regarder les codes faits pour ce tp. Et puis regarder lastCodeBash.sh pour les commentaires.


## 5e cours (22/10/25) : html
On corrige un peu de bash au début avant d'attaquer la partie web.

html 
HTTP = un protocole qui permet de communiquer avec le WWW (world wide web).

### Schéma de HTTP :
1. URL envoyé par user au navigateur
2. Requête HTTP envoyé par le nav au serveur web
3. Serveur web envoie réponse HTTP au navi
4. Le navi envoie la page web à l'user

### Nomenclature des codes HTTP 
```
1xx : infomation
200 : réussite 
3xx : redirections (ex : envoie à une nouvelle page valide depuis l'ancienne adresse (http:... -> https://... mieux sécurisé))
4xx : erreurs du client (ex : 404 page non trouvée)
5xx : erreur du serveur (ex : inscription administrative à P3)
```

### lynx : un nav en terminal
Installation de Lynx
`lynx plurital.org` commande pour aller sur le site plurital
`up et down ou tab` pour déplacer sur le site
`entrer` pour entrer
`Q` pour quitter
`left et right` pour retour sur page préc ou contraire

### crawl avec lynx
(uniquement du text et des liens)
2 options :
1. récup le contenu contextuel d'une page pour l'afficher (sans navigation) `-dump`
2. retirer la liste des liens d'une page à l'affichage `-nolist`
3. afficher seulement la liste des liens `-listonly`

`seq 1 7 | shuf | head -1` pour voir qui interroge

`lynx -dump https://...` = option 1
`lynx -dump -nolist https://...` = option 2
`lynx -dump -listonly https://...` = option 3s

Dans une page man de terminal, tape `/` puis le terme à chercher.f

### wget et cURL 
wget télécharge un fic sur ordi 
et cURL affiche tout sur le terminal

`sudo apt install curl`
`curl plurital.org` -> récup la page web en mode html. 
=> récup les métadonnées sur la page web intéressée (le code par ex) 
-> voir si la page web est valide ou pas.
`curl plurital.org | less` -> navigue sur la page obtenue
`curl google.com` -> code 301 => adresse changée -> www.google.com (veille héritage)

`curl -i` : entête des métadonnées (date, location, expiration, le code de réponse ...)
`curl -L` : suivre le déplacement si ancienne adresse
ex : `curl -iL google.com` : deux entête, une donne code 301 puis l'autre code 200 (redirigé vers www.google.com). En entête, Content-Type:...; charset=ISO-8859-1 (alphabet latin) alors que dans head de html, charset = UTF-8 cela peut expliquer par le fait que sur cette page y'a pas de caratères spécial de UTF-8 donc il dit que c'est de latin seuelemtn (qui est englobé dans UTF-8) dans l'entête.
`curl -o` : mettre output dans un fic destiné.

### Transition mini-projet
Préparation au travail en groupe
-> récup du corpus sur internet
.tsv puis page web html.
Etapes : récup d'un fic -> écrire sur le terminal des info de .tsv récupéré -> transformer dans une page web

### Editeurs
Kate
Helix
vscodium
neovim

Avantages : 
Coloration syntaxique
Complétion du code
Linter : détecte une partie du code même av exécution (analyse statique)
LSP (Language Server Protocol) : communique avec le serveur du langage utilisé afin de faire les features préc
#### un Linter pour bash : shellcheck
`sudo apt install shellcheck`
#### LSP pour bash : bash-language-server
d'abord nodej et npm
puis installer bash-language-server avec npm
-> consultuer la documentation sans sortir de l'éditeur (espace jsp quoi)

## miniprojet (27/10/25) :
### Ex 1 : lire les lignes d'un fichier en bash
1. On ne fait pas cat "../urls/fr.txt" | while read ... 
-> afin de ne pas relire le fichier deux fois et qu'on puisse mieux manipuler les variables dans la boucle car sinon pas sûr qu'on peut stocker la valeur d'un sous-shell créé par cat et pipe

2. Pour transformer "../urls/fr.txt" en param du script
et valider l'argument 
-> `FIC=$1` et puis créer une condition pour avoir exactement 1 argument 

3. affichier le numéro de ligne av chq URL (sur la même ligne)
et séparer les valeurs par des tabulations
-> `echo -e "${COMPTEUR}\t${LIEN}"`
Option -e de echo permet à shell d'interpréter \t comme une tabulation

### Ex 2 : récupérer les métadonnées de collecte 
Afin de faire la totalité de cette exercice j'ai essayé de faire une copie brute du site en html avec `mktemp` afin d'éviter 
envoyer trop de requête à un site et prends un code 429.
Cependant le résultat obtenu avec cette façon de faire est différent à celui obtenu normalement au niveau de nombre de mots.
Donc j'ai décidé de ne pas le poursuivre et garde la version qui
marche bien même s'il faut envoyer 2 requêtes à chaque site dans la boucle. 
Les commandes utilisées sont :
`echo -e` : comme dit au-dessus 

`grep -e 'expr1' -e 'expr2'` : une recherche de plusieurs patterns 

`head -n 1` : prendre le premier résultat 

`tail -n 1` : prendre le dernier résultat 

`cut -d 'delimiter' -f2` :  couper le texte à chaque délimiteur et prendre le 2e 

`lynx -dump -nolist` : donne le contenu textuel du site sans liste de liens

`curl -siL` : 
    `-s` : silent mode sans la barre de progression
    `-i` : entête d'info d'un site
    `-L` : redirige vers la nouvelle page si existe

`wc -w` : compter le nombre de mots

Regarder le fichier miniprojet.sh pour mieux comprendre.