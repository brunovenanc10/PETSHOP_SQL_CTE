WITH media_cliente AS (
    SELECT 
        c.id_cliente,
        c.nome,
        AVG(co.valor_total) AS media_compra
    FROM clientes c
    JOIN compras co ON c.id_cliente = co.id_cliente
    GROUP BY c.id_cliente, c.nome
)
SELECT *
FROM media_cliente
WHERE media_compra > 200;
