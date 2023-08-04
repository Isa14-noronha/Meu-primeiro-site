CREATE DATABASE Mujicare;
USE Mujicare;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario CHAR(45),
email CHAR(45),
senha CHAR (45)
);

CREATE TABLE Comentarios(
idComentario INT PRIMARY KEY AUTO_INCREMENT,
comentario VARCHAR(35),
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Instrumentos(
violino INT,
violao INT,
guitarra INT,
bateria INT,
piano INT,
outros INT,
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
PRIMARY KEY (fkUsuario)
);

-- inserts para teste da api
insert into Instrumentos values(1, 0, 1 ,1 , 1, 0, 1);
INSERT INTO Instrumentos VALUES(1, 1, 0 ,0 , 1, 0, 2);	
INSERT INTO Instrumentos VALUES(0, 1, 1 ,1 , 1, 1, 3);



-- selects para teste das tabelas
SELECT * FROM Usuario;
SELECT * FROM Comentarios;
SELECT * FROM Instrumentos;

SELECT * FROM Comentarios JOIN Usuario WHERE fkUsuario = idUsuario;
SELECT * FROM Instrumentos JOIN Usuario WHERE fkUsuario = idUsuario;


-- selects de validação da api
 -- cadastro
  INSERT INTO Usuario (nomeUsuario, email, senha) VALUES ( 'isa', 'isabela@sptech.com', '124345');
  INSERT INTO Usuario (nomeUsuario, email, senha) VALUES ( 'felipe', 'felipe@sptech.com', '124345');
  INSERT INTO Usuario (nomeUsuario, email, senha) VALUES ( 'Bruna', 'Bruna@sptech.com', '124345');
  
  -- login
  SELECT * FROM Usuario WHERE email = '' and senha = '';
  
  -- quantidade de usuarios cadastrados
  SELECT count(idUsuario) as 'qtd_Usuario' FROM Usuario;
  
  -- quantidade de pessoas que tocam os instrumentos
  select sum(violino) as violino, SUM(violao) as violao, sum(guitarra) as guitarra, sum(bateria) as bateria,
  sum(piano) as piano, sum(outros) as outros from Instrumentos;
  
  -- insert de comentarios 
  INSERT INTO Comentarios (comentario) VALUES ("");