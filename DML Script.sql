-- Populando o banco de dados Vivene Velas --
USE viveneVelas;

-- Inserindo dados na tabela login
INSERT INTO login (email, senha) VALUES 
('viveneVelas@gmail.com', 'viveneVelas');

-- Inserindo dados na tabela usuario
INSERT INTO usuario (nome, telefone, ultimo_acesso, fk_login) VALUES 
('Viviane', '11987654321', '2024-11-09', 1);

-- Inserindo dados na tabela velas
INSERT INTO velas (nome, descricao, tamanho, preco, fk_bucketS3) VALUES 
('Vela Aromática Lavanda', 'Vela com aroma relaxante de lavanda', 'M', 19.99, null),
('Vela Aromática Baunilha', 'Vela com aroma doce de baunilha', 'G', 29.99, null),
('Vela Aromática Canela', 'Vela com aroma intenso de canela', 'P', 14.99, null);

-- Inserindo dados na tabela lotes
INSERT INTO lotes (fk_vela, quantidade, data_fabricacao, data_validade, localizacao, fk_bucketS3) VALUES 
(1, 100, '2024-04-01', '2025-04-01', 101, null),
(2, 150, '2024-05-01', '2025-05-01', 102, null),
(3, 200, '2024-06-01', '2025-06-01', 103, null);

-- Inserindo dados na tabela clientes
INSERT INTO clientes (nome, telefone, qtd_pedidos) VALUES 
('Carla Fernandes', '11987654322', 3),
('Lucas Andrade', '11976543211', 2),
('Beatriz Lima', '11965432108', 5);

-- Inserindo dados na tabela pedidos
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, preco, fk_cliente) VALUES 
('2024-07-01', 'Entregue', 'Pedido de velas aromáticas', 'Normal', 49.99, 1),
('2024-07-15', 'Em processamento', 'Pedido de velas decorativas', 'Expressa', 69.99, 2),
('2024-08-01', 'Pendente', 'Pedido de velas especiais', 'Normal', 89.99, 3);

-- Inserindo dados na tabela vendas
INSERT INTO vendas (fk_pedido, metodo_pag) VALUES 
(1, 'Cartão de Crédito'),
(2, 'Pix'),
(3, 'Boleto Bancário');

-- Inserindo dados na tabela metas
INSERT INTO metas (data_inicio, data_final, qtd_vendas) VALUES 
('2024-01-01', '2024-06-30', 50),
('2024-07-01', '2024-12-31', 100);

-- Pedidos realizados em 2024-05
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-05-01', 'Concluído', 'Pedido de velas aromáticas Lavanda', 'Entrega Normal', 1),
('2024-05-02', 'Concluído', 'Pedido de velas de Soja Baunilha', 'Retirada na Loja', 2),
('2024-05-10', 'Concluído', 'Pedido de velas decorativas Citrus', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-06
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-06-01', 'Concluído', 'Pedido de velas Perfumadas Rosas', 'Entrega Normal', 1),
('2024-06-03', 'Concluído', 'Pedido de velas Aromáticas Laranja', 'Retirada na Loja', 2),
('2024-06-15', 'Concluído', 'Pedido de velas Aromáticas', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-07
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-07-01', 'Concluído', 'Pedido de velas Aromáticas Lavanda', 'Entrega Normal', 1),
('2024-07-10', 'Concluído', 'Pedido de velas de Soja Baunilha', 'Retirada na Loja', 2),
('2024-07-15', 'Concluído', 'Pedido de velas Decorativas Citrus', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-08
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-08-01', 'Concluído', 'Pedido de velas Perfumadas Rosas', 'Entrega Normal', 1),
('2024-08-10', 'Concluído', 'Pedido de velas Aromáticas Laranja', 'Retirada na Loja', 2),
('2024-08-15', 'Concluído', 'Pedido de velas Aromáticas', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-09
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-09-01', 'Concluído', 'Pedido de velas Aromáticas Lavanda', 'Entrega Normal', 1),
('2024-09-10', 'Concluído', 'Pedido de velas de Soja Baunilha', 'Retirada na Loja', 2),
('2024-09-15', 'Concluído', 'Pedido de velas Decorativas Citrus', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-10
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-10-01', 'Concluído', 'Pedido de velas Perfumadas Rosas', 'Entrega Normal', 1),
('2024-10-05', 'Concluído', 'Pedido de velas Aromáticas Laranja', 'Retirada na Loja', 2),
('2024-10-10', 'Concluído', 'Pedido de velas Aromáticas', 'Entrega Rápida', 3);

-- Pedidos realizados em 2024-11 (exemplo recente)
INSERT INTO pedidos (data_do_pedido, status_do_pedido, descricao, tipo_entrega, fk_cliente) VALUES
('2024-11-01', 'Concluído', 'Pedido de velas Aromáticas Lavanda', 'Entrega Normal', 1),
('2024-11-03', 'Concluído', 'Pedido de velas de Soja Baunilha', 'Retirada na Loja', 2),
('2024-11-07', 'Concluído', 'Pedido de velas Decorativas Citrus', 'Entrega Rápida', 3);
