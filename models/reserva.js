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

Reserva.belongsTo(Cliente, { foreignKey: 'idCliente' });
Reserva.belongsTo(Restaurante, { foreignKey: 'idRestaurante' });

module.exports = Reserva;
