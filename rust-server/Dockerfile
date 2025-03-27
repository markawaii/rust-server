# Usa una imagen base con SteamCMD instalado
FROM cm2network/steamcmd:root

# Definir argumentos de build (se sobrescribirán con los valores del .env desde docker-compose)
ARG STEAMAPPID
ARG STEAMAPPNAME

# Asignar los ARG a variables de entorno para su uso
ENV STEAMAPPID=${STEAMAPPID}
ENV STEAMAPPNAME=${STEAMAPPNAME}

# Crear el directorio de instalación
RUN mkdir -p /rust

# Copiar el script de entrada y asignar permisos
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Cambiar la propiedad del directorio a 'steam'
RUN chown -R steam:steam /rust

# Cambiar al usuario steam
USER steam

# Establecer el directorio de trabajo
WORKDIR /rust

# Exponer puertos (28015 para el juego y 28016 para RCON)
EXPOSE 28015/tcp
EXPOSE 28015/udp
EXPOSE 28016/udp

# Ejecutar el entrypoint
CMD ["/entrypoint.sh"]
