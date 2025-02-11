CREATE TABLE editais (
	ID int NOT NULL AUTO_INCREMENT,
	nome_edital varchar(100),
	data_publicacao DATE,
  tipo_edital varchar(50),
	PRIMARY KEY(ID)
);