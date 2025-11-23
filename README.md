# Gui English Class - Banco de Dados

Projeto de banco de dados relacional para o sistema **Gui English Class**, utilizado nas Experiências Práticas de Modelagem de Banco de Dados.

## Tecnologias

- SGBD: MySQL 8+
- Ferramenta: MySQL Workbench (pode ser adaptado para outros clientes SQL)

## Estrutura do repositório

- `01_create_schema.sql`  
  Cria o banco de dados, as tabelas e as chaves primárias/estrangeiras.

- `02_insert_data.sql`  
  Insere dados de exemplo nas tabelas EMPRESA, PROFESSOR, COLABORADOR, TURMA e MATRICULA.

- `03_select_queries.sql`  
  Contém consultas de exemplo usando `SELECT`, `WHERE`, `ORDER BY`, `JOIN`, `LIMIT` e agregações.

- `04_update_delete.sql`  
  Contém exemplos de `UPDATE` e `DELETE` com condições, respeitando integridade referencial.

## Como executar

1. Criar o banco e as tabelas:

   ```sql
   SOURCE 01_create_schema.sql;
