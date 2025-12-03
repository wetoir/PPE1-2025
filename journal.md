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

## miniprojet2 (11/11/25) :
Au début, je croyais il fallait faire un autre fichier .sh pour le miniprojet2. Ce que j'ai fait mais au final ce qu'on devrai faire c'est de bien modifier le fichier miniprojet.sh afin d'obtenir le résultat désiré, c'est à dire un fichier html qui montre le résultat obtenu lors du 1er miniprojet. 
Cependant j'ai fait un fichier .sh indépendamment et puis j'ai commenté son code dans mon fichier miniprojet.sh. Donc si on exécute mon code telquel, on obtiendrait pas le résultat voulu. Pour obtenir ce qu'on veut il faut créer un nouveau fichier .sh et puis copier et décommenter le code du miniprojet2 dedans. Et enlever aussi les commentaires et les espaces après les `EOF` sinon il va produire une erreur car bash essaie de lire `EOF #qqc`. 
#### maj la correction (18/11/25) : 
Modification la correction donnée par les profs afin d'avoir un bon fichier html en sortie. En prenant en compte ce que j'avais avant. 

## 7ème cours (12/11/25) :
Correction de miniprojet2.
Puis création d'une page web à partir de sa page github pour le miniprojet3. 
### HTML :
Quelques balises:
    `<p></p>` : un paragraphe
    `<h1></h1>` : titres
    `<b></b>` : gras
    `<i></i>` : italic
    `<ul></ul>` : les points
    
### CSS : feuille de style
On peut la mettre directement dans une balise, dans l'entête d'un fic HTML, dans un fic à part.
`<p style="color:red">`
Pour faire un lien entre le fichier HTML et le fic CSS, on utilise `<link rel="stylesheet" href="chemin/vers/fic/CSS">`
### Bulma CSS : permet de styler HTML facilement
Changer de classes et de modifieurs seulement. 
Exemples dans le dossier exempliers de PPE-2526. A regarder la documentation de Bulma.io.
### Expressions régulières (regex)
Valider des formats
Extraire les infos dans un txt
Rechercher et remplacer du txt
`https://regex101.com`
Les métacaractères : 
    `.` : un 
    `+` : un ou plusieurs
    `?` : un ou zéro
    `*`: zéro ou plusieurs 
Classes de caractères [] :
    [abc]
    [a-z]
    [digit] 
    etc
Les métacaractères de frontières (ancres) :
    `$` : la fin
    `^` : le début
    `\b` : space (frontière de mot existe)
    `\B` : absence de frontière
Quantifieurs :
    `{n, m}` : entre n et m occurences

## miniprojet3 (18/11/2025) :
### 1ère étape : 
Je prends le fic `index.html` de PPE1-2526 et le mets à la racine de mon dossier GitHub. Puis je le modifie un peu afin d'avoir un affichage assez propre (en utilisant le `CSS` de `Bulma`) de et je mets aussi le lien vers le site `tableau-fr.html` de miniprojet2 dans `index.html`. Puis je push sur GitHub comme demandé. 
### 2è étape :
Après le déploiement de la page GitHub, le lien fonctionne bien via la page GitHub du miniprojet. 
### 3è étape :
Mise en page des deux fichiers html en utilisant `Bulma`. 
Structure la partie body de chaque fichier en 3 parties : 
    - la barre de navigation
    - la bannière 
    - le contenu principal
Quelques options utilisées : 
`is-centered` : centrer l'élément de la balise qui est utilisée avec cette classe
`is-small` : la taille de cet élément est petite
`mb-x` : la marge en bas de cet élément est de taille x (elle est plus grande proportionnelement à x)
`title` : titre d'un élément (`div` par ex)
`subtitle` : sous-titre d'un élément
`card` : pour faire des blocs de style card
`x-content` : le contenu de ce x-bloc (par ex `card-content`)
etc.
### 4è étape :
La génération du fichier `tableau-fr.html` ayant directement le style `Bulma`. 
J'ai changé le code HTML injecté au fichier `tableau-fr.html` lors de sa création en ajoutant les éléments de Bulma. Il n'y a pas beaucoup de difficulté à ce niveau là vu c'est comme ce qu'on a fait avant pour le `miniprojet2`.
Juste le fait de bien espacer les tabulations pour les balises qui n'est pas très instinctif. J'ai du essayé quelques fois avant d'avoir le résultat souhaité. 
Mais en soit, cela ne change rien niveau le code ni le site. 

