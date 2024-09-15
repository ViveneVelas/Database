# Database Vivane Velas 

O banco de dados do projeto Vivene Velas foi desenvolvido utilizando Mysql. <br>
[![My Skills](https://skillicons.dev/icons?i=mysql)](https://skillicons.dev)

<p align = "center">
<img src="https://img.shields.io/static/v1?label=STATUS&message=EM%20ANDAMENTO&color=yellow&style=for-the-badge"/>
</p>


## Estrutura do Banco de Dados


### Tabela: Login

- **Descrição:** Armazena as credenciais de login dos usuários.
- **Colunas:**
  - `id` (INT): Identificador único do login. **Primary Key**
  - `email` (VARCHAR(45)): Email do usuário.
  - `senha` (VARCHAR(50)): Senha do usuário.

### Tabela: Usuario

- **Descrição:** Armazena informações sobre os usuários do sistema.
- **Colunas:**
  - `id` (INT): Identificador único do usuário. **Primary Key**
  - `nome` (VARCHAR(45)): Nome do usuário.
  - `ultimo_acesso` (DATE): Data do último acesso do usuário.
  - `fk_login` (INT): Referência ao ID de login. **Foreign Key** relacionada à tabela `Login(id)`.

### Tabela: Velas

- **Descrição:** Armazena informações sobre os tipos de velas disponíveis.
- **Colunas:**
  - `id` (INT): Identificador único do tipo de vela. **Primary Key**
  - `nome` (VARCHAR(45)): Nome da vela.
  - `aroma` (VARCHAR(45)): Aroma da vela.
  - `tamanho` (CHAR(1)): Tamanho da vela (ex: S, M, L).
  - `preco` (DOUBLE): Preço da vela.

### Tabela: Lotes

- **Descrição:** Armazena informações sobre os lotes de velas.
- **Colunas:**
  - `id` (INT): Identificador único do lote. **Primary Key**
  - `fk_vela` (INT): Referência ao ID do tipo de vela. **Foreign Key** relacionada à tabela `Velas(id)`.
  - `quantidade` (INT): Quantidade de velas no lote.
  - `data_fabricacao` (DATE): Data de fabricação do lote.
  - `data_validade` (DATE): Data de validade do lote.

### Tabela: Clientes

- **Descrição:** Armazena informações dos clientes da loja.
- **Colunas:**
  - `id` (INT): Identificador único do cliente. **Primary Key**
  - `nome` (VARCHAR(45)): Nome do cliente.
  - `telefone` (CHAR(11)): Telefone do cliente.
  - `qtdPedidos` (INT): Quantidade de pedidos feitos pelo cliente.

### Tabela: Pedidos

- **Descrição:** Armazena informações sobre os pedidos feitos pelos clientes.
- **Colunas:**
  - `id` (INT): Identificador único do pedido. **Primary Key**
  - `data_do_pedido` (DATE): Data em que o pedido foi realizado.
  - `status_do_pedido` (VARCHAR(45)): Status atual do pedido.
  - `descricao` (VARCHAR(255)): Descrição detalhada do pedido.
  - `tipoEntrega` (VARCHAR(45)): Tipo de entrega selecionado.
  - `fk_cliente` (INT): Referência ao ID do cliente. **Foreign Key** relacionada à tabela `Clientes(id)`.

### Tabela: Pedido_lote

- **Descrição:** Tabela intermediária que armazena a relação entre pedidos e lotes de velas.
- **Colunas:**
  - `id` (INT): Identificador único da relação. **Primary Key**
  - `fk_lote` (INT): Referência ao ID do lote. **Foreign Key** relacionada à tabela `Lotes(id)`.
  - `fk_pedido` (INT): Referência ao ID do pedido. **Foreign Key** relacionada à tabela `Pedidos(id)`.

### Tabela: Vendas

- **Descrição:** Armazena informações sobre as vendas realizadas.
- **Colunas:**
  - `id` (INT): Identificador único da venda. **Primary Key**
  - `fk_pedido` (INT): Referência ao ID do pedido associado. **Foreign Key** relacionada à tabela `Pedidos(id)`.
  - `metodoPag` (VARCHAR(45)): Método de pagamento utilizado (ex: cartão, boleto, pix).
