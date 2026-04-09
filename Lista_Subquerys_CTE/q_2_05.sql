WITH total_cliente AS (
    SELECT 
        c.id_cliente,
        c.nome,
        SUM(co.valor_total) AS total_gasto
    FROM clientes c
    JOIN compras co ON c.id_cliente = co.id_cliente
    GROUP BY c.id_cliente, c.nome
),
media_geral AS (
    SELECT AVG(total_gasto) AS media FROM total_cliente
),
clientes_com_pets AS (
    SELECT 
        p.id_cliente,
        COUNT(p.id_pet) AS qtd_pets
    FROM pets p
    GROUP BY p.id_cliente
)
SELECT tc.*
FROM total_cliente tc
JOIN media_geral mg ON tc.total_gasto > mg.media
JOIN clientes_com_pets cp ON tc.id_cliente = cp.id_cliente
WHERE cp.qtd_pets > 1;
