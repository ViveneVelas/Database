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

CREATE TABLE MetasSemanais(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dataInicio DATE,
    dataFinal DATE,
    qtdVendas INT
);

-- Populando banco de dados --

-- Tabela Velas
INSERT INTO Velas (id, nome, tamanho, preco) VALUES 
(1, 'Vela Aromática Lavanda', 0, 15.50),
(2, 'Vela de Soja Baunilha', 'G', 22.90),
(3, 'Vela Decorativa Citrus', 'P', 12.75),
(4, 'Vela Perfumada Rosas', 'M', 18.00),
(6, 'Vela Aromática Laranja', 'P', 10.00);

-- Tabela Lotes
INSERT INTO Lotes (id, fk_vela, quantidade, data_fabricacao, data_validade, localizacao) VALUES 
(1, 1, 100, '2024-07-01', '2025-07-01', 101),
(2, 2, 50, '2024-07-05', '2025-07-05', 102),
(3, 3, 200, '2024-08-01', '2025-08-01', 103),
(4, 4, 75, '2024-08-10', '2025-08-10', 104),
(5, 6, 50, '2024-07-01', '2024-09-15', 105);

-- Tabela Clientes
INSERT INTO Clientes (id, nome, telefone, qtdPedidos) VALUES 
(1, 'Maria Silva', '11987654321', 2),
(2, 'João Pereira', '11912345678', 1),
(3, 'Ana Costa', '11923456789', 3);

