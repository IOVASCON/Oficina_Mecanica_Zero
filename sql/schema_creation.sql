-- Criação da tabela PessoaFisica para armazenar informações sobre pessoas físicas
CREATE TABLE PessoaFisica (
    idPessoaFisica INT PRIMARY KEY, -- Chave primária, identificador único para cada pessoa física
    Nome VARCHAR(45), -- Nome da pessoa física
    CPF CHAR(11), -- CPF da pessoa física
    Endereco VARCHAR(45), -- Endereço da pessoa física
    Contato CHAR(11) -- Contato telefônico da pessoa física
);

-- Criação da tabela PessoaJuridica para armazenar informações sobre pessoas jurídicas
CREATE TABLE PessoaJuridica (
    idPessoaJuridica INT PRIMARY KEY, -- Chave primária, identificador único para cada pessoa jurídica
    RazaoSocial VARCHAR(45), -- Razão social da empresa
    CNPJ CHAR(14), -- CNPJ da empresa
    Endereco VARCHAR(45), -- Endereço da empresa
    Contato CHAR(11) -- Contato telefônico da empresa
);

-- Criação da tabela Cliente que pode ser uma pessoa física ou jurídica
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY, -- Chave primária, identificador único para cada cliente
    idPessoaFisica INT, -- Chave estrangeira que referencia PessoaFisica
    idPessoaJuridica INT, -- Chave estrangeira que referencia PessoaJuridica
    FOREIGN KEY (idPessoaFisica) REFERENCES PessoaFisica(idPessoaFisica), -- Relacionamento com a tabela PessoaFisica
    FOREIGN KEY (idPessoaJuridica) REFERENCES PessoaJuridica(idPessoaJuridica) -- Relacionamento com a tabela PessoaJuridica
);

-- Criação da tabela Veiculo associada aos clientes
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY, -- Chave primária, identificador único para cada veículo
    idCliente INT, -- Chave estrangeira que referencia Cliente
    PlacaVeiculo CHAR(7), -- Placa do veículo
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) -- Relacionamento com a tabela Cliente
);

-- Criação da tabela Conserto para armazenar tipos de consertos que podem ser realizados
CREATE TABLE Conserto (
    idConserto INT PRIMARY KEY, -- Chave primária, identificador único para cada tipo de conserto
    Descricao VARCHAR(45) -- Descrição do conserto
);

-- Criação da tabela Revisao para armazenar tipos de revisões que podem ser realizadas
CREATE TABLE Revisao (
    idRevisao INT PRIMARY KEY, -- Chave primária, identificador único para cada tipo de revisão
    Descricao VARCHAR(45) -- Descrição da revisão
);

-- Criação da tabela Mecanico para armazenar dados dos mecânicos
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY, -- Chave primária, identificador único para cada mecânico
    Nome VARCHAR(45), -- Nome do mecânico
    Endereco VARCHAR(45), -- Endereço do mecânico
    Especialidade VARCHAR(45) -- Especialidade do mecânico
);

-- Criação da tabela EquipeMecanicos para associar mecânicos a equipes
CREATE TABLE EquipeMecanicos (
    idEquipeMecanicos INT PRIMARY KEY, -- Chave primária, identificador único para cada equipe de mecânicos
    idMecanico INT, -- Chave estrangeira que referencia Mecanico
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico) -- Relacionamento com a tabela Mecanico
);

-- Criação da tabela OrdemDeServico para registrar ordens de serviço
CREATE TABLE OrdemDeServico (
    idOrdemDeServico INT PRIMARY KEY, -- Chave primária, identificador único para cada ordem de serviço
    DataDeEmissao DATE, -- Data de emissão da ordem de serviço
    ValorServico FLOAT, -- Valor dos serviços realizados
    ValorPeca FLOAT, -- Valor das peças usadas
    ValorTotal FLOAT, -- Valor total da ordem de serviço
    Status VARCHAR(45), -- Status da ordem de serviço
    DataDeConclusao DATE, -- Data de conclusão da ordem de serviço
    idCliente INT, -- Chave estrangeira que referencia Cliente
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) -- Relacionamento com a tabela Cliente
);

-- Criação da tabela Pecas para armazenar informações sobre peças
CREATE TABLE Pecas (
    idPecas INT PRIMARY KEY, -- Chave primária, identificador único para cada peça
    Descricao VARCHAR(45), -- Descrição da peça
    Valor FLOAT -- Valor da peça
);

-- Criação da tabela OSTemPecas para relacionar ordens de serviço com peças usadas
CREATE TABLE OSTemPecas (
    idOrdemDeServico INT, -- Chave estrangeira que referencia OrdemDeServico
    idPecas INT, -- Chave estrangeira que referencia Pecas
    FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico), -- Relacionamento com a tabela OrdemDeServico
    FOREIGN KEY (idPecas) REFERENCES Pecas(idPecas), -- Relacionamento com a tabela Pecas
    PRIMARY KEY (idOrdemDeServico, idPecas) -- Chave primária composta por idOrdemDeServico e idPecas
);

-- Criação da tabela Servicos para armazenar informações sobre serviços oferecidos
CREATE TABLE Servicos (
    idServicos INT PRIMARY KEY, -- Chave primária, identificador único para cada serviço
    Descricao VARCHAR(45), -- Descrição do serviço
    Valor FLOAT -- Valor do serviço
);

-- Criação da tabela OSTemServicos para relacionar ordens de serviço com serviços realizados
CREATE TABLE OSTemServicos (
    idOrdemDeServico INT, -- Chave estrangeira que referencia OrdemDeServico
    idServicos INT, -- Chave estrangeira que referencia Servicos
    FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico), -- Relacionamento com a tabela OrdemDeServico
    FOREIGN KEY (idServicos) REFERENCES Servicos(idServicos), -- Relacionamento com a tabela Servicos
    PRIMARY KEY (idOrdemDeServico, idServicos) -- Chave primária composta por idOrdemDeServico e idServicos
);

-- Criação da tabela TabelaReferenciaPrecos para armazenar referências de preços de serviços
CREATE TABLE TabelaReferenciaPrecos (
    idTabelaReferencia INT PRIMARY KEY, -- Chave primária, identificador único para cada tabela de referência de preços
    idOrdemDeServico INT, -- Chave estrangeira que referencia OrdemDeServico
    ValorReferencia FLOAT, -- Valor de referência para o serviço
    FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico) -- Relacionamento com a tabela OrdemDeServico
);

-- Criação da tabela Autorizacao para registrar se uma ordem de serviço está autorizada
CREATE TABLE Autorizacao (
    idAutorizacao INT PRIMARY KEY,  -- Chave primária, identificador único para cada autorização
    Autorizado BOOLEAN,             -- Campo que indica se a ordem de serviço foi autorizada
    idOrdemDeServico INT,           -- Chave estrangeira que referencia OrdemDeServico
    FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico) -- Relacionamento com a tabela OrdemDeServico
);
