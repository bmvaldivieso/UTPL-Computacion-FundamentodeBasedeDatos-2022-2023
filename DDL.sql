DROP DATABASE IF EXISTS proyecto_integrador_DEFINITIVO;
CREATE DATABASE proyecto_integrador_DEFINITIVO CHARACTER SET utf8mb4;
USE proyecto_integrador_DEFINITIVO;

DROP TABLE IF EXISTS director; 
CREATE TABLE director (
  id_director int(100) NOT NULL,
  name_director varchar(100) NOT NULL,
  PRIMARY KEY (id_director)
);

DROP TABLE IF EXISTS movies; 
CREATE TABLE movies (
 idMovies varchar(16) NOT NULL, 
 budget  int(100) NOT NULL, 	
 homepague varchar(300),
 original_title varchar(100), -- cambio NOT NULL a puede tener NULL
 overview  varchar(1000),
 popularity  long,
 release_date  varchar(10) , -- cambio de date a varchar(10)
 revenue  long, -- cambio de int a long
 runtime  varchar(10), -- cambio de int(5) a double / cambio de double a varchar(10)
 status   varchar(15) ,
 tagline  varchar(400), -- cambio de 200 a 400
 title varchar (200),
 vote_average  double , -- cambio de 2,2 a 5,5 / cambio de 5,5 a double
 vote_count int (15),
 original_lenguague varchar (5),
 PRIMARY KEY (idMovies)
);

-- ------------------------------------------------------------- 
DROP TABLE IF EXISTS `cast`; 

CREATE TABLE cast (
  id_cast INT(100) NOT NULL, -- creamos id para cast
  name_cast VARCHAR(200) NOT NULL,
  PRIMARY KEY (id_cast)
);

DROP TABLE IF EXISTS spoken_languages;

CREATE TABLE spoken_languages(
  id_spoken_languages VARCHAR(4) NOT NULL,
  name VARCHAR(50) NOT NULL, -- cambio de varchar(15) a varchar(50)
  PRIMARY KEY (id_spoken_languages)
);

DROP TABLE IF EXISTS crew;
CREATE TABLE crew (
  id_crew VARCHAR(60) NOT NULL, 
  gender VARCHAR(60) NOT NULL,
  name VARCHAR(200), -- cambio de varchar(30) a varchar(50) / cambio de varchar(50) a varchar(200)
  PRIMARY KEY (id_crew)
);

DROP TABLE IF EXISTS credit;
CREATE TABLE credit (
  credit VARCHAR(200) NOT NULL, -- cambio de varchar(50) a varchar(200)
  job VARCHAR(200), -- cambio de varchar(30) a varchar(50) / cambio de varchar(50) a varchar(200)
  department VARCHAR(200), -- cambio de varchar(15) a varchar(50) / cambio de varchar(50) a varchar(200)
  id_crew VARCHAR(60) NOT NULL, 
  PRIMARY KEY (credit),
  FOREIGN KEY (id_crew) REFERENCES crew (id_crew)
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
  id_genres INT(100) NOT NULL, -- creamos id para genres
  genres VARCHAR(200) NOT NULL, -- cambio de varchar(20) a varchar(200)
  PRIMARY KEY (id_genres)
);

DROP TABLE IF EXISTS keywords;
CREATE TABLE keywords (
  id_keywords INT(100) NOT NULL, -- creamos id para keywords
  keywords VARCHAR(300) NOT NULL, -- cambio de varchar(20) a varchar(300)
  PRIMARY KEY (id_keywords) -- intercambio clave primaria por id_keywords
);

DROP TABLE IF EXISTS production_companies; 
CREATE TABLE production_companies (
  id_production_companies int(15) NOT NULL, 
  `name` varchar(300) NOT NULL, -- cambio de varchar(25) a varchar(300)
  PRIMARY KEY (id_production_companies)
);
DROP TABLE IF EXISTS production_countries; 
CREATE TABLE production_countries (
  id_production_countries varchar(5) NOT NULL, -- cambio de int(5) a varchar(5)
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (id_production_countries)
);


-- -------------------------------------------------------------

DROP TABLE IF EXISTS movies_production_countries; 
CREATE TABLE movies_production_countries (
  idMovies varchar(16) NOT NULL,
  id_production_countries varchar(5) NOT NULL,
  PRIMARY KEY (idMovies,id_production_countries),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies),
  FOREIGN KEY (id_production_countries) REFERENCES production_countries (id_production_countries)
);

DROP TABLE IF EXISTS movies_production_companies; 
CREATE TABLE movies_production_companies(
  idMovies varchar(16) NOT NULL,
  id_production_companies int(15) NOT NULL,
  PRIMARY KEY (idMovies,id_production_companies),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies),
  FOREIGN KEY (id_production_companies) REFERENCES production_companies (id_production_companies)
);

DROP TABLE IF EXISTS movies_crew;
CREATE TABLE movies_crew (
  credit VARCHAR(200) NOT NULL,
  idMovies VARCHAR(16) NOT NULL,
  PRIMARY KEY (credit, idMovies),
  FOREIGN KEY (credit) REFERENCES credit (credit), 
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies)
);

DROP TABLE IF EXISTS movies_genres;
CREATE TABLE movies_genres (
  idMovies VARCHAR(16) NOT NULL,
  id_genres INT(100) NOT NULL,
  PRIMARY KEY (idMovies, id_genres),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies),
  FOREIGN KEY (id_genres) REFERENCES genres (id_genres)
);

DROP TABLE IF EXISTS movies_keywords;
CREATE TABLE movies_keywords (
  idMovies VARCHAR(16) NOT NULL,
  id_keywords INT(100) NOT NULL, -- intercambio clave primaria por id_keywords
  PRIMARY KEY (idMovies, id_keywords),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies),
  FOREIGN KEY (id_keywords) REFERENCES keywords (id_keywords)
);

DROP TABLE IF EXISTS movies_cast;
CREATE TABLE movies_cast (
  idMovies VARCHAR(16) NOT NULL,
  id_cast INT(100) NOT NULL,
  PRIMARY KEY (idMovies, id_cast),
  FOREIGN KEY (id_cast) REFERENCES cast (id_cast),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies)
);

DROP TABLE IF EXISTS movies_spoken_languages;
CREATE TABLE movies_spoken_languages (
  idMovies VARCHAR(16) NOT NULL,
  id_spoken_languages VARCHAR(4) NOT NULL,
  PRIMARY KEY (idMovies, id_spoken_languages),
  FOREIGN KEY (id_spoken_languages) REFERENCES spoken_languages(id_spoken_languages),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies)
);

DROP TABLE IF EXISTS director_movies;
CREATE TABLE director_movies (
  idMovies VARCHAR(16) NOT NULL,
  id_director int(100) NOT NULL,
  PRIMARY KEY (idMovies, id_director),
  FOREIGN KEY (id_director) REFERENCES director (id_director),
  FOREIGN KEY (idMovies) REFERENCES movies (idMovies)
);





