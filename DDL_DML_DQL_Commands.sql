CREATE DATABASE SQL_FUNDAMENTS;

USE SQL_FUNDAMENTS;


CREATE TABLE instrumentos(
id_instrumento into auto_increment primary key,
nome VARCHAR(24) NOT NULL,
preco FLOAT NOT NULL,
promocao BOOLEAN);

insert into instrumentos(nome,preco,promocao)values
('violão','199', true),
('bateria','799',false),
('violino','399',false),
('flauta','199', true),
('baixo','399',true),
('guitarra','599',false);

SELECT * 
FROM instrumentos;

SELECT nome, id_instrumento, preco 
FROM instrumentos 
WHERE (preco < 250);


/*----------------------EXERCÍCIOS----------------------/*
/*atributos em_promoção e preco , condição preco  >  400*/
SELECT promocao, preco 
FROM instrumentos 
WHERE (preco  >  400);

/*trazer todos atributos dos registros em que em_promocao seja TRUE*/
SELECT * 
FROM instrumentos 
WHERE (promocao = true);

/* trazer atributos nome e preco em que id_instrumento seja igual a 6 */
SELECT * 
FROM instrumentos 
WHERE id_instrumento = 6 
ORDER BY preco AND nome;

/*trazer atributos id_instrumento, preco e em_promocao dos registros em que nome seja igual a violão*/
SELECT * 
FROM instrumentos 
WHERE nome ='violao' 
ORDER BY id_instrumento, preco AND promocao;