## cours 8 (19/11/2025) :
On a commencé avec la correction du miniprojet3.
### grep 
Puis on enchaîne sur `regex101.com`
Pour trouver les urls dans un texte (sans `www`):
`https?:\/\/[^\s]+([a-zA-Z]){2,}\/?`
Avec les `www` au début à la place de `https://` :
(https?:\/\/|www\.)[^\s]+([a-zA-Z]){2,}\/?
Découper les urls en parties :
`(https?:\/\/|www\.)([a-zA-Z]+\.)+[a-zA-Z]{2,}(\/[^\s]+)*[a-zA-Z0-9]\/?`
Pour capturer aussi `https://impacts-....org/` dans le texte de `mail-list-hr.txt` :
`(https?:\/\/|www\.)([-0-9a-zA-Z]+\.)+[a-zA-Z]{2,}(\/[^\s]+)*[a-zA-Z0-9]\/?`
`grep -P` compatible avec ce qu'on fait sur `regex101.com` :
`cat mail-liste-hn.txt | grep -P '(https?:\/\/|www\.)([-0-9a-zA-Z]+\.)+[a-zA-Z]{2,}(\/[^\s]+)*' -o`
Capter tous les mots/caractères sauf ceux avec accents ou les trucs non pas en ASCII :
`[A-z]*` même les trucs comme `"[]_^`"`
Le mieux c'est de faire :
`[a-zA-Zéèàêâùÿïüë]*`
En unicode :
Pour les cara chinois :
`grep -P '\p{han}*'`
Pour les cara grecs :
`grep -P '\p{lo}*'`
Pour les lettres :
`grep -P '\p{l}+'`
Pour les mots qui commencent par un majuscule :
`grep -P '\p{lu}\p{ll}+' -o`
#### grep -P '\p...' et grep -P '\P' sont différents
### sed : éditeur de texte en ligne de commande 
Substitution de 'moulins' suivi de '3 caractères' avec '3 caractères' et 'MOULINS' à droit :
`cat pg16066.txt | grep moulins | sed 's/moulins \(...\)/ \1 MOULINS/'`
ex : 
`celle du Port-Lapice[23]; d'autres, celle des moulins à vent.` '(3 caractères ici est : `à v`)
`celle du Port-Lapice[23]; d'autres, celle des  à v MOULINSent.`

`s/.../.../` est la syntaxe de substitution de sed (chercher et remplacer).
`moulins \(...\)` : cela cherche le mot "moulins" suivi de trois caractères (en utilisant des parenthèses pour capturer ces trois caractères dans un groupe, qui sera référencé par \1).
`\1 MOULINS `: cette partie remplace "moulins" et les trois caractères suivants par "MOULINS", tout en réintégrant les trois caractères capturés. Par exemple, si une ligne contient "moulins abc", elle deviendra "abc MOULINS".

### Git : un peu plus loin
Pour les erreurs :
`git reset` -> permet de faire marche arrière (revient à la version "HEAD" du dépôt (annule tous les add mais pas les commits))
`git revert` -> pas cette fois
`git stash`
`git checkout` -> au S2 ? (se téléporter directement à un état donné (commit ou fic))
Fonctionnent tjs contrairement à `pull`
`HEAD` : où vous êtes actuellement
`tag` : une autre référence à une commit
`~N` :
`^N`: 

