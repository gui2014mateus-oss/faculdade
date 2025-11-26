USE gui_english_class;

-- 1) Listar todos os colaboradores com a empresa e o nível inicial de inglês

SELECT 
    c.id_colaborador,
    c.nome AS colaborador,
    e.razao_social AS empresa,
    c.nivel_ingles_inicial
FROM COLABORADOR c
JOIN EMPRESA e ON c.id_empresa = e.id_empresa
ORDER BY e.razao_social, c.nome;

-- 2) Listar turmas com professor, empresa e modalidade, ordenando por nível

SELECT
    t.id_turma,
    t.nome_turma,
    t.nivel,
    t.modalidade,
    t.dia_semana,
    t.horario_inicio,
    p.nome AS professor,
    e.razao_social AS empresa
FROM TURMA t
JOIN PROFESSOR p ON t.id_professor = p.id_professor
JOIN EMPRESA e   ON t.id_empresa   = e.id_empresa
ORDER BY t.nivel, t.nome_turma;

-- 3) Consultar apenas matrículas ativas de uma empresa específica (Volk)

SELECT
    m.id_matricula,
    c.nome AS colaborador,
    t.nome_turma,
    m.status_matricula,
    m.data_matricula
FROM MATRICULA m
JOIN COLABORADOR c ON m.id_colaborador = c.id_colaborador
JOIN TURMA t       ON m.id_turma       = t.id_turma
JOIN EMPRESA e     ON c.id_empresa     = e.id_empresa
WHERE e.razao_social LIKE 'Volk%'
  AND m.status_matricula = 'Ativa'
ORDER BY m.data_matricula;

-- 4) Quantidade de colaboradores matriculados por turma (com ORDER BY e LIMIT)

SELECT
    t.id_turma,
    t.nome_turma,
    COUNT(m.id_matricula) AS qtd_matriculas
FROM TURMA t
LEFT JOIN MATRICULA m ON t.id_turma = m.id_turma
GROUP BY t.id_turma, t.nome_turma
ORDER BY qtd_matriculas DESC
LIMIT 5;

-- 5) Buscar colaboradores com nível inicial abaixo da turma em que estão matriculados
-- (exemplo simples: turma Avançado e colaborador com nível != 'Avançado')

SELECT
    c.nome AS colaborador,
    c.nivel_ingles_inicial,
    t.nome_turma,
    t.nivel AS nivel_turma
FROM MATRICULA m
JOIN COLABORADOR c ON m.id_colaborador = c.id_colaborador
JOIN TURMA t       ON m.id_turma       = t.id_turma
WHERE t.nivel = 'Avançado'
  AND c.nivel_ingles_inicial <> 'Avançado';
