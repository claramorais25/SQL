-- Criando o banco de dados
CREATE DATABASE anafit;

-- Criando a primeira tabela
CREATE TABLE cliente (
cpf BIGINT PRIMARY KEY,
primeironome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
datanasc DATE NOT NULL,
peso DECIMAL(5,2),
altura FLOAT,
whatsapp VARCHAR(15) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
rua VARCHAR(100) NOT NULL,
numero INT(6) NOT NULL,
complemento VARCHAR(100),
cep VARCHAR(8) NOT NULL
);

-- Inserindo dados na tabela de cliente
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES(12345678910, "Ana Claudia", "Cunha", "1989-09-17", 63.50, 1.73, "+5511989898989", "ana.cscunha1@senacsp.edu.br", "Rua Dr Antonio Bento", 393, "", "04750000");

-- Crie a tabela treino
CREATE TABLE treino(
diadasemana DATE NOT NULL,
horario TIME NOT NULL,
tipo VARCHAR(50) NOT NULL
);

--Inserindo dois dados ao mesmo tempo na tabela de treino
INSERT INTO treino(diadasemana, horario, tipo)
VALUES("2025-03-12", "08:00:00", "Musculação"),
("2025-03-13", "18:00:00", "Corrida");

--Deletando um dado/registro específico na tabela
DELETE FROM treino WHERE tipo = "Corrida";


--Deletando TODOS os registros da tabela
DELETE FROM treino;

-- DELETAR UMA TABELA
DROP TABLE treino;

DROP TABLE cliente;

-- DELETANDO UM BANCO DE DADOS
DROP DATABASE anafit;
