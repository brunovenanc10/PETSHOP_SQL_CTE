SELECT 
    c.id_cliente,
    c.nome,
    COALESCE(COUNT(v.id_venda), 0) AS total_compras
FROM clientes c
LEFT JOIN vendas v 
    ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_compras DESC;
