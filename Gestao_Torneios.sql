CREATE DATABASE IF NOT EXISTS gestao_torneios;
USE gestao_torneios;

-- Tabela Equipas
CREATE TABLE Equipas (
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY,
Nome_Equipa VARCHAR(100) NOT NULL,
Data_Criacao DATE NOT NULL
);

-- Tabela Jogadores
CREATE TABLE Jogadores (
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Nickname VARCHAR(50) NOT NULL,
Data_Nascimento DATE NOT NULL,
ID_Equipa INT NOT NULL,
FOREIGN KEY (ID_Equipa)
	REFERENCES Equipas(ID_Equipa)
);

-- Tabela Torneios
CREATE TABLE Torneios (
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Data_Inicio DATE NOT NULL,
Premio_Monetario DECIMAL(10,2) NOT NULL,
CHECK (Premio_Monetario >= 0)
);

-- Tabela Participacoes
CREATE TABLE Participacoes (
ID_Equipa INT NOT NULL,
ID_Torneio INT NOT NULL,
PRIMARY KEY (ID_Equipa, ID_Torneio),
FOREIGN KEY (ID_Equipa)
	REFERENCES Equipas(ID_Equipa),
FOREIGN KEY (ID_Torneio)
	REFERENCES Torneios(ID_Torneio)
);

INSERT INTO Equipas (Nome_Equipa, Data_Criacao) VALUES
('Os Invencíveis', '2020-03-12'),
('Dragões', '2021-06-20');

INSERT INTO Jogadores (Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES
('João Silva', 'Jony', '2008-05-15', 1),
('Pedro Costa', 'Costa', '2007-09-10', 2);

INSERT INTO Torneios (Nome, Data_Inicio, Premio_Monetario) VALUES
('Liga Nacional', '2026-05-10', 1000.00),
('Taça Regional', '2026-06-15', 500.00),
('Campeonato Escolar', '2026-07-20', 250.00);

INSERT INTO Participacoes (ID_Equipa, ID_Torneio) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 3);

SELECT DISTINCT Nome FROM Jogadores ORDER BY Nome ASC;

SELECT Jogadores.Nome, Equipas.Nome_Equipa FROM Jogadores
INNER JOIN Equipas ON Jogadores.ID_Equipa = Equipas.ID_Equipa;

SELECT Equipas.Nome_Equipa FROM Equipas
INNER JOIN Participacoes ON Equipas.ID_Equipa = Participacoes.ID_Equipa
INNER JOIN Torneios ON Participacoes.ID_Torneio = Torneios.ID_Torneio
WHERE Torneios.Nome = 'Taça Regional';

SELECT Equipas.Nome_Equipa, COUNT(Jogadores.ID_Jogador) AS Numero_Jogadores FROM Equipas
INNER JOIN Jogadores ON Equipas.ID_Equipa = Jogadores.ID_Equipa
GROUP BY Equipas.ID_Equipa, Equipas.Nome_Equipa HAVING COUNT(Jogadores.ID_Jogador) > 1;

SELECT Equipas.Nome_Equipa, COUNT(Jogadores.ID_Jogador) AS Numero_Jogadores FROM Equipas
LEFT JOIN Jogadores ON Equipas.ID_Equipa = Jogadores.ID_Equipa
GROUP BY Equipas.ID_Equipa, Equipas.Nome_Equipa ORDER BY Numero_Jogadores DESC;

SELECT Torneios.Nome, Torneios.Premio_Monetario, COUNT(Participacoes.ID_Equipa) AS Numero_Equipas
FROM Torneios INNER JOIN Participacoes
ON Torneios.ID_Torneio = Participacoes.ID_Torneio GROUP BY Torneios.ID_Torneio, Torneios.Nome, Torneios.Premio_Monetario;