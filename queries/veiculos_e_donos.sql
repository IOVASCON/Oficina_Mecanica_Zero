-- Ordenação dos Dados com ORDER BY
-- Consulta para listar veículos e seus donos em ordem alfabética pelo nome do cliente
SELECT V.PlacaVeiculo, P.Nome
FROM Veiculo V
JOIN Cliente C ON V.idCliente = C.idCliente
JOIN PessoaFisica P ON C.idPessoaFisica = P.idPessoaFisica
ORDER BY P.Nome;
