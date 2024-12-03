const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Restaurante = require('./restaurante');

const Mesa = sequelize.define('Mesa', {
  numero: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  capacidade: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  status: {
    type: DataTypes.ENUM('Livre', 'Reservada', 'Ocupada'),
    defaultValue: 'Livre',
  },
});

Mesa.belongsTo(Restaurante, { foreignKey: 'idRestaurante' });

module.exports = Mesa;
