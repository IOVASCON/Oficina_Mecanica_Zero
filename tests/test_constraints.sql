-- Teste de Constraints para PessoaFisica (testar inserção de CPF duplicado)
-- Deve falhar devido à constraint de chave primária ou única
INSERT INTO PessoaFisica (idPessoaFisica, Nome, CPF, Endereco, Contato)
VALUES (1, 'Teste CPF', '12345678901', 'Endereco Teste', '11987654321');

-- Teste de chave estrangeira para Veiculo (inserir veículo com idCliente inexistente)
-- Deve falhar devido à constraint de chave estrangeira
INSERT INTO Veiculo (idVeiculo, idCliente, PlacaVeiculo)
VALUES (100, 9999, 'ABC1234'); -- Supondo que 9999 não é um idCliente válido

-- Teste de restrição de valores (tentar inserir valor inválido em Autorizacao)
-- Deve falhar se a coluna 'Autorizado' não aceitar o valor fornecido
INSERT INTO Autorizacao (idAutorizacao, Autorizado, idOrdemDeServico)
VALUES (10, NULL, 1); -- Supondo que 'Autorizado' deve ser um booleano não nulo
