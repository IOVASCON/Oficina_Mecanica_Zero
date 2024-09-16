-- Consulta para verificar todos os mecânicos com mais de uma equipe
-- Espera-se que retorne mecânicos que pertencem a mais de uma equipe
SELECT M.Nome, COUNT(E.idEquipeMecanicos) AS NumeroDeEquipes
FROM Mecanico M
JOIN EquipeMecanicos E ON M.idMecanico = E.idMecanico
GROUP BY M.Nome
HAVING NumeroDeEquipes > 1;

-- Consulta para verificar ordens de serviço com valores acima de R$500
-- Espera-se que retorne ordens cujo ValorTotal seja maior que 500
SELECT idOrdemDeServico, ValorTotal FROM OrdemDeServico
WHERE ValorTotal > 500;

-- Consulta para verificar a integridade dos dados de clientes (PessoaFisica e PessoaJuridica)
-- Espera-se que todos os clientes listados tenham um correspondente em PessoaFisica ou PessoaJuridica
SELECT C.idCliente, PF.Nome AS NomeFisico, PJ.RazaoSocial AS NomeJuridico
FROM Cliente C
LEFT JOIN PessoaFisica PF ON C.idPessoaFisica = PF.idPessoaFisica
LEFT JOIN PessoaJuridica PJ ON C.idPessoaJuridica = PJ.idPessoaJuridica;
