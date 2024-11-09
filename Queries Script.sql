-- Queries e Views banco de dados Vivene Velas -- 

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
-- 5.1. VIEW VENDAS QTD DA SEMANA - OK
-- ======================================================
CREATE OR REPLACE VIEW qtd_vendas_da_semana AS
SELECT 
    COUNT(vendas.id) AS qtd
FROM 
    vendas
JOIN 
    pedidos ON vendas.fk_pedido = pedidos.id
JOIN 
    clientes ON pedidos.fk_cliente = clientes.id
WHERE 
    pedidos.status_do_pedido = 'Concluído'
    AND YEARWEEK(pedidos.data_do_pedido, 1) = YEARWEEK(CURDATE(), 1);

SELECT * FROM qtd_vendas_da_semana;

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
    data_inicio as data_inicio,
    qtd_vendas as quantidade_vendas
FROM (
    SELECT 
        data_inicio,
        qtd_vendas,
        ROW_NUMBER() OVER (PARTITION BY YEAR(data_inicio), MONTH(data_inicio) ORDER BY data_inicio DESC) AS rn
    FROM 
        metas
    WHERE 
        data_inicio >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
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
select * from vendas;

-- ======================================================
-- 9. VIEW PARA OBTER O MAIOR PEDIDO FEITO
-- ======================================================

CREATE OR REPLACE VIEW maior_pedido_pendente AS
SELECT 
    p.id AS pedido_id,
    p.descricao AS descricao_pedido,
    SUM(pv.quantidade) AS total_itens
FROM 
    pedidos p
JOIN 
    pedido_vela pv ON p.id = pv.fk_pedido
WHERE 
    p.status_do_pedido = 'Pendente'
GROUP BY 
    p.id, p.descricao
ORDER BY 
    total_itens DESC
LIMIT 1;

SELECT * FROM maior_pedido_pendente;

-- ======================================================
-- 10. VIEW PARA OBTER A VELA COM A MENOR QUANTIDADE
-- ======================================================

CREATE OR REPLACE VIEW lote_menor_quantidade AS
SELECT 
    l.id AS lote_id,
    v.nome AS nome_vela,
    l.fk_vela AS fk_vela,
    l.quantidade AS quantidade_no_lote
FROM 
    lotes l
JOIN 
    velas v ON l.fk_vela = v.id
ORDER BY 
    l.quantidade ASC
LIMIT 1;

SELECT * FROM lote_menor_quantidade;