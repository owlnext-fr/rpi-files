# Installationd des Raspberry PI du bureau

## Installation de l'OS

> En prérequis, vous allez avoir besoin du logiciel `imager`.
>
> Pour l'installer `sudo apt install rpi-imager`.

Vous devrez insérer la carte Micro-SD dans votre ordinateur _(via un adaptateur)_, puis :

1. Ouvrir le logiciel `imager`
2. Sélectionner l'OS `Raspberry Pi OS (64-bit)`
3. Sélectionner la carte Micro-SD dans le menu déroulant
4. Cliquer sur l'icône de roue crantée
5. Pour le hostname, choisissez un nom unique _(ex: `raspberrypi-<NUMBER>`)_
6. Activer le SSH, avec un accès par mot de passe.
7. Saisissez un mot de passe.
8. Activez le WIFI, et connectez-vous à notre réseau.
9. Saisissez la timezone `Europe/Paris` et le clavier `fr`.

## Configuration de l'OS

### Configuration du clavier

1. ouvrir le menu en haut à gauche
2. cliquer sur `Préférences`
3. cliquer sur `Mouse and Keyboard Settings`
4. cliquer sur `Keyboard`
5. cliquer sur `Keyboard Layout`
6. dans Variant, choisir `French AZERTY`

### Connexion au WIFI

1. Ouvrez le menu internet en haut à droite (deux croix rouges)
2. Cliquez sur `Set network country`
3. Choisir `France`
4. Attendre 30 secondes
5. Cliquer sur l'icone de réseau en haut à droite
6. Choisir le réseau guest
7. Saisir le mot de passe

### Mise à jour de l'OS et installations

1. Ouvrir un terminal
2. `sudo apt update`
3. `sudo apt upgrade`

### Installation de caddy

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```
