SELECT M.idMecanico, M.Nome, COUNT(E.idEquipeMecanicos) AS NumeroDeEquipes
FROM Mecanico M
JOIN EquipeMecanicos E ON M.idMecanico = E.idMecanico
GROUP BY M.idMecanico, M.Nome
ORDER BY NumeroDeEquipes DESC;
