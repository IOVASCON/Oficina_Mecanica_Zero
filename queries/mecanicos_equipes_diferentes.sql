-- Filtrar Grupos com HAVING Statement
-- Consulta para listar mecânicos que trabalham em mais de 3 equipes diferentes
SELECT M.Nome, COUNT(E.idEquipeMecanicos) AS NumeroDeEquipes
FROM Mecanico M
JOIN EquipeMecanicos E ON M.idMecanico = E.idMecanico
GROUP BY M.Nome
HAVING NumeroDeEquipes >= 1;
