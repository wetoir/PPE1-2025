#!/usr/bin/bash

# vérifie si on a bien 2 arguments 
if [ $# -ne 2 ]; then
    echo "Usage: $0 input.tsv output.html"
    exit 1
fi

INPUT=$1
OUTPUT=$2

# Début du fichier HTML; cat > "..." crée le fic (ou l'écrase s'il existe déjà)
cat > "$OUTPUT" <<EOF # <<EOF ... EOF : bloc multi-lignes
<html>
<head>
    <meta charset="UTF-8" />
</head>
<body>
<table border="1"> 
EOF # border="1" pour avoir des bordures 

# Lecture du TSV -> transformation en lignes HTML; IFS=$'\t' dit à read que le séparateur est une tabulation
while IFS=$'\t' read -r ordre lien code encodage nbmots; do # lire les 5 colonnes 
    echo "<tr><td>$ordre</td><td>$lien</td><td>$code</td><td>$encodage</td><td>$nbmots</td></tr>" >> "$OUTPUT" # >> concatène au fic output.html sans l'écraser
done < "$INPUT" # lire le fic.tsv

# Fin du fichier HTML; rajouter la fin du fic html
cat >> "$OUTPUT" <<EOF
</table>
</body>
</html>
EOF