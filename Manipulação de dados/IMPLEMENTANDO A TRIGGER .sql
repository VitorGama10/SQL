
--- Atualizar a tabela TAB_FATURAMENTO para refletir o faturamento atualizado, agrupado por data de venda.

CREATE TRIGGER TG_TAB_FATURAMENTO
AFTER INSERT ON ITENS_NOTAS
BEGIN -- Marca o início das ações que o trigger executará.

DELETE FROM TAB_FATURAMENTO; --- Sempre que o trigger é executado, ele limpa (DELETE) todos os registros existentes na tabela TAB_FATURAMENTO. Isso garante que os dados anteriores sejam substituídos por uma versão atualizada.
INSERT INTO TAB_FATURAMENTO
SELECT
N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
FROM NOTAS N
INNER JOIN ITENS_NOTAS ITN ---
ON N.NUMERO = ITN.NUMERO
GROUP BY N.DATA_VENDA;

END; --- Marca o fim das ações realizadas pelo trigger.


---  Automatizar o cálculo do faturamento diário.

SELECT * FROM TAB_FATURAMENTO;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('008', TO_DATE('2019-01-04','YYYY-MM-DD'), '1471156710', '235', 0.1);

INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('008', '1040115',11, 11);
