USE gui_english_class;

-- =========================
-- COMANDOS UPDATE
-- =========================

-- 1) Atualizar o nível inicial de inglês de Marcos Silva de 'Básico' para 'Intermediário'

UPDATE COLABORADOR
SET nivel_ingles_inicial = 'Intermediário'
WHERE nome = 'Marcos Silva';

-- 2) Atualizar o status de uma matrícula de 'Trancada' para 'Ativa'

UPDATE MATRICULA
SET status_matricula = 'Ativa'
WHERE id_matricula = 6;

-- 3) Atualizar o e-mail de contato da empresa TechLog

UPDATE EMPRESA
SET email_contato = 'treinamentos@techlog.com.br'
WHERE razao_social LIKE 'TechLog%';


-- =========================
-- COMANDOS DELETE
-- =========================
-- Obs: sempre apagar primeiro registros filhos (MATRICULA) para não violar FKs.

-- 1) Remover uma matrícula específica (exemplo: id_matricula = 6)

DELETE FROM MATRICULA
WHERE id_matricula = 6;

-- 2) Remover todas as matrículas de um colaborador que saiu do programa

DELETE FROM MATRICULA
WHERE id_colaborador = 3;  -- Carlos Pereira

-- 3) Remover o colaborador Carlos Pereira após remover as matrículas dele

DELETE FROM COLABORADOR
WHERE id_colaborador = 3;
