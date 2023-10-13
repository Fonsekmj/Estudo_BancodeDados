-- Crie um novo banco de dados
CREATE DATABASE EngenhariaMecanicaDB;

-- Use o banco de dados
USE EngenhariaMecanicaDB;

-- Crie a tabela 'Compras' para armazenar informações sobre as compras
CREATE TABLE Compras (
    CompraID INT PRIMARY KEY,
    DataCompra DATE,
    Produto VARCHAR(50),
    Quantidade INT
);

-- Inserir alguns dados de exemplo
INSERT INTO Compras (CompraID, DataCompra, Produto, Quantidade) VALUES
    (1, '2023-10-12', 'Parafusos', 100),
    (2, '2023-10-12', 'Porcas', 150),
    (3, '2023-10-13', 'Engrenagens', 50),
    (4, '2023-10-13', 'Molas', 75);

-- Criar uma procedure para gerar o relatório diário
DELIMITER //
CREATE PROCEDURE RelatorioDiarioCompras()
BEGIN
    SELECT DataCompra, SUM(Quantidade) AS QuantidadeTotal
    FROM Compras
    GROUP BY DataCompra;
END;
//
DELIMITER ;