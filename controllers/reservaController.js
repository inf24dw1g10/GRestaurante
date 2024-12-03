const Reserva = require('../models/reserva');

exports.createReserva = async (req, res) => {
  try {
    const { idCliente, idRestaurante, dataHora, numeroPessoas } = req.body;
    const reserva = await Reserva.create({ idCliente, idRestaurante, dataHora, numeroPessoas });
    res.status(201).json(reserva);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar reserva', error });
  }
};

exports.getReservasByCliente = async (req, res) => {
  try {
    const reservas = await Reserva.findAll({
      where: { idCliente: req.params.idCliente },
    });
    res.status(200).json(reservas);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao obter reservas', error });
  }
};
