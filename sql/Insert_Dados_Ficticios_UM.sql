-- Inserir dados na tabela PessoaFisica
INSERT INTO PessoaFisica (idPessoaFisica, Nome, CPF, Endereco, Contato) VALUES
(1, 'João Silva', '12345678901', 'Rua das Flores 123', '11987654321'),
(2, 'Maria Oliveira', '23456789012', 'Avenida Brasil 456', '11987654322'),
(3, 'Carlos Pereira', '34567890123', 'Rua das Laranjeiras 789', '11987654323');

-- Inserir dados na tabela PessoaJuridica
INSERT INTO PessoaJuridica (idPessoaJuridica, RazaoSocial, CNPJ, Endereco, Contato) VALUES
(1, 'Empresa X', '11223344000101', 'Rua Principal 100', '1133445566'),
(2, 'Companhia Y', '22334455000102', 'Avenida Secundária 200', '1133445567');

-- Inserir dados na tabela Cliente
-- Associando clientes as pessoas fisicas e juridicas criadas
INSERT INTO Cliente (idCliente, idPessoaFisica, idPessoaJuridica) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, NULL, 1),
(5, NULL, 2);

-- Inserir dados na tabela OrdemDeServico
-- Associando ordens de serviço aos clientes
INSERT INTO OrdemDeServico (idOrdemDeServico, DataDeEmissao, ValorServico, ValorPeca, ValorTotal, Status, DataDeConclusao, idCliente) VALUES
(1, '2023-01-10', 200.00, 100.00, 300.00, 'EM ANDAMENTO', NULL, 1),
(2, '2023-01-11', 150.00, 50.00, 200.00, 'CONCLUIDO', '2023-01-12', 2),
(3, '2023-01-12', 300.00, 150.00, 450.00, 'EM ANDAMENTO', NULL, 3),
(4, '2023-01-13', 400.00, 200.00, 600.00, 'CONCLUIDO', '2023-01-14', 4),
(5, '2023-01-14', 500.00, 250.00, 750.00, 'EM ANDAMENTO', NULL, 5);