-- Tabela Pedidos
INSERT INTO Pedidos (id, data_do_pedido, status_do_pedido, descricao, tipoEntrega, fk_cliente) VALUES 
(1, '2024-08-15', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
(2, '2024-08-18', 'Pendente', 'Pedido de velas decorativas', 'Entrega Normal', 2),
(3, '2024-08-20', 'Concluído', 'Pedido de velas perfumadas', 'Retirada na Loja', 3),
(4, '2024-08-21', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
(5, '2024-08-22', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
(6, '2024-08-23', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3),
(7, '2024-09-04', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
(8, '2024-09-10', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
(9, '2024-09-15', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3),
(10, '2024-09-18', 'Concluído', 'Pedido de velas aromáticas', 'Entrega Rápida', 1),
(11, '2024-09-20', 'Concluído', 'Pedido de velas decorativas', 'Retirada na Loja', 2),
(12, '2024-09-25', 'Concluído', 'Pedido de velas perfumadas', 'Entrega Normal', 3);

-- Tabela Pedido_lote
INSERT INTO Pedido_lote (id, fk_lote, fk_pedido) VALUES 
(1, 1, 1),
(2, 3, 2),
(3, 4, 3),
(4, 1, 7),
(5, 2, 8),
(6, 3, 9),
(7, 1, 10),
(8, 2, 11),
(9, 3, 12);


-- Tabela Vendas
INSERT INTO Vendas (id, fk_pedido, metodoPag) VALUES 
(1, 1, 'Cartão de Crédito'),
(2, 3, 'Dinheiro'),
(3, 4, 'Cartão de Crédito'), 
(4, 5, 'Dinheiro'),       
(5, 6, 'Pix'),
(6, 7, 'Cartão de Crédito'),
(7, 8, 'Dinheiro'),
(8, 9, 'Pix'),
(9, 10, 'Cartão de Crédito'),
(10, 11, 'Dinheiro'),
(11, 12, 'Pix');

-- Metas semanais
INSERT INTO MetasSemanais (dataInicio, dataFinal, qtdVendas) VALUES
('2024-08-19', '2024-08-25', 50), 
('2024-08-26', '2024-09-01', 60), 
('2024-09-02', '2024-09-08', 55),  
('2024-09-09', '2024-09-15', 70),
('2024-09-02', '2024-09-08', 20), 
('2024-09-09', '2024-09-15', 30), 
('2024-09-16', '2024-09-22', 25), 
('2024-09-23', '2024-09-29', 35); 





-- Views -- 

-- View vela mais vendida 
CREATE VIEW VelaMaisVendida AS
SELECT 
    V.nome AS Nome_da_Vela,
    SUM(L.quantidade) AS Total_Vendido
FROM 
    Vendas VE
JOIN 
    Pedidos P ON VE.fk_pedido = P.id
JOIN 
    Pedido_lote PL ON P.id = PL.fk_pedido
JOIN 
    Lotes L ON PL.fk_lote = L.id
JOIN 
    Velas V ON L.fk_vela = V.id
GROUP BY 
    V.nome
ORDER BY 
    Total_Vendido DESC
LIMIT 1;

SELECT * FROM VelaMaisVendida;

-- View top 5 velas mais vendidas
CREATE VIEW TopCincoVelasMaisVendida AS
SELECT 
    V.nome AS Nome_da_Vela,
    SUM(L.quantidade) AS Total_Vendido
FROM 
    Vendas VE
JOIN 
    Pedidos P ON VE.fk_pedido = P.id
JOIN 
    Pedido_lote PL ON P.id = PL.fk_pedido
JOIN 
    Lotes L ON PL.fk_lote = L.id
JOIN 
    Velas V ON L.fk_vela = V.id
GROUP BY 
    V.nome
ORDER BY 
    Total_Vendido DESC
LIMIT 5;

SELECT * FROM TopCincoVelasMaisVendida;

-- View próximo pedido
CREATE VIEW proximoPedido AS
SELECT 
    P.id AS Pedido_ID,
    P.data_do_pedido AS Data_do_Pedido,
    P.status_do_pedido AS Status_do_Pedido,
    P.descricao AS Descricao,
    P.tipoEntrega AS Tipo_de_Entrega,
    C.nome AS Nome_do_Cliente,
    C.telefone AS Telefone_do_Cliente
FROM 
    Pedidos P
JOIN 
    Clientes C ON P.fk_cliente = C.id
WHERE 
    P.status_do_pedido = 'Pendente'
ORDER BY 
    P.data_do_pedido ASC
LIMIT 1;

SELECT * FROM proximoPedido;

-- View lotes proximo do vencimento
CREATE VIEW lotesProximoDoVencimento AS
SELECT 
    V.nome AS Nome_da_Vela,
    L.id AS Lote_ID,
    L.data_fabricacao AS Data_de_Fabricacao,
    L.data_validade AS Data_de_Validade,
    L.quantidade AS Quantidade_Disponivel,
    DATEDIFF(L.data_validade, CURDATE()) AS Dias_Para_Vencimento
FROM 
    Lotes L
JOIN 
    Velas V ON L.fk_vela = V.id
WHERE 
    L.data_validade BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY 
    L.data_validade ASC;
    
SELECT * FROM lotesProximoDoVencimento;

-- View vendas da semana
CREATE VIEW vendasDaSemana AS
SELECT 
    Vendas.id AS Venda_ID,
    Vendas.metodoPag AS Metodo_de_Pagamento,
    Pedidos.data_do_pedido AS Data_do_Pedido,
    Clientes.nome AS Nome_do_Cliente,
    Clientes.telefone AS Telefone_do_Cliente
FROM 
    Vendas
JOIN 
    Pedidos ON Vendas.fk_pedido = Pedidos.id
JOIN 
    Clientes ON Pedidos.fk_cliente = Clientes.id
WHERE 
    Pedidos.status_do_pedido = 'Concluído'
    AND YEARWEEK(Pedidos.data_do_pedido, 1) = YEARWEEK(CURDATE(), 1);
    
SELECT * FROM vendasDaSemana;


-- View para encontrar os clientes com mais compras
CREATE VIEW clientesComMaisCompras AS
SELECT
    C.id AS Cliente_ID,
    C.nome AS Nome_do_Cliente,
    COUNT(P.id) AS Numero_de_Pedidos
FROM
    Clientes C
JOIN
    Pedidos P ON C.id = P.fk_cliente
WHERE
    P.status_do_pedido = 'Concluído' -- Filtra apenas os pedidos concluídos
GROUP BY
    C.id, C.nome
ORDER BY
    Numero_de_Pedidos DESC
    LIMIT 3;
    
SELECT * FROM clientesComMaisCompras;

-- View para comparar vendas da semana atual com as metas da semana atual
CREATE VIEW ComparacaoVendasMetas AS
SELECT
    M.dataInicio AS Data_Inicio,
    M.dataFinal AS Data_Final,
    M.qtdVendas AS Meta_Quantidade,
    COALESCE(SUM(V.qtdVendas), 0) AS Vendas_Realizadas,
    COALESCE(SUM(V.qtdVendas), 0) - M.qtdVendas AS Diferença
FROM
    MetasSemanais M
LEFT JOIN (
    SELECT
        P.data_do_pedido,
        COUNT(V.id) AS qtdVendas
    FROM
        Vendas V
    JOIN
        Pedidos P ON V.fk_pedido = P.id
    WHERE
        P.data_do_pedido BETWEEN (SELECT MIN(dataInicio) FROM MetasSemanais WHERE YEARWEEK(dataInicio, 1) = YEARWEEK(CURDATE(), 1))
        AND (SELECT MAX(dataFinal) FROM MetasSemanais WHERE YEARWEEK(dataFinal, 1) = YEARWEEK(CURDATE(), 1))
    GROUP BY
        P.data_do_pedido
) V ON V.data_do_pedido BETWEEN M.dataInicio AND M.dataFinal
WHERE
    M.dataInicio = (SELECT MIN(dataInicio) FROM MetasSemanais WHERE YEARWEEK(dataInicio, 1) = YEARWEEK(CURDATE(), 1))
GROUP BY
    M.dataInicio, M.dataFinal, M.qtdVendas;

SELECT * FROM ComparacaoVendasMetas;


-- View para comparar vendas do mês atual com as metas do mês atual

CREATE VIEW ComparacaoVendasMetasMes AS
SELECT
    M.dataInicio AS Data_Inicio,
    M.dataFinal AS Data_Final,
    M.qtdVendas AS Meta_Quantidade,
    COALESCE(SUM(V.qtdVendas), 0) AS Vendas_Realizadas,
    COALESCE(SUM(V.qtdVendas), 0) - M.qtdVendas AS Diferença
FROM
    MetasSemanais M
LEFT JOIN (
    SELECT
        P.data_do_pedido,
        COUNT(V.id) AS qtdVendas
    FROM
        Vendas V
    JOIN
        Pedidos P ON V.fk_pedido = P.id
    WHERE
        P.data_do_pedido BETWEEN (SELECT MIN(dataInicio) FROM MetasSemanais WHERE YEAR(dataInicio) = YEAR(CURDATE()) AND MONTH(dataInicio) = MONTH(CURDATE()))
        AND (SELECT MAX(dataFinal) FROM MetasSemanais WHERE YEAR(dataFinal) = YEAR(CURDATE()) AND MONTH(dataFinal) = MONTH(CURDATE()))
    GROUP BY
        P.data_do_pedido
) V ON V.data_do_pedido BETWEEN M.dataInicio AND M.dataFinal
WHERE
    M.dataInicio = (SELECT MIN(dataInicio) FROM MetasSemanais WHERE YEAR(dataInicio) = YEAR(CURDATE()) AND MONTH(dataInicio) = MONTH(CURDATE()))
GROUP BY
    M.dataInicio, M.dataFinal, M.qtdVendas;

-- Consulta para visualizar a comparação
SELECT * FROM ComparacaoVendasMetasMes;


-- Query para selecionar todas as quantidades de velas de um tipo específico
SELECT 
    V.nome AS Nome_da_Vela,
    SUM(L.quantidade) AS Quantidade_Total
FROM 
    Velas V
JOIN 
    Lotes L ON V.id = L.fk_vela
WHERE 
    V.tamanho = 'G' -- Substitua 'P' pelo tipo de vela desejado
GROUP BY 
    V.id, V.nome;



