CREATE DATABASE gestao_formacao;
USE gestao_formacao;

CREATE TABLE Turma (
    ID_Turma INT AUTO_INCREMENT PRIMARY KEY,
    Designacao VARCHAR(100) NOT NULL,
    Data_Criacao DATE NOT NULL
);

CREATE TABLE Formando (
    ID_Formando INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Numero_Identificacao VARCHAR(30) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    ID_Turma INT NOT NULL,
    FOREIGN KEY (ID_Turma)
        REFERENCES Turma(ID_Turma)
);

CREATE TABLE Curso (
    ID_Curso INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Inicio DATE NOT NULL,
    Carga_Horaria INT NOT NULL
);

CREATE TABLE Turma_Curso (
    ID_Turma INT NOT NULL,
    ID_Curso INT NOT NULL,
    PRIMARY KEY (ID_Turma, ID_Curso),
    FOREIGN KEY (ID_Turma)
        REFERENCES Turma(ID_Turma),
    FOREIGN KEY (ID_Curso)
        REFERENCES Curso(ID_Curso)
);