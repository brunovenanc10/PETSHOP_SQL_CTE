SELECT 
    p.id_produto,
    p.nome,
    COALESCE(SUM(iv.quantidade), 0) AS total_vendido
FROM produtos p
LEFT JOIN itens_venda iv 
    ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;
