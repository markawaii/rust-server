const express = require('express');
const bodyParser = require('body-parser');
const { Rcon } = require('rcon-client');

const app = express();
const port = process.env.PORT || 80;

app.use(bodyParser.json());

let rconClient;

// Función para conectar a RCON
async function connectRcon() {
  try {
    rconClient = await Rcon.connect({
      host: process.env.RCON_HOST || 'localhost',
      port: parseInt(process.env.RCON_PORT, 10) || 28016,
      password: process.env.RCON_PASSWORD || 'cambia_esto'
    });
    console.log("Conectado a RCON exitosamente.");
  } catch (err) {
    console.error("Error al conectar a RCON:", err);
  }
}

// Conectar a RCON al iniciar
connectRcon();

// Endpoint básico
app.get('/', (req, res) => {
  res.send("Panel de Administración para Rust");
});

// Endpoint para enviar comandos vía RCON
app.post('/command', async (req, res) => {
  const command = req.body.command;
  if (!command) {
    return res.status(400).json({ error: 'No se proporcionó ningún comando.' });
  }

  try {
    const response = await rconClient.send(command);
    return res.json({ success: true, response });
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
});

// Iniciar la aplicación
app.listen(port, () => {
  console.log(`Panel escuchando en el puerto ${port}`);
});
