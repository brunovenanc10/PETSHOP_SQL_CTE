SELECT *
FROM clientes c
WHERE c.id_cliente IN (
    SELECT co.id_cliente
    FROM compras co
    JOIN itens_compra ic ON co.id_compra = ic.id_compra
    JOIN produtos p ON ic.id_produto = p.id_produto
    WHERE LOWER(p.descricao) LIKE '%ração%'
);
