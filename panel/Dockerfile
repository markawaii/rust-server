# Usa Node.js 14 en Alpine como imagen base
FROM node:14-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de definición de dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos
COPY . .

# Expone el puerto 80
EXPOSE 80

# Comando de inicio
CMD ["node", "app.js"]
