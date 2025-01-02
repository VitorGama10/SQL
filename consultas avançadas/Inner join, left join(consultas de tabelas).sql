SELECT * FROM itens_notas_fiscais;

                                                  /*Consultas de duas tabelas*/

	/*Inner Join -> faturamento total*/
	select year(data_venda), 
	round(sum(QUANTIDADE*PRECO), 2) AS Faturamento
	FROM notas_fiscais A 
	INNER JOIN itens_notas_fiscais B
	ON A.numero = B.numero GROUP BY YEAR(data_venda);


	/*DIFERENÇA entre os preços minimo para o maximo (Percentual) */
	SELECT A.EMBALAGEM, A.PRECO_DE_LISTA, X.PRECO_MAXIMO, 
	((A.PRECO_DE_LISTA / X.PRECO_MAXIMO)-1)*100 AS PERCENTUAL
	FROM tabela_de_produtos A
	INNER JOIN preço_maximo X
	ON A.EMBALAGEM = X.EMBALAGEM;


	/*left join, permite observa que alguns clientes não compraram*/
	SELECT DISTINCT A.CPF, A.NOME, B.CPF
	FROM tabela_de_clientes A
	LEFT JOIN notas_fiscais B ON A.CPF = B.CPF;