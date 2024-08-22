-- Banco de dados Vivene Velas -- 

CREATE DATABASE viveneVelas;
USE viveneVelas;

-- DROP database viveneVelas;

-- Criação das tabelas --

CREATE TABLE Login(
	id INT PRIMARY KEY,
    email VARCHAR(45),
    senha VARCHAR(50)
);

CREATE TABLE Usuario(
	id INT PRIMARY KEY,
    nome VARCHAR(45),
    ultimo_acesso DATE,
    fk_login INT,
    FOREIGN KEY (fk_login) REFERENCES Login(id)
);

CREATE TABLE Velas(
	id INT PRIMARY KEY,
    nome VARCHAR(45),
	tamanho VARCHAR(1),
    preco DOUBLE
);

CREATE TABLE Lotes(
	id INT PRIMARY KEY,
    fk_vela INT,
    quantidade INT,
    data_fabricacao DATE,
    data_validade DATE,
    localizacao INT,
    FOREIGN KEY (fk_vela) REFERENCES Velas(id)
);

CREATE TABLE Clientes(
	id INT PRIMARY KEY,
    nome VARCHAR(45),
    telefone CHAR(11),
    qtdPedidos INT
);

CREATE TABLE Pedidos(
	id INT PRIMARY KEY,
    data_do_pedido DATE,
    status_do_pedido VARCHAR(45),
    descricao VARCHAR(255),
    tipoEntrega VARCHAR(45),
    fk_cliente INT,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes(id)
);

CREATE TABLE Pedido_lote(
	id INT PRIMARY KEY,
    fk_lote INT,
    fk_pedido INT,
    FOREIGN KEY (fk_lote) REFERENCES Lotes(id),
    FOREIGN KEY (fk_pedido) REFERENCES Pedidos(id)
);

CREATE TABLE Vendas(
	id INT PRIMARY KEY,
    fk_pedido INT,
    metodoPag VARCHAR(45),
    FOREIGN KEY (fk_pedido) REFERENCES Pedidos(id)
);

-- Populando banco de dados --

-- Tabela Velas
INSERT INTO Velas (id, nome, tamanho, preco) VALUES 
(1, 'Vela Aromática Lavanda', 0, 15.50),
(2, 'Vela de Soja Baunilha', 'G', 22.90),
(3, 'Vela Decorativa Citrus', 'P', 12.75),
(4, 'Vela Perfumada Rosas', 'M', 18.00);

-- Tabela Lotes
INSERT INTO Lotes (id, fk_vela, quantidade, data_fabricacao, data_validade, localizacao) VALUES 
(1, 1, 100, '2024-07-01', '2025-07-01', 101),
(2, 2, 50, '2024-07-05', '2025-07-05', 102),
(3, 3, 200, '2024-08-01', '2025-08-01', 103),
(4, 4, 75, '2024-08-10', '2025-08-10', 104);

-- Tabela Clientes
INSERT INTO Clientes (id, nome, telefone, qtdPedidos) VALUES 
(1, 'Maria Silva', '11987654321', 2),
(2, 'João Pereira', '11912345678', 1),
(3, 'Ana Costa', '11923456789', 3);

-- Tabela Pedidos
INSERT INTO Pedidos (id, data_do_pedido, status_do_pedido, descricao, tipoEntrega, fk_cliente) VALUES 
(1, '2024-08-15', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
(2, '2024-08-18', 'Pendente', 'Pedido de velas decorativas', 'Entrega Normal', 2),
(3, '2024-08-20', 'Concluído', 'Pedido de velas perfumadas', 'Retirada na Loja', 3);

-- Tabela Pedido_lote
INSERT INTO Pedido_lote (id, fk_lote, fk_pedido) VALUES 
(1, 1, 1),
(2, 3, 2),
(3, 4, 3);

-- Tabela Vendas
INSERT INTO Vendas (id, fk_pedido, metodoPag) VALUES 
(1, 1, 'Cartão de Crédito'),
(2, 3, 'Dinheiro');

