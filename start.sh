#!/bin/bash

# Función para verificar y reiniciar sesiones
restart_screens() {
    # Limpiar sesiones de screen obsoletas
    screen -wipe

    # Verificar si la sesión 'mods' está corriendo, si no, iniciarla
    if ! screen -list | grep -q "\bmods\b"; then
        echo "Reiniciando sesión 'mods'..."
        screen -dmS mods /bin/bash -c 'cd Mods && chmod +x run.sh && ./run.sh'
    fi

    # Verificar si la sesión 'playit' está corriendo, si no, iniciarla
    if ! screen -list | grep -q "\bplayit\b"; then
        echo "Reiniciando sesión 'playit'..."
        screen -dmS playit /bin/bash -c 'playit'
    fi
}

# Bucle infinito para monitorear las sesiones cada 5 minutos
while true; do
    restart_screens
    sleep 300
done
