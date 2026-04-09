WITH total_agendamentos AS (
    SELECT 
        s.id_servico,
        s.nome,
        COUNT(a.id_agendamento) AS total
    FROM servicos s
    LEFT JOIN agendamentos a ON s.id_servico = a.id_servico
    GROUP BY s.id_servico, s.nome
)
SELECT *
FROM total_agendamentos
ORDER BY total DESC
LIMIT 3;
