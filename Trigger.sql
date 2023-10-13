-- Crie um novo banco de dados
CREATE DATABASE EngenhariaAgilDB;

-- Use o banco de dados que você acabou de criar
USE EngenhariaAgilDB;

-- Crie a tabela 'Projetos'
CREATE TABLE Projetos (
    ProjetoID INT PRIMARY KEY,
    NomeProjeto VARCHAR(50),
    DataInicio DATE,
    DataFim DATE
);

-- Crie a tabela 'Tarefas'
CREATE TABLE Tarefas (
    TarefaID INT PRIMARY KEY,
    Descricao VARCHAR(100),
    ProjetoID INT,
    DataConclusao DATE,
    FOREIGN KEY (ProjetoID) REFERENCES Projetos(ProjetoID)
);

-- Crie um trigger para tarefas não realizadas
DELIMITER //
CREATE TRIGGER tarefa_nao_realizada_trigger
BEFORE INSERT ON Tarefas FOR EACH ROW
BEGIN
    IF NEW.DataConclusao IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Uma tarefa deve ter uma data de conclusão.';
    END IF;
END;
//
DELIMITER ;

-- Insira alguns dados nas tabelas
INSERT INTO Projetos (ProjetoID, NomeProjeto, DataInicio, DataFim) VALUES
    (1, 'Projeto de Motor Elétrico', '2023-01-15', '2023-06-30'),
    (2, 'Projeto de Suspensão Esportiva', '2023-02-10', '2023-07-15');

-- Tente inserir uma tarefa sem uma data de conclusão
-- Isso acionará o trigger
INSERT INTO Tarefas (TarefaID, Descricao, ProjetoID) VALUES
    (105, 'Tarefa sem data de conclusão', 1, NULL);