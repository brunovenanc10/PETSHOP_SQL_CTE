🐾 Sistema de Banco de Dados para Petshop
📌 Sobre o projeto

Este projeto consiste na criação de um banco de dados completo para gerenciamento de um petshop, utilizando SQL.
O objetivo é simular um sistema real, permitindo o controle de clientes, pets, serviços, produtos, vendas e agendamentos.

Além da estrutura do banco, o projeto também inclui inserção de dados, consultas SQL e uso de CTEs (Common Table Expressions) para análises mais avançadas.

🗂️ Estrutura do Projeto

O projeto está dividido em múltiplos arquivos SQL:

petshop.sql → Criação completa do banco de dados
ptshp_criacao_tabelas.sql → Script separado para criação das tabelas
ptshp_inserts.sql → Inserção de dados fictícios
ptshp_consultas.sql → Consultas SQL básicas e intermediárias
praticazinha_cte.sql → Consultas avançadas utilizando CTE
🧱 Estrutura do Banco de Dados

O banco é composto pelas seguintes tabelas principais:

👤 Clientes

Armazena informações dos clientes:

Nome
Telefone
Email
Endereço
🐶 Pets

Relacionados aos clientes:

Nome do pet
Espécie (ENUM)
Raça
Data de nascimento
🛠️ Serviços

Serviços oferecidos pelo petshop:

Banho
Tosa
Consulta veterinária
etc.
📅 Agendamentos

Controle de serviços agendados:

Pet
Serviço
Data
Status (agendado, concluído, cancelado)
🛒 Produtos

Controle de estoque:

Nome
Preço
Quantidade
💰 Vendas

Registro de compras:

Cliente
Data
Valor total
📦 Itens de Venda

Detalhamento das vendas:

Produto
Quantidade
Preço unitário
🔗 Relacionamentos
Um cliente pode ter vários pets
Um pet pertence a um cliente
Um agendamento está ligado a um pet e a um serviço
Uma venda pertence a um cliente
Uma venda pode ter vários itens
📊 Funcionalidades Implementadas
✔️ CRUD básico
Criação de tabelas
Inserção de dados
Consultas
✔️ Consultas SQL

Inclui exemplos como:

Filtros com WHERE
Ordenação com ORDER BY
Agrupamentos com GROUP BY
Uso de JOIN (INNER, LEFT)

Exemplo:

SELECT clientes.nome, pets.nome
FROM clientes
LEFT JOIN pets ON clientes.id = pets.cliente_id;
✔️ Consultas Avançadas (CTE)

O projeto utiliza CTEs para análises mais complexas, como:

📌 Produtos acima da média

Calcula a média de preços e retorna produtos acima dela.

📌 Clientes com pets e compras

Relaciona quantidade de pets e compras por cliente.

📌 Clientes que gastam acima da média

Identifica os clientes mais lucrativos.

Exemplo:

WITH GastosPorCliente AS (
    SELECT clientes.nome, SUM(vendas.valor_total) AS total_gasto
    FROM clientes
    JOIN vendas ON clientes.id = vendas.cliente_id
    GROUP BY clientes.nome
)
SELECT * FROM GastosPorCliente;
🚀 Como usar
Crie o banco de dados:
CREATE DATABASE petshop;
Execute os scripts na seguinte ordem:
Criação das tabelas
Inserção de dados
Consultas
Utilize um SGBD como:
PostgreSQL (recomendado)
DBeaver
pgAdmin
🎯 Objetivo do Projeto

Este projeto foi desenvolvido com foco em:

Praticar modelagem de banco de dados
Aprender SQL na prática
Trabalhar com relacionamentos entre tabelas
Criar consultas simples e avançadas
📚 Tecnologias Utilizadas
SQL
PostgreSQL
👨‍💻 Autor

Projeto desenvolvido para fins de estudo e prática em banco de dados.
