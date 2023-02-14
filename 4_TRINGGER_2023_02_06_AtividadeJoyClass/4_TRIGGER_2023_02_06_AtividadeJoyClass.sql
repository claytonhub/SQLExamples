/*---------------------BASE DE DADOS USANDO PostgreSQL---------------------*/

CREATE DATABASE ESCOLA;

USE ESCOLA;

/*Criar Base de Dados*/
CREATE TABLE alunos (
    id_identificador_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    matric_aluno FLOAT NOT NULL,
    email VARCHAR(40) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone FLOAT NOT NULL
)

CREATE TABLE emprestimos(
    id_identificador_emp SERIAL PRIMARY KEY,
    data_hora TIMESTAMP(0) NOT NULL,
    matric_aluno FLOAT NOT NULL,
    data_devolucao DATE NOT NULL
)

CREATE TABLE livro(
    cod_livro SERIAL PRIMARY KEY,
    titulo VARCHAR (100),
    autor VARCHAR (100),
    cod_sessao FLOAT NOT NULL
)

CREATE TABLE sessao(
    cod_sessao SERIAL PRIMARY KEY,
    descricao VARCHAR (100),
    localizacao VARCHAR (100)
)

CREATE TABLE livro_emprestimos(
    cod_livro FLOAT NOT NULL,
    cod_emprestimo FLOAT NOT NULL
)

CREATE TABLE log (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
)

/*Popular Base de Dados*/
INSERT INTO alunos
(nome, matric_aluno, email, endereco, telefone) 
VALUES
('João Carlos', '1234', 'Jcarlos@gmail.com', 'Rua 13 de maio', '1178254489' ),
('José Victor', '2345', 'Jvictor@gmail.com', 'Rua da Saudade', '1178256589' ),
('Paulo André', '3456', 'Pandr@gmail.com', 'Rua do Sol', '1178254495' )

INSERT INTO emprestimos 
(data_hora, matric_aluno, data_devolucao) 
VALUES
('2022-12-25 13:30:00', '1234', '2022-03-15' ),
('2022-12-25 14:30:00', '3456', '2022-03-18' ),
('2022-12-25 15:30:00', '2345','2022-03-23')

INSERT INTO livro 
(titulo, autor, cod_sessao) 
VALUES
('Modelo Conceitual e Diagramas ER','Pressman, Roger S.', '03' ),
('Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', '01'),
('Livro 3: Linguagem SQL', 'Beighley, Lynn', '02')

INSERT INTO livro_emprestimos
(cod_livro, cod_emprestimo) 
VALUES
('03', '01'),
('01', '03'),
('02', '02')


/*Utilizando JOIN*/
SELECT alunos.nome, alunos.matric_aluno, emprestimos.data_hora, emprestimos.data_devolucao
FROM alunos
INNER JOIN emprestimos ON alunos.matric_aluno = emprestimos.matric_aluno;


/*Utilizando TRIGGER*/
/*INSERT*/
DELIMITER $$
CREATE TRIGGER inselir_alunos
AFTER INSERT
on alunos for EACH ROW
BEGIN
INSERT INTO log (descricao) 
VALUES ('Novo aluno inserido', NEW.alunos);
END$$


CREATE TRIGGER ins_aluno
AFTER INSERT ON alunos
FOR EACH ROW
EXECUTE FUNCTION
BEGIN
INSERT INTO log (descricao) VALUES ('Novo aluno inserido: ' || NEW.nome);
END;


/*SELECT*/
CREATE TRIGGER sel_aluno
AFTER SELECT ON alunos
FOR EACH ROW
EXECUTE FUNCTION
BEGIN
INSERT INTO log (descricao) VALUES ('Aluno selecionado: ' || NEW.nome);
END;


/*DELETE*/
CREATE TRIGGER del_aluno
AFTER DELETE ON alunos
FOR EACH ROW
EXECUTE FUNCTION
BEGIN
INSERT INTO log (descricao) VALUES ('Aluno excluído: ' || OLD.nome);
END;

/*UPDATE*/
CREATE TRIGGER upd_aluno
AFTER UPDATE ON alunos
FOR EACH ROW
EXECUTE FUNCTION
BEGIN
INSERT INTO log (descricao) VALUES ('Aluno atualizado: ' || NEW.nome);
END;