-- Migration v1: Adiciona tabelas e modificações necessárias

-- 1. Adicionar nova tabela para registrar informações de pagamentos
CREATE TABLE IF NOT EXISTS Pagamentos (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idOrdemDeServico INT,
    valorPago DECIMAL(10, 2),
    dataPagamento DATE,
    metodoPagamento VARCHAR(50),
    FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico)
);

-- 2. Adicionar coluna de email na tabela Cliente
ALTER TABLE Cliente
ADD COLUMN email VARCHAR(255);

-- 3. Modificar o tamanho da coluna 'Descricao' na tabela Conserto
ALTER TABLE Conserto
MODIFY COLUMN Descricao VARCHAR(255);

-- 4. Adicionar índice para melhorar a performance das consultas na tabela Veiculo
CREATE INDEX idx_placa ON Veiculo (PlacaVeiculo);

-- 5. Adicionar restrição UNIQUE para CPF em PessoaFisica para garantir valores únicos
ALTER TABLE PessoaFisica
ADD CONSTRAINT uc_CPF UNIQUE (CPF);

-- 6. Atualizar dados específicos (exemplo genérico)
UPDATE Cliente SET email = 'info@clientedefault.com' WHERE email IS NULL;

-- 7. Criar uma trigger para auditar mudanças em OrdemDeServico
DELIMITER $$
CREATE TRIGGER after_ordemdeservico_update
AFTER UPDATE ON OrdemDeServico
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaOrdemDeServico (ordemDeServicoId, dataAlteracao, statusAntigo, statusNovo)
    VALUES (OLD.idOrdemDeServico, NOW(), OLD.Status, NEW.Status);
END$$
DELIMITER ;

-- 8. Adicionar procedimento para calcular o total de vendas
DELIMITER $$
CREATE PROCEDURE CalcularTotalVendas(OUT totalVendas DECIMAL(10,2))
BEGIN
    SELECT SUM(ValorTotal) INTO totalVendas FROM OrdemDeServico;
END$$
DELIMITER ;
