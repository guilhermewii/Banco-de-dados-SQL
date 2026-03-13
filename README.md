# Sistema de Cursos - Banco de Dados

## Ambiente de Desenvolvimento

### Editor e Extensões
Desenvolvi este projeto usando VS Code com as seguintes extensões que facilitaram bastante o trabalho:

- **MySQL** - Para conexão direta com o banco e execução das queries
- **SQL Tools** - Syntax highlighting e formatação automática dos scripts SQL
- **Database Client** - Interface visual para navegar pelas tabelas e dados
- **Auto Rename Tag** - Ajuda na edição dos comentários em HTML quando documento consultas
- **Bracket Pair Colorizer** - Para identificar melhor os blocos de código SQL

### Configuração do Banco
- **SGBD**: MySQL 8.0
- **Charset**: utf8mb4_unicode_ci
- **Motor**: InnoDB

## Scripts Disponíveis

### create_database.sql
Cria toda a estrutura do banco com as 5 tabelas principais e seus relacionamentos.

### insert_sample_data.sql  
Popula o banco com dados de teste básicos - alguns professores, cursos, alunos e matrículas.

### queries_uteis.sql
Contém as consultas que mais uso no dia a dia para relatórios e consultas específicas.

## Como executar

Execute os scripts na ordem:
```bash
mysql -u root -p < create_database.sql
mysql -u root -p < insert_sample_data.sql
```

Depois pode testar com as queries do arquivo `queries_uteis.sql`.

## Estrutura simples

O banco tem 5 tabelas principais que se relacionam de forma bem direta:
- Professores ministram cursos em turmas específicas
- Alunos se matriculam nessas turmas
- Cada matrícula tem status e nota final (quando aplicável)
