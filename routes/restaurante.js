const express = require('express');
const router = express.Router();
const restauranteController = require('../controllers/restauranteController');

router.post('/', restauranteController.createRestaurante);
router.get('/', restauranteController.getAllRestaurantes);
router.get('/:id', restauranteController.getRestauranteById);

module.exports = router;
