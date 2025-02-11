CREATE TABLE documento (
	ID int NOT NULL AUTO_INCREMENT,
	nome_documento varchar(50),
	ultima_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
  situacao varchar(20),
	PRIMARY KEY(ID)
);