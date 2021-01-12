-- Respostas


-- 1� Com base no modelo acima, escreva um comando SQL que liste a quantidade de processos 
-- por Status com sua descri��o.

SELECT 
	 S.dsStatus,
	 COUNT(*) AS Quantidade
FROM tb_Status AS S INNER JOIN  tb_Processo AS P ON
	S.idStatus = P.idStatus
GROUP BY 
	S.dsStatus
	
	
-- 2�  Com base no modelo acima, construa um comando SQL que liste a maior data de andamento 
-- por n�mero de processo, com processos encerrados no ano de 2013.

SELECT 
	 TOP(1) A.dtAndamento
FROM tb_Processo AS P INNER JOIN tb_Andamento AS A ON
	P.idProcesso = A.idProcesso
WHERE
	YEAR(P.DtEncerramento) = 2013
ORDER BY 
	A.dtAndamento DESC
	
-- 3� Com base no modelo acima, construa um comando SQL que liste a quantidade de Data de -- Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.SELECT  	DtEncerramento, COUNT(*) AS QuantidadeFROM 	tb_ProcessoGROUP BY	DtEncerramentoHAVING COUNT(DtEncerramento) > 5-- 4� Possu�mos um n�mero de identifica��o do processo, onde o mesmo cont�m 12 caracteres
-- com zero � esquerda, contudo nosso modelo e dados ele � apresentado como bigint. Como
-- fazer para apresenta-lo com 12 caracteres considerando os zeros a esquerda?

SELECT ISNULL(REPLICATE(0, (12 - LEN(nroProcesso))), '') + CAST(nroProcesso AS NVARCHAR) FROM tb_Processo

