-- Inserir dados na tabela Veiculo
INSERT INTO Veiculo (idVeiculo, idCliente, PlacaVeiculo) VALUES
(1, 1, 'ABC1234'),
(2, 2, 'DEF5678'),
(3, 3, 'GHI9012'),
(4, 4, 'JKL3456'),
(5, 5, 'MNO7890');

-- Inserir dados na tabela Conserto
INSERT INTO Conserto (idConserto, Descricao) VALUES
(1, 'Troca de óleo'),
(2, 'Substituição de freios'),
(3, 'Alinhamento e balanceamento'),
(4, 'Revisão elétrica'),
(5, 'Reparo no motor');

-- Inserir dados na tabela Mecanico
INSERT INTO Mecanico (idMecanico, Nome, Endereco, Especialidade) VALUES
(1, 'Pedro Silva', 'Rua A, 123', 'Mecânica Geral'),
(2, 'Ana Costa', 'Rua B, 456', 'Elétrica'),
(3, 'Luiz Moura', 'Rua C, 789', 'Pneumática');

-- Inserir dados na tabela EquipeMecanicos
INSERT INTO EquipeMecanicos (idEquipeMecanicos, idMecanico) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela OrdemDeServico
-- Associando novamente para garantir exemplos com novas ordens de serviço
INSERT INTO OrdemDeServico (idOrdemDeServico, DataDeEmissao, ValorServico, ValorPeca, ValorTotal, Status, DataDeConclusao, idCliente) VALUES
(6, '2023-09-20', 250.00, 100.00, 350.00, 'EM ANDAMENTO', NULL, 1),
(7, '2023-09-21', 150.00, 200.00, 350.00, 'CONCLUIDO', '2023-09-22', 2);

-- Inserir dados na tabela Autorizacao
INSERT INTO Autorizacao (idAutorizacao, Autorizado, idOrdemDeServico) VALUES
(1, TRUE, 6),
(2, FALSE, 7);

-- Inserir dados na tabela Servicos
INSERT INTO Servicos (idServicos, Descricao, Valor) VALUES
(1, 'Limpeza de Ar Condicionado', 80.00),
(2, 'Troca de Óleo', 120.00),
(3, 'Manutenção de Freios', 200.00);
