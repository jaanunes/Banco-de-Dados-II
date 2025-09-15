CREATE DATABASE universidade;
USE universidade;

CREATE TABLE aluno (
  id_aluno INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  PRIMARY KEY (id_aluno)
);

CREATE TABLE curso (
  id_curso INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  carga_horaria INT NOT NULL,
  PRIMARY KEY (id_curso)
);

CREATE TABLE matricula (
  id_matricula INT NOT NULL AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE,
  PRIMARY KEY (id_matricula),
  FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno),
  FOREIGN KEY (id_curso) REFERENCES curso (id_curso)
);


CREATE TABLE disciplina (
  id_disciplina INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  carga_horaria INT NOT NULL,
  PRIMARY KEY (id_disciplina)
);


CREATE TABLE matricula_disciplina (
  id_matricula_disciplina INT NOT NULL AUTO_INCREMENT,
  id_matricula INT NOT NULL,
  id_disciplina INT NOT NULL,
  nota DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (id_matricula_disciplina),
  FOREIGN KEY (id_matricula) REFERENCES matricula (id_matricula),
  FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina)
);


INSERT INTO aluno (nome, cpf, data_nascimento, sexo)
VALUES
('João da Silva', '123.456.789-00', '1990-01-01', 'M'),
('Maria da Costa', '987.654.321-00', '1991-02-02', 'F'),
('Pedro dos Santos', '098.765.432-10', '1992-03-03', 'M');


INSERT INTO curso (nome, carga_horaria)
VALUES
('Ciência da Computação', 2400),
('Engenharia de Software', 2800),
('Administração', 2200);


INSERT INTO matricula (id_aluno, id_curso, data_inicio, data_fim)
VALUES
(1, 1, '2023-08-01', NULL),
(2, 2, '2023-08-01', NULL),
(3, 3, '2023-08-01', NULL);


INSERT INTO disciplina (nome, carga_horaria)
VALUES
('Algoritmos e Estruturas de Dados', 60),
('Programação Orientada a Objetos', 60),
('Bancos de Dados', 60),
('SO', 15);


INSERT INTO matricula_disciplina (id_matricula, id_disciplina, nota)
VALUES
(1, 1, 8.0),
(2, 1, 9.0),
(3, 1, 7.5),
(1, 2, 6.0),
(2, 2, 4.0),
(3, 2, 7.5),
(1, 3, 7.0),
(2, 3, 2.0),
(3, 3, 10);

INSERT INTO aluno (nome, cpf, data_nascimento, sexo) VALUES
('Ana Souza', '111.222.333-44', '1993-04-04', 'F'),
('Carlos Pereira', '555.666.777-88', '1994-05-05', 'M');

INSERT INTO curso (nome, carga_horaria) VALUES
('Sistemas de Informação', 2500),
('Engenharia de Computação', 3000);

INSERT INTO matricula (id_aluno, id_curso, data_inicio, data_fim) VALUES
(4, 4, '2024-01-01', NULL),
(5, 5, '2024-01-01', NULL);

INSERT INTO disciplina (nome, carga_horaria) VALUES
('Redes de Computadores', 80),
('Engenharia de Software', 70);

INSERT INTO matricula_disciplina (id_matricula, id_disciplina, nota) VALUES
(4, 4, 8.5),
(5, 4, 7.0),
(4, 5, 9.0),
(5, 5, 6.5);

-- 1
SELECT nome, cpf, data_nascimento FROM aluno;

-- 2
SELECT nome, cpf, sexo FROM aluno
WHERE data_nascimento > '1990-12-31';

-- 3
SELECT nome FROM curso
ORDER BY carga_horaria DESC
LIMIT 1;

-- 4 erro
DELETE FROM disciplina
WHERE carga_horaria < 20;

-- 5 
SELECT m.id_aluno FROM matricula_disciplina md
JOIN matricula m ON md.id_matricula = m.id_matricula
JOIN disciplina d ON md.id_disciplina = d.id_disciplina
WHERE d.nome = 'Programação Orientada a Objetos'
ORDER BY md.nota ASC
LIMIT 1;

-- 6
SELECT m.id_aluno FROM matricula m
JOIN curso c ON m.id_curso = c.id_curso
WHERE c.carga_horaria > 2400;

-- 7
SELECT a.nome AS aluno, c.nome AS curso, c.carga_horaria FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN curso c ON m.id_curso = c.id_curso;

-- 8 erro
UPDATE curso SET carga_horaria = 300
WHERE nome = 'Administração';

-- 9 
SELECT DISTINCT d.nome FROM disciplina d
JOIN matricula_disciplina md ON d.id_disciplina = md.id_disciplina
WHERE md.nota < 5;

-- 10
SELECT a.nome FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN curso c ON m.id_curso = c.id_curso
WHERE c.nome = 'Ciência da Computação';

-- 11
SELECT a.nome AS aluno, c.nome AS curso FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN curso c ON m.id_curso = c.id_curso;

-- 12
SELECT DISTINCT d.nome AS disciplina, c.nome AS curso FROM disciplina d
JOIN matricula_disciplina md ON d.id_disciplina = md.id_disciplina
JOIN matricula m ON md.id_matricula = m.id_matricula
JOIN curso c ON m.id_curso = c.id_curso;


