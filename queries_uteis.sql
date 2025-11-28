-- QUERIES OBRIGATÓRIAS PARA AVALIAÇÃO - Sistema de Cursos

-- 1. FUNÇÕES DE AGREGAÇÃO (COUNT, AVG)
-- Calcular a média de todas as NotaFinal registradas e contar o total de alunos com Status 'Concluído'
SELECT 
    ROUND(AVG(NotaFinal), 2) as MediaGeralNotas,
    COUNT(CASE WHEN Status = 'Concluído' THEN 1 END) as TotalAlunosAtivos
FROM Matricula
WHERE NotaFinal IS NOT NULL;

-- 2. AGRUPAMENTO E CONDIÇÃO (GROUP BY e HAVING)
-- Listar a quantidade de alunos matriculados em cada curso, mostrando apenas os cursos que têm mais de 5 alunos matriculados
SELECT 
    c.Titulo as Curso,
    COUNT(m.AlunoID) as QuantidadeAlunos
FROM Curso c
JOIN Turma t ON c.CursoID = t.CursoID
JOIN Matricula m ON t.TurmaID = m.TurmaID
GROUP BY c.CursoID, c.Titulo
HAVING COUNT(m.AlunoID) > 5
ORDER BY QuantidadeAlunos DESC;

-- 3. JUNÇÕES (JOIN)
-- Recuperar o Título do curso, o NomeCompleto do professor e o NomeCompleto do aluno para todas as matrículas ativas
SELECT 
    c.Titulo as TituloCurso,
    p.NomeCompleto as NomeProfessor,
    a.NomeCompleto as NomeAluno,
    m.Status,
    m.DataMatricula
FROM Matricula m
JOIN Aluno a ON m.AlunoID = a.AlunoID
JOIN Turma t ON m.TurmaID = t.TurmaID
JOIN Curso c ON t.CursoID = c.CursoID
JOIN Professor p ON t.ProfessorID = p.ProfessorID
WHERE m.Status IN ('Em Andamento', 'Matriculado')
ORDER BY c.Titulo, a.NomeCompleto;

-- 4. SUBQUERY OU CTE (Common Table Expression)
-- Encontrar o nome dos alunos que têm uma NotaFinal superior à média geral de todas as notas do sistema
WITH MediaGeral AS (
    SELECT AVG(NotaFinal) as MediaSistema
    FROM Matricula
    WHERE NotaFinal IS NOT NULL
)
SELECT DISTINCT
    a.NomeCompleto,
    m.NotaFinal,
    mg.MediaSistema
FROM Aluno a
JOIN Matricula m ON a.AlunoID = m.AlunoID
CROSS JOIN MediaGeral mg
WHERE m.NotaFinal > mg.MediaSistema
ORDER BY m.NotaFinal DESC;

-- 5. ATUALIZAÇÃO CONDICIONAL (UPDATE)
-- Atualizar o Status de 'Em Andamento' para 'Concluído' para todos os alunos cujas turmas terminaram
UPDATE Matricula m
JOIN Turma t ON m.TurmaID = t.TurmaID
SET m.Status = 'Concluído'
WHERE m.Status = 'Em Andamento' 
  AND t.DataFim IS NOT NULL 
  AND t.DataFim < CURDATE();

-- 6. CONSULTAS ADICIONAIS COM INNER JOIN (Critério da dupla)

-- 6.1 INNER JOIN - Relatório de Receita por Professor
-- Mostra quanto cada professor gerou em receita através dos cursos ministrados
SELECT 
    p.NomeCompleto as Professor,
    p.Especialidade,
    COUNT(DISTINCT t.TurmaID) as TotalTurmas,
    COUNT(m.AlunoID) as TotalAlunosMatriculados,
    SUM(c.Valor) as ReceitaTotalGerada
FROM Professor p
INNER JOIN Turma t ON p.ProfessorID = t.ProfessorID
INNER JOIN Curso c ON t.CursoID = c.CursoID
INNER JOIN Matricula m ON t.TurmaID = m.TurmaID
WHERE m.Status IN ('Concluído', 'Em Andamento', 'Matriculado')
GROUP BY p.ProfessorID, p.NomeCompleto, p.Especialidade
ORDER BY ReceitaTotalGerada DESC;

-- 6.2 INNER JOIN - Análise de Performance por Curso
-- Mostra estatísticas de desempenho dos alunos por curso
SELECT 
    c.Titulo as Curso,
    c.CargaHoraria,
    COUNT(m.AlunoID) as TotalMatriculas,
    COUNT(m.NotaFinal) as AlunosComNota,
    ROUND(AVG(m.NotaFinal), 2) as MediaNotasCurso,
    MIN(m.NotaFinal) as MenorNota,
    MAX(m.NotaFinal) as MaiorNota,
    COUNT(CASE WHEN m.NotaFinal >= 7.0 THEN 1 END) as AlunosAprovados
FROM Curso c
INNER JOIN Turma t ON c.CursoID = t.CursoID
INNER JOIN Matricula m ON t.TurmaID = m.TurmaID
WHERE m.NotaFinal IS NOT NULL
GROUP BY c.CursoID, c.Titulo, c.CargaHoraria
ORDER BY MediaNotasCurso DESC;