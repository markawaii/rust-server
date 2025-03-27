#!/bin/sh

INSTALL_DIR="/rust"
RUST_EXECUTABLE="${INSTALL_DIR}/RustDedicated"

# Verifica si el ejecutable existe; de lo contrario, instala el servidor de Rust
if [ ! -f "${RUST_EXECUTABLE}" ]; then
    echo "El ejecutable ${RUST_EXECUTABLE} no se encontró. Instalando el servidor de Rust..."
    /home/steam/steamcmd/steamcmd.sh +force_install_dir ${INSTALL_DIR} +login anonymous +app_update ${STEAMAPPID} validate +quit
else
    echo "El ejecutable ${RUST_EXECUTABLE} ya existe. Se usará la instalación existente."
fi

echo "Iniciando el servidor de Rust..."
exec "${RUST_EXECUTABLE}" \
  -batchmode \
  -nographics \
  -server.port ${SERVER_PORT:-28015} \
  -server.identity ${SERVER_IDENTITY:-mi_servidor} \
  -server.seed ${SERVER_SEED:-12345} \
  -server.worldsize ${SERVER_WORLDSIZE:-4000} \
  -server.maxplayers ${SERVER_MAXPLAYERS:-50} \
  -server.saveinterval ${SERVER_SAVEINTERVAL:-300} \
  -server.rcon.ip 0.0.0.0 \
  -server.rcon.port 28016 \
  -server.rcon.password "${RCON_PASSWORD:-cambia_esto}"
