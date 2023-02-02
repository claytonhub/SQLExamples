CREATE DATABASE ESCOLA;

USE ESCOLA;

/*Criar Base de Dados*/
CREATE TABLE alunos(
    id_identificador_aluno INTO AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    matric_aluno FLOAT NOT NULL,
    e-mail VARCHAR (40) NOT NULL,
    endereco VARCHAR (100) NOT NULL,
    telefone FLOAT NOT NULL,
);

CREATE TABLE emprestimos(
    id_identificador_emp INTO AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    matric_aluno FLOAT NOT NULL,
    data_devolucao DATE NOT NULL,
);

CREATE TABLE livro(
    cod_livro FLOAT NOT NULL PRIMARY KEY,
    titulo VARCHAR (100),
    autor VARCHAR (100),
    cod_sessao FLOAT PRIMARY KEY,
);

CREATE TABLE sessao(
    cod_sessao FLOAT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR (100),
    localizacao VARCHAR (100),
);
CREATE TABLE livro_emprestimos(
    cod_livro FLOAT NOT NULL PRIMARY KEY,
    cod_emprestimo FLOAT NOT NULL PRIMARY KEY,
);

/*Popular Base de Dados*/
INSERT INTO alunos(nome, matric_aluno, e-mail, endereco, telefone) VALUES
    ('João Carlos', '1234', 'Jcarlos@gmail.com', 'Rua 13 de maio', '1178254489' ),
    ('José Victor', '2345', 'Jvictor@gmail.com', 'Rua da Saudade', '1178256589' ),
    ('Paulo André', '3456', 'Pandr@gmail.com', 'Rua do Sol', '1178254495' );

INSERT INTO emprestimos (data_hora, matric_aluno, data_devolucao) VALUES
    ('12032022 15:25', '1234', '15032022' ),
    ('15032022 14:32', '3456', '18032022' ),
    ('20032022 03:51', '2345','23032022');

INSERT INTO livro (titulo, autor, cod_sessao) VALUES
    ('Modelo Conceitual e Diagramas ER','Pressman, Roger S.', '03' ),
    ('Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', '01'),
    ('Livro 3: Linguagem SQL', 'Beighley, Lynn', '02');

INSERT INTO livro_emprestimos(cod_livro, cod_emprestimo) VALUES
    ('03', '01'),
    ('01', '03'),
    ('02', '02');
