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

--Criando novos registro
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES
(12345678911, "João", "Silva", "1990-05-15", 72.30, 1.80, "+5511998765432", "joao.silva@email.com", "Rua das Flores", 120, "Apt 301", "01234000"),
(12345678912, "Maria", "Oliveira", "1985-10-22", 58.00, 1.65, "+5511987654321", "maria.oliveira@email.com", "Avenida Paulista", 1000, "Bloco B", "01310000"),
(12345678913, "Carlos", "Pereira", "1995-07-30", 85.50, 1.90, "+5511987432123", "carlos.pereira@email.com", "Rua dos Três Corações", 350, "", "01453000"),
(12345678914, "Beatriz", "Santos", "2000-02-10", 50.70, 1.70, "+5511976543210", "beatriz.santos@email.com", "Rua da Paz", 555, "Sala 502", "02540000"),
(12345678915, "Lucas", "Santos", "1992-11-05", 77.40, 1.78, "+5511998764321", "lucas.costa@email.com", "Praça da Liberdade", 300, "", "03120000");

--Criando uma nova tabela para pagamento 
CREATE TABLE pagamento(
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL(5,2) NOT NULL,
data_pagamento DATE NOT NULL,
cpf BIGINT, 
FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

--Inserindo registros para pagamento
INSERT INTO pagamento(valor, data_pagamento, cpf)
VALUES
(150.00, "2025-03-01", 12345678911), -- Pagamento de João
(200.00, "2025-03-05", 12345678912), -- Pagamento de Maria
(300.00, "2025-03-10", 12345678913), -- Pagamento de Carlos
(250.00, "2025-03-02", 12345678911), -- Outro pagamento de João
(100.00, "2025-03-03", 12345678915); -- Pagamento de Lucas

--Alterar registros de uma linha
UPDATE treino
SET diadasemana = "2025-03-14"
WHERE tipo = "Musculação" AND diadasemana = "2025-03-12";

--Alterar registro em duas linhas ao mesmo tempo
UPDATE treino
SET horario = "15:00:00"
WHERE horario IN ("08:00:00", "18:00:00");

--Alterando dos registros diferents na tabela
UPDATE cliente
SET peso = 66.50, datanasc = "2000-09-17"
WHERE cpf = 12345678910;

--Read - Selecionando todos os dados da tabela
SELECT * FROM treino;

--Selecionando apenas uma coluna e mostrando os dados dela
SELECT * FROM treino;

--Selecionando duas colunas ao mesmo tempo 
SELECT diadasemana, horario FROM TREINO;

--Selecionando valores entre dois dados
SELECT * FROM cliente
WHERE datanasc BETWEEN "1992-01-01" AND "2000-12-31";

SELECT * FROM cliente
WHERE peso BETWEEN 66 AND 100;

SELECT * FROM cliente
WHERE peso = 66.50 OR peso = 100;

--Somar todos os pesos do registro
SELECT SUM(peso) AS soma_peso FROM cliente;

--Contar quantos registros eu tenho na tabela de clientes
SELECT COUNT(*) AS total_registros FROM cliente;

--Selecionando alturas maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78;

SELECT * FROM cliente
WHERE altura < 1.70;

--Combinando maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78 OR altura < 1.70;

--Selecionando um dado na tabela que contenha a letra "a"
SELECT * FROM cliente
WHERE primeironome LIKE '%a%';

--Selecionando um dado exato na tabela
SELECT * FROM cliente
WHERE primeironome LIKE '%Ana Claudia%';

--Selecionando duas colunas na tabela que contenha a letra "a" e "s"
SELECT * FROM cliente
WHERE primeironome LIKE '%a%' AND sobrenome LIKE '%s%';

--Selecionando duas colunas na tabela com dado exato
SELECT * FROM cliente
WHERE primeironome LIKE '%Carlos%' AND sobrenomeLIKE '%Pereira%';

--Selecione um dado que contenha um valor com casa decimal
SELECT * FROM pagamento
WHERE CAST(valor AS CHAR) LIKE '%150.00%';

--Selecionando pagamentos cujo valor contenha 00
SELECT * FROM pagamento
WHERE CAST(valor AS CHAR) LIKE '%00';

--Inner Join (Select com chave estrageira)
SELECT
  c.cpf,
  c.primeironome,
  c.sobrenome,
  p.valor,
  p.data_pagamento
FROM
  cliente c
INNER JOIN
  pagamento p ON c.cpf = p.cpf
WHERE
  c.cpf = 12345678911;


--Deletando um dado/registro específico na tabela
DELETE FROM treino WHERE tipo = "Corrida";

--Deletando TODOS os registros da tabela
DELETE FROM treino;

-- DELETAR UMA TABELA
DROP TABLE treino;

DROP TABLE cliente;

-- DELETANDO UM BANCO DE DADOS
DROP DATABASE anafit;
