CREATE DATABASE moneycontrol

USE moneycontrol

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sexo CHAR NOT NULL,
    nome VARCHAR(120) NOT NULL,
    usuario VARCHAR(60) UNIQUE NOT NULL,
    senha VARCHAR(60) NOT NULL,
    datacad DATETIME NOT NULL
)


CREATE TABLE receita(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(120) NOT NULL,
	valor FLOAT NOT NULL,
    idUsuario INT NOT NULL,
    datamov DATETIME NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) 
)

CREATE TABLE despesa(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(120) NOT NULL,
	valor FLOAT NOT NULL,
    idUsuario INT NOT NULL,
    datamov DATETIME NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) 
)





