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
	tamanho CHAR(1),
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
