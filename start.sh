#!/bin/bash


# Limpiar sesiones de screen obsoletas
    screen -wipe

    echo "Reiniciando sesión 'mods'..."
    screen -dmS mods /bin/bash -c 'cd Mods && chmod +x run.sh && ./run.sh'

    echo "Reiniciando sesión 'playit'..."
    screen -dmS playit /bin/bash -c 'playit'

