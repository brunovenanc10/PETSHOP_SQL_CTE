SELECT 
    c.nome AS nome_cliente,
    v.data_venda,
    pr.nome AS nome_produto,
    iv.quantidade,
    iv.preco_unitario,
    (iv.quantidade * iv.preco_unitario) AS subtotal
FROM vendas v
JOIN clientes c 
    ON v.id_cliente = c.id_cliente
JOIN itens_venda iv 
    ON v.id_venda = iv.id_venda
JOIN produtos pr 
    ON iv.id_produto = pr.id_produto
ORDER BY v.data_venda DESC;
