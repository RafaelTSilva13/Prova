-- Respostas


-- 1º Com base no modelo acima, escreva um comando SQL que liste a quantidade de processos 
-- por Status com sua descrição.

SELECT 
	 S.dsStatus,
	 COUNT(*) AS Quantidade
FROM tb_Status AS S INNER JOIN  tb_Processo AS P ON
	S.idStatus = P.idStatus
GROUP BY 
	S.dsStatus
	
	
-- 2º  Com base no modelo acima, construa um comando SQL que liste a maior data de andamento 
-- por número de processo, com processos encerrados no ano de 2013.

SELECT 
	 TOP(1) A.dtAndamento
FROM tb_Processo AS P INNER JOIN tb_Andamento AS A ON
	P.idProcesso = A.idProcesso
WHERE
	YEAR(P.DtEncerramento) = 2013
ORDER BY 
	A.dtAndamento DESC
	
-- 3º Com base no modelo acima, construa um comando SQL que liste a quantidade de Data de -- Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.SELECT  	DtEncerramento, COUNT(*) AS QuantidadeFROM 	tb_ProcessoGROUP BY	DtEncerramentoHAVING COUNT(DtEncerramento) > 5-- 4º Possuímos um número de identificação do processo, onde o mesmo contém 12 caracteres
-- com zero à esquerda, contudo nosso modelo e dados ele é apresentado como bigint. Como
-- fazer para apresenta-lo com 12 caracteres considerando os zeros a esquerda?

SELECT ISNULL(REPLICATE(0, (12 - LEN(nroProcesso))), '') + CAST(nroProcesso AS NVARCHAR) FROM tb_Processo

