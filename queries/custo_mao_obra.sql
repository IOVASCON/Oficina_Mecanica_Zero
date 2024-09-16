-- Consulta para calcular o custo de mão de obra como uma porcentagem do valor total da ordem de serviço
SELECT idOrdemDeServico, DataDeEmissao, ValorServico, ValorTotal, 
       CONCAT(ROUND((ValorServico / ValorTotal) * 100, 2), '%') AS PercentualMaoDeObra
FROM OrdemDeServico;
