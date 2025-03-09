#!/bin/bash

# Instalar screen y playit
echo "Instalando screen y playit..."
sudo apt update
sudo apt install -y screen curl gpg

# Añadir el repositorio de playit y su clave GPG
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list >/dev/null

# Instalar playit
sudo apt update
sudo apt install -y playit

# Limpiar sesiones de screen obsoletas
screen -wipe

# Reiniciar sesión 'mods'
echo "Reiniciando sesión 'mods'..."
screen -dmS mods /bin/bash -c 'cd Mods && chmod +x run.sh && ./run.sh'

# Reiniciar sesión 'playit'
echo "Reiniciando sesión 'playit'..."
screen -dmS playit /bin/bash -c 'playit'
