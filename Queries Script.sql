
-- ======================================================
-- 1. VIEW VELA MAIS VENDIDA - KPI'S
-- ======================================================
CREATE OR REPLACE VIEW vela_mais_vendida AS
SELECT 
    ROW_NUMBER() OVER () AS id,
    fk_vela as vela_id,
	count(quantidade) as total_vendido, 
    nome as vela_nome
FROM pedido_vela 
JOIN velas 
	WHERE fk_vela = velas.id 
	GROUP BY fk_vela
LIMIT 1;
SELECT * FROM vela_mais_vendida;

-- ======================================================
-- 2. VIEW QTD Velas vendida semana - KPI'S
-- ======================================================
CREATE OR REPLACE VIEW qtd_vendas_da_semana AS
SELECT 
	SUM(quantidade) as qtd
FROM 
	pedidos 
JOIN
	pedido_vela
WHERE 
	fk_pedido = pedidos.id
AND
	data_do_pedido BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) 
AND 
	CURDATE()
AND 
	status_do_pedido = 'concluido';

SELECT * FROM qtd_vendas_da_semana;
-- ======================================================
-- 3. VIEW TOP 5 VELAS MAIS VENDIDAS - DASHBOARD
-- ======================================================
CREATE OR REPLACE VIEW top_cinco_velas AS
SELECT  
    ROW_NUMBER() OVER () AS id,
    fk_vela as vela_id,
	count(quantidade) as total_vendido, 
    nome as vela_nome
FROM pedido_vela 
JOIN velas 
	WHERE fk_vela = velas.id 
	GROUP BY fk_vela
LIMIT 5;
SELECT * FROM top_cinco_velas;

-- ======================================================
-- 4. VIEW Vendas 6 meses - DASHBOARD
-- ======================================================
CREATE OR REPLACE VIEW quantidade_vendas_seis_meses AS
SELECT 
	ROW_NUMBER() OVER () AS id,
    MONTH(pedidos.data_do_pedido) AS mes,
    YEAR(pedidos.data_do_pedido) AS ano,
    COUNT(pedidos.id) AS quantidade_pedidos_concluidos
FROM 
    pedidos 
WHERE 
    pedidos.status_do_pedido = 'concluido'
GROUP BY 
    YEAR(pedidos.data_do_pedido), MONTH(pedidos.data_do_pedido)
ORDER BY 
    ano, mes DESC
LIMIT 6;
    
SELECT * FROM quantidade_vendas_seis_meses;

-- ======================================================
-- 5. VIEW Metas 6 meses - DASHBOARD
-- ======================================================
CREATE OR REPLACE VIEW ultima_meta_seis_meses AS
SELECT 
	id,
    data_inicio,
    qtd_vendas
FROM metas m
JOIN (
    SELECT 
        YEAR(data_inicio) AS ano, 
        MONTH(data_inicio) AS mes, 
        MAX(data_inicio) AS ultima_data
    FROM metas
    WHERE data_inicio >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY ano, mes
) ultimas_metas
ON YEAR(m.data_inicio) = ultimas_metas.ano 
   AND MONTH(m.data_inicio) = ultimas_metas.mes
   AND m.data_inicio = ultimas_metas.ultima_data
ORDER BY m.data_inicio DESC;

SELECT * FROM ultima_meta_seis_meses;

-- ======================================================
-- 6. VIEW PARA ENCONTRAR CLIENTES COM MAIS COMPRAS - TABELA
-- ======================================================
CREATE OR REPLACE VIEW clientes_mais_compras AS
SELECT
	id as id,
    nome as nome_do_cliente,
    qtd_pedidos as numero_de_pedidos
FROM
	clientes
ORDER BY
    numero_de_pedidos DESC
    LIMIT 5;
SELECT * FROM clientes_mais_compras;




-- REVISAR

-- ======================================================
-- 5. VIEW VENDAS DA SEMANA - A FAZER
-- ======================================================
CREATE VIEW vendas_da_semana AS
SELECT 
    vendas.id AS id,
    vendas.metodo_pag AS metodo_de_pagamento,
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
-- 3. VIEW PROX PEDIDO - A FAZER
-- ======================================================
CREATE VIEW proximo_pedido AS
SELECT 
    p.id AS id,
    p.data_do_pedido AS data_do_pedido,
    p.status_do_pedido AS status_do_pedido,
    p.descricao AS descricao,
    p.tipo_entrega AS tipo_de_entrega,
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
