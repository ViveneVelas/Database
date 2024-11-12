USE viveneVelas;

INSERT INTO login (email, senha) VALUES 
	('vivene@gmail.com','vivene');

INSERT INTO usuario (nome, telefone, ultimo_acesso, fk_login) VALUES
	('Viviane', '11968523544', NULL, 1);

INSERT INTO imagem (id, referencia) VALUES
	(1, 'pinkLemonade.jp´g'),
	(2, 'brisaManha.jpg'),
	(3, 'lemongrass.jpg'),
	(4, 'cafe.jpg');

INSERT INTO velas (nome, tamanho, preco, descricao, fk_imagem) VALUES 
	('Pink Lemonade', 'M', 55.00, 'Vela com pedaços', 1),
	('Brisa da Manhã', 'M', 120.00, 'Aroma sutil e com duração de 2H', 2),
	('Lemongrass Fields', 'G', 75.00, 'Aroma fresco e forte', 3),
	('Gran Café', 'P', 100.00, 'Vela de café com grãos de café', 4);

INSERT INTO lotes (fk_vela, quantidade, data_fabricacao, data_validade, localizacao) VALUES 
	(1, 4, '2024-11-01', '2025-07-01', 1),
	(2, 10, '2024-11-05', '2025-07-05', 1),
	(3, 2, '2024-11-01', '2025-08-01', 1),
	(4, 7, '2024-11-10', '2025-08-10', 0),
	(1, 12, '2024-11-01', '2024-09-15', 0);

INSERT INTO clientes (nome, telefone, qtd_pedidos) VALUES 
	('Rebeca Barbato', '11962406222', 10),
	('Juliana Almeida', '11960303528', 11),
	('Amabille Akemi', '11988566220', 7),
	('Felipe Matashi', '11963364771', 8),
	('Lucas Matheu', '11965254555', 2),
	('Ramona Flowers', '11523656555', 3);

-- Dados para a tabela pedidos com datas de março a novembro de 2024
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, preco, fk_cliente) VALUES
    ('2024-05-05', 'concluido', 'Pedido de velas personalizadas', 'normal', 220.00, 5),
    ('2024-05-11', 'concluido', 'Pedido de velas aromáticas', 'expressa', 125.00, 6),
    ('2024-05-17', 'concluido', 'Pedido de velas decorativas', 'normal', 80.00, 1),
    
    ('2024-06-09', 'concluido', 'Pedido de velas decorativas', 'normal', 200.00, 5),
    ('2024-06-15', 'concluido', 'Pedido de velas para eventos', 'expressa', 100.00, 6),
    ('2024-06-21', 'concluido', 'Pedido de velas personalizadas', 'normal', 220.00, 1),
    ('2024-06-27', 'concluido', 'Pedido de velas com temas variados', 'expressa', 130.00, 2),
    
    ('2024-07-05', 'concluido', 'Pedido de velas exclusivas', 'normal', 150.00, 3),
    ('2024-07-12', 'concluido', 'Pedido de velas variadas', 'expressa', 175.00, 4),
    ('2024-07-18', 'concluido', 'Pedido de velas decorativas', 'normal', 100.00, 5),
    ('2024-07-24', 'concluido', 'Pedido de velas aromáticas', 'expressa', 220.00, 6),
    ('2024-07-30', 'concluido', 'Pedido de velas personalizadas', 'normal', 125.00, 1),
    
    ('2024-08-01', 'concluido', 'Pedido de velas para eventos', 'expressa', 95.00, 2),
    ('2024-08-07', 'concluido', 'Pedido de velas decorativas', 'normal', 130.00, 3),
    ('2024-08-14', 'concluido', 'Pedido de velas com temas variados', 'expressa', 210.00, 4),
    ('2024-08-21', 'concluido', 'Pedido de velas aromáticas', 'normal', 120.00, 5),
    ('2024-08-28', 'concluido', 'Pedido de velas personalizadas', 'expressa', 85.00, 6),
    
    ('2024-09-04', 'concluido', 'Pedido de velas exclusivas', 'normal', 180.00, 1),
    ('2024-09-11', 'concluido', 'Pedido de velas para eventos', 'expressa', 100.00, 2),
    ('2024-09-18', 'concluido', 'Pedido de velas decorativas', 'normal', 75.00, 3),
    ('2024-09-18', 'concluido', 'Pedido de velas decorativas', 'normal', 75.00, 3),
    ('2024-09-25', 'concluido', 'Pedido de velas variadas', 'expressa', 110.00, 4),
    ('2024-09-30', 'concluido', 'Pedido de velas com temas variados', 'normal', 105.00, 5),
    ('2024-09-30', 'concluido', 'Pedido de velas com temas variados', 'normal', 105.00, 5),
    
    ('2024-10-03', 'concluido', 'Pedido de velas aromáticas', 'expressa', 135.00, 6),
    ('2024-10-10', 'concluido', 'Pedido de velas personalizadas', 'normal', 115.00, 1),
    ('2024-10-17', 'concluido', 'Pedido de velas decorativas', 'expressa', 150.00, 2),
    ('2024-10-17', 'concluido', 'Pedido de velas decorativas', 'expressa', 150.00, 2),
    ('2024-10-24', 'concluido', 'Pedido de velas exclusivas', 'normal', 210.00, 3),
    ('2024-10-31', 'concluido', 'Pedido de velas para eventos', 'expressa', 195.00, 4),

    ('2024-11-01', 'concluido', 'Pedido de velas decorativas', 'normal', 105.00, 5),
    ('2024-11-05', 'concluido', 'Pedido de velas variadas', 'expressa', 220.00, 6),
    ('2024-11-10', 'concluido', 'Pedido de velas aromáticas', 'normal', 85.00, 1),
    ('2024-11-10', 'concluido', 'Pedido de velas aromáticas', 'normal', 85.00, 1),
	('2024-11-15', 'andamento', 'Pedido de velas personalizadas', 'expressa', 180.00, 2),
    ('2024-11-21', 'nao-iniciado', 'Pedido de velas aromáticas', 'normal', 85.00, 1),
    ('2024-11-22', 'nao-iniciado', 'Pedido de velas aromáticas', 'normal', 85.00, 1),
    ('2024-11-27', 'nao-iniciado', 'Pedido de velas com temas variados', 'normal', 115.00, 3);

