-- Banco de dados Vivene Velas --

DROP DATABASE IF EXISTS viveneVelas;
CREATE DATABASE viveneVelas;
USE viveneVelas;

-- DROP DATABASE viveneVelas;

-- Criação das tabelas --

CREATE TABLE login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45),
    senha VARCHAR(50)
);

CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ultimo_acesso DATE,
    fk_login INT,
    FOREIGN KEY (fk_login) REFERENCES login(id)
);

CREATE TABLE velas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tamanho VARCHAR(1),
    preco DOUBLE
);

CREATE TABLE lotes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_vela INT,
    quantidade INT,
    data_fabricacao DATE,
    data_validade DATE,
    localizacao INT,
    FOREIGN KEY (fk_vela) REFERENCES velas(id)
);

CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone CHAR(11),
    qtdPedidos INT
);

CREATE TABLE pedidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_do_pedido DATE,
    status_do_pedido VARCHAR(45),
    descricao VARCHAR(255),
    tipoEntrega VARCHAR(45),
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
    metodoPag VARCHAR(45),
    FOREIGN KEY (fk_pedido) REFERENCES pedidos(id)
);

CREATE TABLE metas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    dataInicio DATE,
    qtdVendas INT
);

CREATE TABLE Imagem(
	id INT PRIMARY KEY AUTO_INCREMENT,
    referencia VARCHAR(45)
);

-- Populando banco de dados --

-- Tabela Velas
-- Populando banco de dados --

-- Tabela Velas
INSERT INTO velas (nome, tamanho, preco) VALUES 
('Vela Aromática', 'M', 15.00),
('Vela Aromática Lavanda', 'M', 15.50),
('Vela de Soja Baunilha', 'G', 22.90),
('Vela Decorativa Citrus', 'P', 12.75),
('Vela Perfumada Rosas', 'M', 18.00),
('Vela Aromática Laranja', 'P', 10.00);

-- Tabela Lotes
INSERT INTO lotes (fk_vela, quantidade, data_fabricacao, data_validade, localizacao) VALUES 
(1, 100, '2024-07-01', '2025-07-01', 101),
(2, 50, '2024-07-05', '2025-07-05', 102),
(3, 200, '2024-08-01', '2025-08-01', 103),
(4, 75, '2024-08-10', '2025-08-10', 104),
(6, 50, '2024-07-01', '2024-09-15', 105);

-- Tabela Clientes
INSERT INTO clientes (nome, telefone, qtdPedidos) VALUES 
('Maria Silva', '11987654321', 2),
('João Pereira', '11912345678', 1),
('Ana Costa', '11923456789', 3);

