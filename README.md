# Servidor de Rust con Docker Compose

Este proyecto permite desplegar un servidor de Rust utilizando Docker y Docker Compose. La instalación del servidor se realiza en un volumen montado en el host (por ejemplo, en la carpeta `./rustdata`) y, si este directorio está vacío, se descargan automáticamente los archivos del servidor utilizando SteamCMD.

## Estructura del Proyecto

├── .env 
├── Dockerfile 
├── docker-compose.yml
├── entrypoint.sh 
└── README.md

- **.env:** Archivo de variables de entorno para configurar tanto el build (SteamCMD) como la ejecución del servidor.
- **Dockerfile:** Define la imagen Docker basada en `cm2network/steamcmd:root`, copia el script `entrypoint.sh` y prepara el entorno.
- **docker-compose.yml:** Configura el servicio, monta el volumen `./rustdata` en `/rust` y expone los puertos necesarios.
- **entrypoint.sh:** Script que, al iniciar el contenedor, verifica si el directorio de instalación (`/rust`) está vacío y, de ser así, descarga el servidor de Rust; posteriormente, inicia el servidor con los parámetros configurados.
- **README.md:** Documentación del proyecto.

## Requisitos

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

## Configuración

### Variables de Entorno

El archivo **.env** contiene las siguientes variables (puedes modificarlas según tus necesidades):

```dotenv
# Variables de build (SteamCMD)
STEAMAPPID=258550
STEAMAPPNAME=rust

# Variables para el servidor (run-time)
SERVER_PORT=28015
SERVER_IDENTITY=mi_servidor
SERVER_SEED=12345
SERVER_WORLDSIZE=4000
SERVER_MAXPLAYERS=50
SERVER_SAVEINTERVAL=300
```

## Cómo ejecutar este proyecto

Para ejecutar este proyecto, siga estos pasos:

- 1 Descargue el proyecto de GitHub.
- 2 Asegúrese de tener instalado Docker
- 3 Copia el .env.example
- 4 Ejecuta el comando docker compose up -d
- 5 Visuliza Mientras se configura el servidor docker-compose logs -f rust-server
