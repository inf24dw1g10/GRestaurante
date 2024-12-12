CREATE DATABASE restaurante_db;
USE restaurante_db;

CREATE TABLE restaurantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    horarioFuncionamento VARCHAR(255) NOT NULL,
    quantidadeMesas INT NOT NULL
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idRestaurante INT,
    dataHora DATETIME NOT NULL,
    numeroPessoas INT NOT NULL,
    status VARCHAR(50) DEFAULT 'Confirmada',
    FOREIGN KEY (idCliente) REFERENCES clientes(id),
    FOREIGN KEY (idRestaurante) REFERENCES restaurantes(id)
);

CREATE TABLE mesas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idRestaurante INT,
    numero INT NOT NULL,
    capacidade INT NOT NULL,
    status ENUM('Livre', 'Reservada', 'Ocupada') DEFAULT 'Livre',
    FOREIGN KEY (idRestaurante) REFERENCES restaurantes(id)
);

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idRestaurante INT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    horarioTrabalho VARCHAR(255) NOT NULL,
    FOREIGN KEY (idRestaurante) REFERENCES restaurantes(id)
);

CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idReserva INT,
    valorTotal DECIMAL(10, 2) NOT NULL,
    formaPagamento ENUM('Cartão de Crédito', 'Dinheiro', 'Transferência') NOT NULL,
    statusPagamento ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    dataPagamento DATETIME,
    FOREIGN KEY (idReserva) REFERENCES reservas(id)
);

CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idReserva INT,
    comentario TEXT,
    avaliacao INT CHECK (avaliacao BETWEEN 1 AND 5), -- avaliação de 1 a 5
    dataComentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idReserva) REFERENCES reservas(id)
);

CREATE TABLE tiposCozinha (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL
);

CREATE TABLE restaurante_tipoCozinha (
    idRestaurante INT,
    idTipoCozinha INT,
    PRIMARY KEY (idRestaurante, idTipoCozinha),
    FOREIGN KEY (idRestaurante) REFERENCES restaurantes(id),
    FOREIGN KEY (idTipoCozinha) REFERENCES tiposCozinha(id)
);
