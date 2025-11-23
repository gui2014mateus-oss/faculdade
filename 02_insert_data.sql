USE gui_english_class;

-- =========================
-- Dados da tabela EMPRESA
-- =========================

INSERT INTO EMPRESA (id_empresa, razao_social, cnpj, email_contato, telefone, cidade) VALUES
(1, 'Volk do Brasil Equipamentos de Proteção Ltda', '12345678000199', 'treinamentos@volk.com.br', '(41)3333-1000', 'Curitiba'),
(2, 'TechLog Logística Integrada S.A.',             '22345678000199', 'rh@techlog.com.br',         '(11)4000-9000', 'São Paulo'),
(3, 'HealthCare Clínicas Integradas Ltda',          '32345678000199', 'contato@healthcare.com.br', '(41)3555-7788', 'Curitiba');

-- =========================
-- Dados da tabela PROFESSOR
-- =========================

INSERT INTO PROFESSOR (id_professor, nome, email, telefone, especialidade_nivel) VALUES
(1, 'Guilherme Ramos', 'gui.ramos@englishclass.com', '(41)99999-1001', 'Business English - Intermediário/Avançado'),
(2, 'Ana Duarte',      'ana.duarte@englishclass.com','(41)99999-1002', 'Inglês Geral - Básico/Intermediário'),
(3, 'John Miller',     'john.miller@englishclass.com','(41)99999-1003','Conversação - Avançado');

-- =========================
-- Dados da tabela COLABORADOR
-- =========================

INSERT INTO COLABORADOR (id_colaborador, nome, email_profissional, cargo, nivel_ingles_inicial, id_empresa) VALUES
(1, 'Marcos Silva',      'marcos.silva@volk.com.br',     'Analista de TI',           'Básico',        1),
(2, 'Juliana Souza',     'juliana.souza@volk.com.br',    'Coordenadora de RH',       'Intermediário', 1),
(3, 'Carlos Pereira',    'carlos.pereira@techlog.com.br','Supervisor de Operações',  'Básico',        2),
(4, 'Fernanda Oliveira', 'fernanda.oliveira@health.com','Enfermeira',               'Intermediário', 3),
(5, 'Roberto Lima',      'roberto.lima@techlog.com.br',  'Gerente de Projetos',      'Avançado',      2);

-- =========================
-- Dados da tabela TURMA
-- =========================

INSERT INTO TURMA (id_turma, nome_turma, nivel, modalidade, dia_semana, horario_inicio, horario_fim, id_professor, id_empresa) VALUES
(1, 'Volk - Inglês Básico Manhã',        'Básico',        'Presencial', 'Terça',   '09:00:00', '10:30:00', 2, 1),
(2, 'TechLog - Business English Night',  'Intermediário', 'Online',     'Quinta',  '19:30:00', '21:00:00', 1, 2),
(3, 'HealthCare - Conversação Avançada', 'Avançado',      'Online',     'Quarta',  '18:00:00', '19:30:00', 3, 3);

-- =========================
-- Dados da tabela MATRICULA
-- =========================

INSERT INTO MATRICULA (id_matricula, data_matricula, status_matricula, id_colaborador, id_turma) VALUES
(1, '2025-02-10', 'Ativa',       1, 1), -- Marcos na turma básica da Volk
(2, '2025-02-10', 'Ativa',       2, 2), -- Juliana no Business English
(3, '2025-02-15', 'Ativa',       3, 2), -- Carlos no Business English
(4, '2025-02-20', 'Ativa',       4, 3), -- Fernanda na conversação avançada
(5, '2025-02-25', 'Ativa',       5, 2), -- Roberto no Business English
(6, '2025-03-01', 'Trancada',    1, 2); -- Marcos tentou segunda turma e trancou