INSERT INTO pedido_vela (quantidade, fk_vela, fk_pedido) VALUES
    (2, 1, 1), -- Pedido 1: "Pink Lemonade" (2 unidades)
    (1, 2, 1), -- Pedido 1: "Brisa da Manhã" (1 unidade)    
    (3, 3, 2), -- Pedido 2: "Lemongrass Fields" (3 unidades)
    (1, 1, 3), -- Pedido 3: "Pink Lemonade" (1 unidade)
    (2, 4, 3), -- Pedido 3: "Gran Café" (2 unidades)

    (2, 2, 4), -- Pedido 4: "Brisa da Manhã" (2 unidades)
    (1, 4, 5), -- Pedido 5: "Gran Café" (1 unidade)
    (2, 3, 5), -- Pedido 5: "Lemongrass Fields" (2 unidades)
    (1, 1, 6), -- Pedido 6: "Pink Lemonade" (1 unidade)
    (3, 2, 6), -- Pedido 6: "Brisa da Manhã" (3 unidades)
    (4, 3, 7), -- Pedido 7: "Lemongrass Fields" (4 unidades)

    (2, 4, 8), -- Pedido 8: "Gran Café" (2 unidades)
    (1, 1, 9), -- Pedido 9: "Pink Lemonade" (1 unidade)
    (3, 2, 9), -- Pedido 9: "Brisa da Manhã" (3 unidades)
    (1, 3, 10), -- Pedido 10: "Lemongrass Fields" (1 unidade)
    (2, 4, 10), -- Pedido 10: "Gran Café" (2 unidades)
    (2, 2, 11), -- Pedido 11: "Brisa da Manhã" (2 unidades)
    (1, 1, 12), -- Pedido 12: "Pink Lemonade" (1 unidade)
    (2, 3, 12), -- Pedido 12: "Lemongrass Fields" (2 unidades)

    (2, 1, 13), -- Pedido 13: "Pink Lemonade" (2 unidades)
    (3, 3, 14), -- Pedido 14: "Lemongrass Fields" (3 unidades)
    (1, 2, 15), -- Pedido 15: "Brisa da Manhã" (1 unidade)
    (1, 4, 15), -- Pedido 15: "Gran Café" (1 unidade)
    (1, 1, 16), -- Pedido 16: "Pink Lemonade" (1 unidade)
    (3, 2, 16), -- Pedido 16: "Brisa da Manhã" (3 unidades)
    (2, 3, 17), -- Pedido 17: "Lemongrass Fields" (2 unidades)
    
    (1, 4, 18), -- Pedido 18: "Gran Café" (1 unidade)
    (2, 2, 19), -- Pedido 19: "Brisa da Manhã" (2 unidades)
    (1, 1, 20), -- Pedido 20: "Pink Lemonade" (1 unidade)
    (3, 3, 20), -- Pedido 20: "Lemongrass Fields" (3 unidades)
    (1, 2, 21),
    (1, 3, 22),
    (1, 4, 23),
    (2, 2, 24),
    (1, 1, 24),
    
    (1, 1, 25),
    (1, 2, 26),
    (1, 4, 27),
    (1, 4, 27),
    (1, 1, 28),
    (1, 2, 29),
    (1, 1, 30),
    
    (1, 4, 31),
    (1, 3, 32),
    (1, 2, 33),
    (2, 2, 34),
    (2, 1, 35),
    (3, 4, 36),
    (1, 3, 37),
    (1, 2, 38),
    (3, 1, 38);

INSERT INTO vendas (fk_pedido, metodo_pag) VALUES
	(1, 'Cartão'), (2, 'PIX'),(3, 'Dinheiro'), -- MES 05
	(4, 'Cartão'),(5, 'PIX'),(6, 'Dinheiro'),(7, 'Dinheiro'), -- MES 06
	(8, 'Cartão'),(9, 'PIX'),(10, 'Dinheiro'),(11, 'PIX'),(12, 'Cartão'), -- MES 07
	(13, 'Dinheiro'),(14, 'PIX'),(15, 'PIX'),(16, 'Cartão'),(17, 'Cartão'), -- MES 08
	(18, 'Cartão'),(19, 'Dinheiro'),(20, 'Cartão'),(21, 'PIX'),(22, 'PIX'),(23, 'Dinheiro'),(24, 'PIX'), -- MES 09
	(25, 'Cartão'),(26, 'Dinheiro'),(27, 'Cartão'),(28, 'PIX'),(29, 'PIX'),(30, 'Dinheiro'), -- MES 10
	(31, 'Cartão'),(32, 'Dinheiro'),(33, 'Cartão'),(34, 'PIX'); -- MES 11

INSERT INTO metas (data_inicio, data_final, qtd_vendas) VALUES
	('2024-04-01', '2024-04-30', 2),
	('2024-05-01', '2024-05-30', 12),
	('2024-06-01', '2024-06-30', 6),
	('2024-07-01', '2024-07-30', 5),
	('2024-08-01', '2024-08-30', 7),
	('2024-09-01', '2024-09-30', 9),
	('2024-10-01', '2024-10-30', 15),
	('2024-11-01', '2024-11-30', 4);
