#!/bin/sh
set -eu

# Exportar todas las variables del secret
if [ -f /run/secrets/pusher_secrets ]; then
    set -a
    . /run/secrets/pusher_secrets
    set +a
fi

# Ejecutar el entrypoint original de la imagen
# Si hay argumentos, pasarlos; si no, ejecutar sin argumentos
if [ $# -gt 0 ]; then
    exec /usr/local/bin/docker-entrypoint "$@"
else
    exec /usr/local/bin/docker-entrypoint
fi
