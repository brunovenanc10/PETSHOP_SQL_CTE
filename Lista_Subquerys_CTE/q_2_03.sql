SELECT *
FROM produtos p
WHERE p.id_produto IN (
    SELECT ic.id_produto
    FROM itens_compra ic
    GROUP BY ic.id_produto
    HAVING SUM(ic.quantidade) > 2
);
