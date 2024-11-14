DROP DATABASE IF EXISTS viveneVelas;
CREATE DATABASE viveneVelas;
USE viveneVelas;

CREATE TABLE IF NOT EXISTS login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45),
    senha VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    telefone VARCHAR(11),
    ultimo_acesso DATE,
    fk_login INT,
    FOREIGN KEY (fk_login) REFERENCES login(id)
);

CREATE TABLE IF NOT EXISTS imagem(
	id INT PRIMARY KEY AUTO_INCREMENT,
    referencia VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS velas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
	descricao VARCHAR(255),
    tamanho VARCHAR(1),
    preco DOUBLE,
    fk_imagem INT,
    FOREIGN KEY (fk_imagem) REFERENCES imagem(id)
);

CREATE TABLE IF NOT EXISTS lotes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_vela INT,
    quantidade INT,
    data_fabricacao DATE,
    data_validade DATE,
    localizacao INT,
    codigo_qr_code VARCHAR(255),
    FOREIGN KEY (fk_vela) REFERENCES velas(id)
);

CREATE TABLE IF NOT EXISTS clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone CHAR(11),
    qtd_pedidos INT
);

CREATE TABLE IF NOT EXISTS pedidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_do_pedido DATE,
    status_do_pedido VARCHAR(45),
    descricao VARCHAR(255),
    tipo_entrega VARCHAR(45),
    preco FLOAT,
    fk_cliente INT,
    FOREIGN KEY (fk_cliente) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS pedido_vela(
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    fk_vela INT,
    fk_pedido INT,
    FOREIGN KEY (fk_vela) REFERENCES velas(id),
    FOREIGN KEY (fk_pedido) REFERENCES pedidos(id)
);

CREATE TABLE IF NOT EXISTS vendas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_pedido INT,
    metodo_pag VARCHAR(45),
    FOREIGN KEY (fk_pedido) REFERENCES pedidos(id)
);

CREATE TABLE IF NOT EXISTS metas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
	data_final DATE,
    qtd_vendas INT
);
