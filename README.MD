# GRestaurante

Este projeto é uma aplicação que facilita a gestão de reservas em restaurantes. Ele permite que restaurantes, clientes e reservas sejam registados e geridos de maneira eficiente, garantindo a verificação automática de disponibilidade de mesas.

## 🕹️ How to Install


1.1. Instalação do Projeto Node.js
Execute os seguintes comandos para criar o ambiente do projeto:

mkdir sistema-reservas
cd sistema-reservas
npm init -y
npm install express mysql2 sequelize body-parser

1.2. Configuração da Base de Dados com Sequelize

// config/database.js
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('restaurante_db', 'root', 'senha', {
  host: 'localhost',
  dialect: 'mysql',
});

module.exports = sequelize;

1.3. Definição de Modelos com Sequelize

1.3.1. Modelo de Cliente

// models/cliente.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Cliente = sequelize.define('Cliente', {
  nome: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
  telefone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = Cliente;

1.3.2. Modelo de Restaurante

// models/restaurante.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Restaurante = sequelize.define('Restaurante', {
  nome: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  endereco: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  horarioFuncionamento: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  quantidadeMesas: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

module.exports = Restaurante;

1.3.3. Modelo de Reserva

// models/reserva.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Cliente = require('./cliente');
const Restaurante = require('./restaurante');

const Reserva = sequelize.define('Reserva', {
  dataHora: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  numeroPessoas: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  status: {
    type: DataTypes.STRING,
    defaultValue: 'Confirmada',
  },
});

// Relacionamentos
Reserva.belongsTo(Cliente, { foreignKey: 'idCliente' });
Reserva.belongsTo(Restaurante, { foreignKey: 'idRestaurante' });

module.exports = Reserva;

2. Implementação dos Endpoints REST
2.1. Configuração do Express e Criação dos Endpoints

// server.js
const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./config/database');
const Cliente = require('./models/cliente');
const Restaurante = require('./models/restaurante');
const Reserva = require('./models/reserva');

const app = express();
app.use(bodyParser.json());

// Teste de Conexão com o banco de dados
sequelize.authenticate()
  .then(() => console.log('Conectado ao banco de dados'))
  .catch(err => console.log('Erro ao conectar ao banco de dados', err));

// Endpoints de Cliente
app.post('/api/clientes', async (req, res) => {
  try {
    const { nome, email, telefone } = req.body;
    const cliente = await Cliente.create({ nome, email, telefone });
    res.status(201).json(cliente);
  } catch (error) {
    res.status(400).json({ error: 'Erro ao criar cliente', message: error.message });
  }
});

// Endpoints de Restaurante
app.post('/api/restaurantes', async (req, res) => {
  try {
    const { nome, endereco, horarioFuncionamento, quantidadeMesas } = req.body;
    const restaurante = await Restaurante.create({ nome, endereco, horarioFuncionamento, quantidadeMesas });
    res.status(201).json(restaurante);
  } catch (error) {
    res.status(400).json({ error: 'Erro ao criar restaurante', message: error.message });
  }
});

// Endpoints de Reserva
app.post('/api/reservas', async (req, res) => {
  try {
    const { idCliente, idRestaurante, dataHora, numeroPessoas } = req.body;
    const reserva = await Reserva.create({ idCliente, idRestaurante, dataHora, numeroPessoas });
    res.status(201).json(reserva);
  } catch (error) {
    res.status(400).json({ error: 'Erro ao criar reserva', message: error.message });
  }
});

app.get('/api/reservas/:idCliente', async (req, res) => {
  try {
    const { idCliente } = req.params;
    const reservas = await Reserva.findAll({ where: { idCliente } });
    res.status(200).json(reservas);
  } catch (error) {
    res.status(400).json({ error: 'Erro ao buscar reservas', message: error.message });
  }
});

// Sincronizar os modelos com o banco de dados
sequelize.sync()
  .then(() => console.log('Modelos sincronizados com o banco de dados'));

// Iniciar o servidor
app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});

4.2. Dockerfile para o Node.js

FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

CMD ["node", "server.js"]

## 👨🏻 Criadores

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/nunotapxD">
        <img src="https://cdn.intra.42.fr/users/2ef10d3be26d53929c2029b071c1e53a/ntomas-a.jpg" width="100px;" height="150px;" alt="Foto do Nuno Pereira no GitHub"/><br>
        <sub>
          <b>Nuno Pereira (a045929)</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/a045580">
        <img src="https://i.ibb.co/kSTSMFC/Captura-de-ecr-2024-12-03-064539.png" width="100px;" height="150px;" alt="Foto do José Cantinho"/><br>
        <sub>
          <b>José Cantinho (a04)</b>
        </sub>
      </a>
    </td>
  </tr>
</table>


## 📝 Disciplina + Data Limite

Projeto da disciplina DW (Desenvolvimento Web), implementado com Node / Docker.
