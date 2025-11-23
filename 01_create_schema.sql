
---

## `01_create_schema.sql`

```sql
-- Criação do schema do projeto Gui English Class

DROP DATABASE IF EXISTS gui_english_class;
CREATE DATABASE gui_english_class
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE gui_english_class;

-- =========================
-- Tabela EMPRESA
-- =========================

CREATE TABLE EMPRESA (
    id_empresa      INT AUTO_INCREMENT PRIMARY KEY,
    razao_social    VARCHAR(150) NOT NULL,
    cnpj            CHAR(14) NOT NULL UNIQUE,
    email_contato   VARCHAR(100) NOT NULL,
    telefone        VARCHAR(20),
    cidade          VARCHAR(60)
);

-- =========================
-- Tabela PROFESSOR
-- =========================

CREATE TABLE PROFESSOR (
    id_professor        INT AUTO_INCREMENT PRIMARY KEY,
    nome                VARCHAR(150) NOT NULL,
    email               VARCHAR(100) NOT NULL,
    telefone            VARCHAR(20),
    especialidade_nivel VARCHAR(60)
);

-- =========================
-- Tabela COLABORADOR
-- =========================

CREATE TABLE COLABORADOR (
    id_colaborador      INT AUTO_INCREMENT PRIMARY KEY,
    nome                VARCHAR(150) NOT NULL,
    email_profissional  VARCHAR(100) NOT NULL,
    cargo               VARCHAR(60),
    nivel_ingles_inicial VARCHAR(20),
    id_empresa          INT NOT NULL,
    CONSTRAINT fk_colab_empresa
        FOREIGN KEY (id_empresa)
        REFERENCES EMPRESA (id_empresa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =========================
-- Tabela TURMA
-- =========================

CREATE TABLE TURMA (
    id_turma        INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma      VARCHAR(100) NOT NULL,
    nivel           VARCHAR(20) NOT NULL,    -- Básico / Intermediário / Avançado
    modalidade      VARCHAR(20) NOT NULL,    -- Online / Presencial
    dia_semana      VARCHAR(15) NOT NULL,
    horario_inicio  TIME NOT NULL,
    horario_fim     TIME NOT NULL,
    id_professor    INT NOT NULL,
    id_empresa      INT NOT NULL,
    CONSTRAINT fk_turma_professor
        FOREIGN KEY (id_professor)
        REFERENCES PROFESSOR (id_professor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_turma_empresa
        FOREIGN KEY (id_empresa)
        REFERENCES EMPRESA (id_empresa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =========================
-- Tabela MATRICULA
-- =========================

CREATE TABLE MATRICULA (
    id_matricula    INT AUTO_INCREMENT PRIMARY KEY,
    data_matricula  DATE NOT NULL,
    status_matricula VARCHAR(20) NOT NULL, -- Ativa / Trancada / Concluída / Cancelada
    id_colaborador  INT NOT NULL,
    id_turma        INT NOT NULL,
    CONSTRAINT fk_matricula_colab
        FOREIGN KEY (id_colaborador)
        REFERENCES COLABORADOR (id_colaborador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (id_turma)
        REFERENCES TURMA (id_turma)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
