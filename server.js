const express = require('express');
const sequelize = require('./config/database');
const restauranteRoutes = require('./routes/restaurante');
const clienteRoutes = require('./routes/cliente');
const reservaRoutes = require('./routes/reserva');
const app = express();

app.use(express.json());

app.use('/api/restaurantes', restauranteRoutes);
app.use('/api/clientes', clienteRoutes);
app.use('/api/reservas', reservaRoutes);

sequelize.sync()
  .then(() => {
    console.log('Banco de dados conectado');
    app.listen(3000, () => {
      console.log('Servidor rodando na porta 3000');
    });
  })
  .catch((error) => console.log('Erro ao conectar ao banco de dados:', error));
