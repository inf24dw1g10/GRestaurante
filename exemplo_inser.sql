-- Inserções na tabela de Restaurantes
INSERT INTO restaurantes (nome, endereco, horarioFuncionamento, quantidadeMesas) VALUES
('Restaurante A', 'Rua 1, 123', '10:00 - 22:00', 10),
('Restaurante B', 'Rua 2, 456', '08:00 - 20:00', 15);

-- Inserções na tabela de Clientes
INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao@exemplo.com', '123456789'),
('Maria Oliveira', 'maria@exemplo.com', '987654321');

-- Inserções na tabela de Reservas
INSERT INTO reservas (idCliente, idRestaurante, dataHora, numeroPessoas, status) VALUES
(1, 1, '2024-12-10 19:00:00', 4, 'Confirmada'),
(2, 2, '2024-12-11 20:00:00', 2, 'Confirmada');

-- Inserções na tabela de Mesas
INSERT INTO mesas (idRestaurante, numero, capacidade, status) VALUES
(1, 1, 4, 'Livre'),
(1, 2, 4, 'Reservada'),
(2, 1, 2, 'Ocupada');

-- Inserções na tabela de Tipos de Cozinha
INSERT INTO tiposCozinha (tipo) VALUES
('Italiana'),
('Chinesa'),
('Brasileira');

-- Inserções na tabela de Restaurante_TipoCozinha
INSERT INTO restaurante_tipoCozinha (idRestaurante, idTipoCozinha) VALUES
(1, 1),  -- Restaurante A oferece cozinha Italiana
(1, 2),  -- Restaurante A oferece cozinha Chinesa
(2, 3);  -- Restaurante B oferece cozinha Brasileira