-- Crie um novo banco de dados
CREATE DATABASE EngenhariaMecanicaDB;

-- Use o banco de dados que você acabou de criar
USE EngenhariaMecanicaDB;

-- Crie a tabela 'Motores'
CREATE TABLE Motores (
    MotorID INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Potencia INT,
    PecaID INT
);

-- Crie a tabela 'Pecas'
CREATE TABLE Pecas (
    PecaID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Tipo VARCHAR(30)
);

-- Insira alguns dados nas tabelas
INSERT INTO Pecas (PecaID, Nome, Tipo) VALUES
    (1, 'Pistão', 'Interno'),
    (2, 'Vela de Ignição', 'Elétrica'),
    (3, 'Cabeçote', 'Interno');

INSERT INTO Motores (MotorID, Modelo, Potencia, PecaID) VALUES
    (101, 'Motor A', 150, 1),
    (102, 'Motor B', 200, 2),
    (103, 'Motor C', 180, 3);

-- Realize uma consulta que relaciona as tabelas usando JOIN
SELECT Motores.Modelo, Pecas.Nome, Pecas.Tipo
FROM Motores
JOIN Pecas ON Motores.PecaID = Pecas.PecaID;