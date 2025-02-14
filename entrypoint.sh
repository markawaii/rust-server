#!/bin/sh

# Directorio donde se instalará o se encuentra el servidor de Rust (montado desde el host)
INSTALL_DIR="/rust"

# Si el directorio de instalación está vacío, se realiza la instalación
if [ -z "$(ls -A ${INSTALL_DIR})" ]; then
    echo "El directorio ${INSTALL_DIR} está vacío. Instalando el servidor de Rust..."
    /home/steam/steamcmd/steamcmd.sh +force_install_dir ${INSTALL_DIR} +login anonymous +app_update ${STEAMAPPID} validate +quit
else
    echo "El directorio ${INSTALL_DIR} ya contiene archivos. Se usará la instalación existente."
fi

# Iniciar el servidor de Rust con las variables de entorno (se pueden sobreescribir desde .env)
echo "Iniciando el servidor de Rust..."
${INSTALL_DIR}/RustDedicated \
  -batchmode \
  -nographics \
  -server.port ${SERVER_PORT:-28015} \
  -server.identity ${SERVER_IDENTITY:-mi_servidor} \
  -server.seed ${SERVER_SEED:-12345} \
  -server.worldsize ${SERVER_WORLDSIZE:-4000} \
  -server.maxplayers ${SERVER_MAXPLAYERS:-50} \
  -server.saveinterval ${SERVER_SAVEINTERVAL:-300}
