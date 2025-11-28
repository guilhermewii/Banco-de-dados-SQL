-- Script de criação do banco de dados - Sistema de Cursos
-- Baseado no modelo DBML fornecido

-- Criação do banco de dados
CREATE DATABASE SistemaCursos;
USE SistemaCursos;

-- Tabela Aluno
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY AUTO_INCREMENT,
    NomeCompleto VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DataNascimento DATE,
    Endereco TEXT
);

-- Tabela Professor
CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY AUTO_INCREMENT,
    NomeCompleto VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    Especialidade VARCHAR(255)
);

-- Tabela Curso
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255) UNIQUE NOT NULL,
    CargaHoraria INT,
    Valor DECIMAL(10,2)
);

-- Tabela Turma
CREATE TABLE Turma (
    TurmaID INT PRIMARY KEY AUTO_INCREMENT,
    DataInicio DATE NOT NULL,
    DataFim DATE,
    MaxAlunos INT,
    CursoID INT NOT NULL,
    ProfessorID INT NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

-- Tabela Matricula
CREATE TABLE Matricula (
    AlunoID INT,
    TurmaID INT,
    DataMatricula DATE NOT NULL,
    Status VARCHAR(50),
    NotaFinal DECIMAL(4,2),
    PRIMARY KEY (AlunoID, TurmaID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (TurmaID) REFERENCES Turma(TurmaID)
);

-- Índices adicionais para melhor performance
CREATE INDEX idx_aluno_cpf ON Aluno(CPF);
CREATE INDEX idx_aluno_email ON Aluno(Email);
CREATE INDEX idx_professor_cpf ON Professor(CPF);
CREATE INDEX idx_curso_titulo ON Curso(Titulo);
CREATE INDEX idx_turma_data_inicio ON Turma(DataInicio);
CREATE INDEX idx_matricula_status ON Matricula(Status);