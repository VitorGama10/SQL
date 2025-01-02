                                        /*aplicação de filtros*/
select estado, sum(LIMITE_DE_CREDITO) as soma_limite 
from tabela_de_clientes
group by estado having sum(LIMITE_DE_CREDITO) > 9000;

select * from tabela_de_clientes where CIDADE = 'Rio de Janeiro';

# ENTRE, E                       ONDE                  ENTRE           E 
select * from tabela_de_produtos where PRECO_DE_LISTA BETWEEN 16.0008 AND 17.000;

select * from tabela_de_clientes where idade BETWEEN 18 AND 22;

select * from tabela_de_clientes where (DATA_DE_NASCIMENTO > '1992-01-01') AND (IDADE >= 18 AND IDADE <= 20);


SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR = 'Laranja' OR SABOR = 'Uva') AND (PRECO_DE_LISTA > 3.000)

