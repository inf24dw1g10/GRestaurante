const Cliente = require('../models/cliente');

exports.createCliente = async (req, res) => {
  try {
    const { nome, email, telefone } = req.body;
    const cliente = await Cliente.create({ nome, email, telefone });
    res.status(201).json(cliente);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar cliente', error });
  }
};

exports.getAllClientes = async (req, res) => {
  try {
    const clientes = await Cliente.findAll();
    res.status(200).json(clientes);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao obter clientes', error });
  }
};
