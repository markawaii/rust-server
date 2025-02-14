# Dockerfile
FROM cm2network/steamcmd:root

# Definir argumentos de build (se sobrescribirán con los valores del .env desde docker-compose)
ARG STEAMAPPID
ARG STEAMAPPNAME

# Asignar los ARG a variables de entorno para su uso en tiempo de build o en scripts
ENV STEAMAPPID=${STEAMAPPID}
ENV STEAMAPPNAME=${STEAMAPPNAME}

# Crear el directorio de instalación (que se usará para montar el volumen)
RUN mkdir -p /rust

# Copiar el script entrypoint a una ruta que no se sobreescriba (por ejemplo, en la raíz)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Cambiar la propiedad del directorio /rust a steam (se usará el volumen montado en /rust)
RUN chown -R steam:steam /rust

# Cambiar al usuario steam para la ejecución del contenedor
USER steam

# Establecer el directorio de trabajo (no afecta al entrypoint)
WORKDIR /rust

# Exponer los puertos necesarios para el servidor de Rust
EXPOSE 28015/tcp
EXPOSE 28015/udp
EXPOSE 28016/udp

# Definir el entrypoint del contenedor (se invoca el script ubicado en /entrypoint.sh)
CMD ["/entrypoint.sh"]
