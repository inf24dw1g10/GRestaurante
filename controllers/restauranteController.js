const Restaurante = require('../models/restaurante');

exports.createRestaurante = async (req, res) => {
  try {
    const { nome, endereco, horarioFuncionamento, quantidadeMesas } = req.body;
    const restaurante = await Restaurante.create({ nome, endereco, horarioFuncionamento, quantidadeMesas });
    res.status(201).json(restaurante);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar restaurante', error });
  }
};

exports.getAllRestaurantes = async (req, res) => {
  try {
    const restaurantes = await Restaurante.findAll();
    res.status(200).json(restaurantes);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao obter restaurantes', error });
  }
};

exports.getRestauranteById = async (req, res) => {
  try {
    const restaurante = await Restaurante.findByPk(req.params.id);
    if (!restaurante) {
      return res.status(404).json({ message: 'Restaurante não encontrado' });
    }
    res.status(200).json(restaurante);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao obter restaurante', error });
  }
};
