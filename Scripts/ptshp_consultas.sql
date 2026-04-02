
SELECT * FROM clientes
limit 1; 

SELECT nome, telefone FROM clientes;


SELECT id       as codigo_cliente,
		nome    AS nome_cliente, 
	   telefone AS contato_wts 
FROM clientes;


SELECT * FROM clientes 
WHERE endereco like '%rua%';



SELECT * FROM produtos 
WHERE preco > 100;

SELECT * FROM produtos 
WHERE quantidade_estoque < 20;

SELECT * FROM clientes 
WHERE nome LIKE '%Silva%';


SELECT * FROM clientes 
WHERE email LIKE '%@gmail.com';


SELECT * FROM produtos 
WHERE preco > 50 
  AND quantidade_estoque > 10;

SELECT * FROM pets 
WHERE especie = 'cachorro' 
   OR especie = 'gato';


SELECT * FROM produtos 
ORDER BY preco DESC;

SELECT * FROM clientes 
ORDER BY nome ASC;

SELECT * FROM produtos 
ORDER BY preco DESC LIMIT 5;

SELECT nome, preco 
FROM produtos 
ORDER BY preco DESC 
LIMIT 3;


SELECT 
	DISTINCT especie 
FROM pets;


SELECT especie,
	COUNT(DISTINCT especie) as contagem
FROM pets
group by especie;


SELECT * FROM pets 
WHERE id IN (25,27,15,30);


SELECT * FROM produtos 
WHERE preco BETWEEN 50 AND 150;

SELECT * FROM agendamentos 
WHERE data_agendamento 
BETWEEN '2026-01-01' AND '2026-01-31';




SELECT 
    pets.id          as id_do_pet,
	pets.nome        AS pet,
    pets.especie,
    pets.cliente_id   as id_tabela_cliente,
    clientes.id       as id_cliente,
    clientes.nome     AS dono,
    clientes.telefone
FROM clientes 
left JOIN pets
	ON pets.cliente_id = clientes.id;




SELECT 
    agen.data_agendamento,
    agen.status,
    pets.nome           AS pet,
    serv.nome       AS servico,
    serv.preco
FROM agendamentos as agen
INNER JOIN pets 
	ON agen.pet_id = pets.id
INNER JOIN servicos as serv
	ON agen.servico_id = serv.id;







SELECT 
    clientes.nome AS cliente,
    pets.nome AS pet,
    servicos.nome AS servico,
    agendamentos.data_agendamento
FROM agendamentos
INNER JOIN pets ON agendamentos.pet_id = pets.id
INNER JOIN servicos ON agendamentos.servico_id = servicos.id
INNER JOIN clientes ON pets.cliente_id = clientes.id;


SELECT 
    clientes.nome,
    COUNT(pets.id) AS total_pets
FROM clientes
LEFT JOIN pets ON clientes.id = pets.cliente_id
GROUP BY clientes.id, clientes.nome;

SELECT clientes.nome
FROM clientes
LEFT JOIN pets ON clientes.id = pets.cliente_id
WHERE pets.id IS NULL;

SELECT 
    vendas.id AS venda_id,
    vendas.data_venda,
    clientes.nome AS cliente,
    produtos.nome AS produto,
    itens_venda.quantidade,
    itens_venda.preco_unitario,
    (itens_venda.quantidade * itens_venda.preco_unitario) AS subtotal
FROM vendas
INNER JOIN clientes ON vendas.cliente_id = clientes.id
INNER JOIN itens_venda ON vendas.id = itens_venda.venda_id
INNER JOIN produtos ON itens_venda.produto_id = produtos.id;


SELECT 
    vendas.id,
    clientes.nome,
            itens_venda.preco_unitario) AS total
FROM vendas
INNER JOIN clientes 
	ON vendas.cliente_id = clientes.id
INNER JOIN itens_venda 
	ON vendas.id = itens_venda.venda_id
GROUP BY vendas.id, clientes.nome;