-- Tabela Pedidos
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipoEntrega, fk_cliente) VALUES 
('2024-08-15', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
('2024-08-18', 'Pendente', 'Pedido de velas decorativas', 'Entrega Normal', 2),
('2024-08-20', 'Concluído', 'Pedido de velas perfumadas', 'Retirada na Loja', 3),
('2024-08-21', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
('2024-08-22', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
('2024-08-23', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3),
('2024-09-04', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
('2024-09-10', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
('2024-09-15', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3),
('2024-09-18', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
('2024-09-20', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
('2024-09-25', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3);

INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipoEntrega, fk_cliente) VALUES 
('2025-01-15', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1);

select * from velas;
select * from pedidos;
select * from pedido_vela;

-- Tabela Pedido_lote
INSERT INTO pedido_vela (fk_vela, fk_pedido,quantidade) VALUES 
(1, 1, 2),
(3, 2, 3),
(4, 3, 1),
(1, 7, 4),
(6, 8, 1),
(3, 9, 2),
(5, 10, 1),
(2, 11, 2),
(3, 12, 1);

-- Tabela Vendas
INSERT INTO vendas (fk_pedido, metodoPag) VALUES 
(1, 'Cartão de Crédito'),
(3, 'Dinheiro'),
(4, 'Cartão de Crédito'), 
(5, 'Dinheiro'),       
(6, 'Pix'),
(7, 'Cartão de Crédito'),
(8, 'Dinheiro'),
(9, 'Pix'),
(10, 'Cartão de Crédito'),
(11, 'Dinheiro'),
(12, 'Pix');

-- Metas semanais
INSERT INTO metas (dataInicio, qtdVendas) VALUES
('2024-03-19', 50), 
('2024-03-26', 60), 
('2024-04-02', 55),  
('2024-04-09', 70),
('2024-05-02', 20), 
('2024-05-09', 30), 
('2024-06-16', 25), 
('2024-6-20', 9),
('2024-7-12', 35),
('2024-7-20', 35),
('2024-8-10', 35),
('2024-7-19', 35),
('2024-9-19', 35);


-- Views -- 

-- ======================================================
-- 1. VIEW VELA MAIS VENDIDA - OK
-- ======================================================
CREATE OR REPLACE VIEW vela_mais_vendida AS
SELECT 
    v.id AS vela_id,
    v.nome AS vela_nome,
    SUM(pv.quantidade) AS total_vendido
FROM 
    pedido_vela pv
JOIN 
    velas v ON pv.fk_vela = v.id
GROUP BY 
    v.id, v.nome
ORDER BY 
    total_vendido DESC
LIMIT 1;

SELECT * FROM vela_mais_vendida;

-- ======================================================
-- 2. VIEW TOP 5 VELAS MAIS VENDIDAS - OK
-- ======================================================
CREATE OR REPLACE VIEW top_cinco_velas AS
SELECT 
    v.id AS vela_id,
    v.nome AS vela_nome,
    SUM(pv.quantidade) AS total_vendido
FROM 
    pedido_vela pv
JOIN 
    velas v ON pv.fk_vela = v.id
GROUP BY 
    v.id, v.nome
ORDER BY 
    total_vendido DESC
LIMIT 5;

SELECT * FROM top_cinco_velas;
-- ======================================================
-- 3. VIEW PROX PEDIDO - A FAZER
-- ======================================================
CREATE OR REPLACE VIEW proximo_pedido AS
SELECT
    p.id AS id,
    p.data_do_pedido AS data_do_pedido,
    p.status_do_pedido AS status_do_pedido,
    p.descricao AS descricao,
    p.tipoEntrega AS tipo_de_entrega,
    c.nome AS nome_do_cliente,
    c.telefone AS telefone_do_cliente
FROM
    pedidos p
JOIN
    clientes c ON p.fk_cliente = c.id
WHERE
    p.status_do_pedido = 'Pendente'
ORDER BY
    p.data_do_pedido ASC
LIMIT 1;

SELECT * FROM proximo_pedido;

-- ======================================================
-- 4. VIEW LOTES PROXIMOS DO VENCIMENTO - OK
-- ======================================================
CREATE OR REPLACE VIEW lotes_proximo_do_vencimento AS
SELECT 
    l.id AS id,
    v.nome AS nome_da_vela,
    l.quantidade,
    l.data_fabricacao,
    l.data_validade,
    l.localizacao
FROM 
    lotes l
JOIN 
    velas v ON l.fk_vela = v.id
WHERE 
    l.data_validade > CURDATE()
ORDER BY 
    l.data_validade ASC
LIMIT 1;

SELECT * FROM lotes_proximo_do_vencimento;

-- ======================================================
-- 5. VIEW VENDAS DA SEMANA - OK
-- ======================================================
CREATE OR REPLACE VIEW vendas_da_semana AS
SELECT
    vendas.id AS id,
    vendas.metodoPag AS metodo_de_pagamento,
    pedidos.data_do_pedido AS data_do_pedido,
    clientes.nome AS nome_do_cliente,
    clientes.telefone AS telefone_do_cliente
FROM
    vendas
JOIN
    pedidos ON vendas.fk_pedido = pedidos.id
JOIN
    clientes ON pedidos.fk_cliente = clientes.id
WHERE
    pedidos.status_do_pedido = 'Concluído'
    AND YEARWEEK(pedidos.data_do_pedido, 1) = YEARWEEK(CURDATE(), 1);

SELECT * FROM vendas_da_semana;

-- ======================================================
-- 6. VIEW PARA ENCONTRAR CLIENTES COM MAIS COMPRAS - OK
-- ======================================================
CREATE OR REPLACE VIEW clientes_mais_compras AS
SELECT
    c.id AS id,
    c.nome AS nome_do_cliente,
    COUNT(p.id) AS numero_de_pedidos
FROM
    clientes c
JOIN
    pedidos p ON c.id = p.fk_cliente
WHERE
    p.status_do_pedido = 'Concluído'
GROUP BY
    c.id, c.nome
ORDER BY
    numero_de_pedidos DESC
LIMIT 5;

SELECT * FROM clientes_mais_compras;

-- ======================================================
-- 7. VIEW PARA ENCONTRAR ULTIMA META DO MES, EM SEIS MESES
-- ======================================================
CREATE OR REPLACE VIEW ultima_meta_seis_meses AS
SELECT 
    ROW_NUMBER() OVER() AS id,
    dataInicio as data_inicio,
    qtdVendas as quantidade_vendas
FROM (
    SELECT 
        dataInicio,
        qtdVendas,
        ROW_NUMBER() OVER (PARTITION BY YEAR(dataInicio), MONTH(dataInicio) ORDER BY dataInicio DESC) AS rn
    FROM 
        metas
    WHERE 
        dataInicio >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
) AS UltimasMetas
WHERE rn = 1
LIMIT 6;

SELECT * FROM ultima_meta_seis_meses;

-- ======================================================
-- 8. VIEW PARA OBTER A QUANTIDADE DE VENDAS POR MES, EM SEIS MESES
-- ======================================================
CREATE OR REPLACE VIEW quantidade_vendas_seis_meses AS
SELECT 
    ROW_NUMBER() OVER() AS id,
    DATE_FORMAT(p.data_do_pedido, '%Y-%m-01') AS mes_ano,
    COUNT(*) AS quantidade_pedidos_concluidos
FROM 
    pedidos p
WHERE 
    p.status_do_pedido = 'Concluído'
    AND p.data_do_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY 
    mes_ano
ORDER BY 
    mes_ano ASC;

SELECT * FROM quantidade_vendas_seis_meses;

