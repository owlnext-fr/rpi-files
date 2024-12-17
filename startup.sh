#!/bin/bash

OWLNEXT_STATUS_PAGE_PATH="/srv/owlnext/statuspage"

# if caddy is not installed, echo a message
if ! command -v caddy &>/dev/null; then
    zenity --error --text="Caddy n'est pas installé" 2>/dev/null
fi

# si aucun fichier index n'est trouvé sur le chemin /srv/owlnext/statuspage/index.html
if [ ! -f "$OWLNEXT_STATUS_PAGE_PATH/dist/index.html" ]; then
    zenity --error --text="La status page n'est sans doute pas installée" 2>/dev/null
fi

cd "$OWLNEXT_STATUS_PAGE_PATH/dist"

if [ $? -ne 0 ]; then
    zenity --error --text="Impossible de changer de répertoire pour $OWLNEXT_STATUS_PAGE_PATH/dist" 2>/dev/null
fi

# lancer caddy en mode background
caddy start --config ./Caddyfile &>/dev/null &

if [ $? -ne 0 ]; then
    zenity --error --text="Impossible de lancer caddy" 2>/dev/null
fi

# lancer firefox sur localhost:8080 en plein écran
firefox http://localhost:8080 --kiosk &>/dev/null &

if [ $? -ne 0 ]; then
    zenity --error --text="Impossible de lancer firefox" 2>/dev/null
fi
