-- Junções Complexas entre Tabelas
-- Consulta para listar todas as ordens de serviço com detalhes do veículo e do cliente
SELECT OS.idOrdemDeServico, OS.DataDeEmissao, OS.Status, V.PlacaVeiculo, PF.Nome AS NomeCliente
FROM OrdemDeServico OS
JOIN Cliente C ON OS.idCliente = C.idCliente
JOIN PessoaFisica PF ON C.idPessoaFisica = PF.idPessoaFisica
JOIN Veiculo V ON C.idCliente = V.idCliente;