`git diff` : voir les différents HEAD
`git stash push` : cacher les modifs pour pouvoir pull et puis on peut le ressortir plus tard 
(`git status` montre qu'on est à jour)


## cours 9 (26/11/2025) : environnement virtuel
### invironnement virtuel
Bcp d'avantages mais le plus grand c'est de pouvoir tout supprimer sans toucher au système Python si qqc va mal.
### uv, venv, pip
`pip` : installer les librairies Python
`venv` : créer un environnement virtuel
`uv` : modernise les interfaces de pip et fait le role de `venv`

`uv venv $HOME/venvs/plurital` : créer un env virtuel
`source $HOME/venvs/plurital/bin/activate` : l'activer
`whereis python3` : pour trouver le système Python actuel/locate the binary, source, and manual page files for a command
`which python3` : se situe le Python actuel/locate a command
`uv pip --help` : man de uv pour ses commandes
`uv pip install wordcloud` : installer wordcloud dans l'env virtuel
`wordcloud_cli --help` : man de wordcloud

`requirements.txt` donne les dépendances à d'autres paquets Python
`https://pypi.org` donne les paquets installables

`uv pip install jupyter` : installer jupyterlab dans un env virtuel pour mieux gérer son projet
`jupyter lab` : lancer jupyter-lab

### wordcloud
`wordcloud_cli --text ../PPE1-2526/docs/pg16066.txt --imagefile pg16066.png` : ex de wordcloud
--> les mots non lexicaux qui nous intéressent pas, faut les faire disparaître
+++> On fait un fichier de stopwords pour ne plus afficher les mots non lexicaux
Par ex : 
`echo "le de en à" > stopwords.txt`
`wordcloud_cli --text ../PPE1-2526/docs/pg16066.txt --imagefile pg16066.png --stopwords stopwords.txt`
On a d'autres options comme faire ça en forme de coeur --> à voir 
`--mask file` `background color`

### tokenization
`uv pip install -r requirements.txt` = `uv pip install thulac`  : chinois
`python3 tokenize_chinese.py chinois.txt > chinois_seg.txt` 
= `cat chinois.txt | python tokenize_chinese.py > chinois_seg.txt`: segmentation
=> différence entre `head chinois.txt` et `head chinois_seg.txt`
`cat coréen.txt | python3 tokenize_ko.py` : pour coréen
`cat japonais.txt | python3 tokenize_japanese.py` : pour japonais
~~`cat japonais.txt | tr ' ' '\n' | sort -u`
`cat vietnamien.txt | python3 tokenize_vietnamese.py` : remplacer les espaces par les underscores
`cat vietnamien.txt | python3 tokenize_vietnamese.py | tr ' ' '\n' | sort -u` : liste de mots qui ont du sens au moins
 
### PALS
4 bulles, 2 bleus, 2 rouges
tirer aléatoirement, 2 bulles à la fois
pourcentages :
1/6 de tomber sur 2 bulles de même couleur
4/6 ou 2/3 de tomber sur 2 bulles de couleurs différentes
--> appliquer ça au corpus (loi hypergéométrique)
`python3 cooccurrents.py --help` : man de coocurrences.py
`python3 cooccurrents.py --target robot ../PPE1-2526/docs/robots.txt -N 10` : limiter le nb de résultats
`python3 cooccurrents.py --target robot ../PPE1-2526/docs/robots.txt -N 10 -s i` : insensif à la casse
`python3 cooccurrents.py --target "robots?" fr-*.txt -N 10 -s i --match-mode=regex` : utilisation avec regex 
`python3 cooccurrents.py --target "robot.*" fr-*.txt -N 10 -s i --match-mode=regex`
`less fr-1.txt` : segmenter et lire le fic mot par mot
`python3 cooccurrents.py --target "robot.*" fr-*.txt -s i --match-mode=regex > resCooccu.tsv` : l'exploration du corpus

## cours10 (03/12/2025): projet et robots.txt
On a parlé du projet final au début.
Fic dans contxt différent de concordance, on peut prendre 2 ou 3 lignes av et après la phrases en question.
Concordance c'est environ 4-gram au tour du mot en question.

Puis on a parlé de robots.txt afin de connaître les limites de wikipédia sur le sujet de scrawlers.
-> éviter d'avoir un DDOS en plein face car trop de curl ou équivalences provenant des scrawlers.
--> un peu de respect car "règles" de politesse mais plutôt suggestions.

Ensuite on commence à travailler sur le projet