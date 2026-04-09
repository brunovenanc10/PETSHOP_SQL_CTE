SELECT 
    p.nome AS nome_pet,
    p.especie,
    p.raca,
    c.nome AS nome_dono,
    c.telefone
FROM pets p
INNER JOIN clientes c 
    ON p.id_cliente = c.id_cliente;
