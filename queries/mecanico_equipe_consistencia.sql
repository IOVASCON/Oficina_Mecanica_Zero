-- Verifica se existem mecânicos sem equipes associadas
SELECT M.idMecanico, M.Nome
FROM Mecanico M
LEFT JOIN EquipeMecanicos E ON M.idMecanico = E.idMecanico
WHERE E.idEquipeMecanicos IS NULL;
