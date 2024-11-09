-- Estrutura do banco de dados Vivene Velas --

CREATE DATABASE viveneVelas;
USE viveneVelas;

-- Tabelas -- 

CREATE TABLE login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45),
    senha VARCHAR(50)
);

CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    telefone VARCHAR(11),
    ultimo_acesso DATE,
    fk_login INT,
    FOREIGN KEY (fk_login) REFERENCES login(id)
);

CREATE TABLE bucketS3 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    referencia VARCHAR(50)
);

CREATE TABLE velas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
	descricao VARCHAR(255),
    tamanho VARCHAR(1),
    preco DOUBLE,
    fk_bucketS3 INT,
    FOREIGN KEY (fk_bucketS3) REFERENCES bucketS3(id)
);

CREATE TABLE lotes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_vela INT,
    quantidade INT,
    data_fabricacao DATE,
    data_validade DATE,
    localizacao INT,
    fk_bucketS3 INT,
    FOREIGN KEY (fk_vela) REFERENCES velas(id),
	FOREIGN KEY (fk_bucketS3) REFERENCES bucketS3(id)
);

CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) UNIQUE,
    telefone CHAR(11),
    qtd_pedidos INT
);

CREATE TABLE pedidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_do_pedido DATE,
    status_do_pedido VARCHAR(45),
    descricao VARCHAR(255),
    tipo_entrega VARCHAR(45),
    preco FLOAT,
    fk_cliente INT,
    FOREIGN KEY (fk_cliente) REFERENCES clientes(id)
);

CREATE TABLE pedido_vela(
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    fk_vela INT,
    fk_pedido INT,
    FOREIGN KEY (fk_vela) REFERENCES velas(id),
    FOREIGN KEY (fk_pedido) REFERENCES pedidos(id)
);

CREATE TABLE vendas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_pedido INT,
    metodo_pag VARCHAR(45),
    FOREIGN KEY (fk_pedido) REFERENCES pedidos(id)
);

CREATE TABLE metas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
	data_final DATE,
    qtd_vendas INT
);

