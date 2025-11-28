

USE SistemaCursos;

-- Inserção de dados na tabela Professor
INSERT INTO Professor (NomeCompleto, CPF, Especialidade) VALUES
('Dr. Maria Silva Santos', '123.456.789-01', 'Desenvolvimento Web'),
('Prof. João Carlos Oliveira', '234.567.890-12', 'Data Science'),
('Dra. Ana Paula Costa', '345.678.901-23', 'Mobile Development');

-- Inserção de dados na tabela Curso
INSERT INTO Curso (Titulo, CargaHoraria, Valor) VALUES
('Desenvolvimento Web com React', 80, 1200.00),
('Python para Data Science', 60, 900.00),
('Desenvolvimento Mobile com Flutter', 100, 1500.00),
('JavaScript Avançado', 60, 1000.00);

-- Inserção de dados na tabela Aluno
INSERT INTO Aluno (NomeCompleto, CPF, Email, DataNascimento, Endereco) VALUES
('Ana Beatriz Ferreira', '111.222.333-44', 'ana.ferreira@email.com', '1995-03-15', 'Rua das Flores, 123 - São Paulo, SP'),
('Bruno Costa Lima', '222.333.444-55', 'bruno.lima@email.com', '1992-07-20', 'Av. Paulista, 456 - São Paulo, SP'),
('Carla Mendes Silva', '333.444.555-66', 'carla.silva@email.com', '1990-11-08', 'Rua da Paz, 789 - Rio de Janeiro, RJ'),
('Diego Santos Oliveira', '444.555.666-77', 'diego.oliveira@email.com', '1988-05-12', 'Praça Central, 321 - Belo Horizonte, MG');

-- Inserção de dados na tabela Turma
INSERT INTO Turma (DataInicio, DataFim, MaxAlunos, CursoID, ProfessorID) VALUES
('2024-01-15', '2024-03-15', 25, 1, 1), -- React com Maria Silva
('2024-02-01', '2024-03-30', 20, 2, 2), -- Data Science com João Carlos
('2024-01-08', '2024-04-08', 15, 3, 3), -- Flutter com Ana Paula
('2024-04-01', '2024-05-30', 22, 4, 1); -- JS Avançado com Maria Silva

-- Inserção de dados na tabela Matricula
INSERT INTO Matricula (AlunoID, TurmaID, DataMatricula, Status, NotaFinal) VALUES
-- Turma 1 (React)
(1, 1, '2024-01-10', 'Concluído', 8.5),
(2, 1, '2024-01-11', 'Concluído', 9.2),

-- Turma 2 (Data Science)
(3, 2, '2024-01-25', 'Concluído', 9.5),
(4, 2, '2024-01-26', 'Concluído', 8.7),

-- Turma 3 (Flutter)
(1, 3, '2024-01-05', 'Em Andamento', NULL),
(2, 3, '2024-01-06', 'Em Andamento', NULL),

-- Turma 4 (JS Avançado)
(3, 4, '2024-03-25', 'Matriculado', NULL),
(4, 4, '2024-03-26', 'Matriculado', NULL);