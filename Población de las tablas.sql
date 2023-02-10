use proyecto_integrador_definitivo;

-- Poblacion de tabla movies
INSERT INTO movies (
                    idMovies,
                    budget,
                    homepague,
                    original_title,
                    overview,
                    popularity,
                    release_date,
                    revenue,
                    runtime,
                    status,
                    tagline,
                    title,
                    vote_average,
                    vote_count,
                    original_lenguague)

SELECT              id,
                    budget,
                    homepage,
                    original_title,
                    overview,
                    popularity,
                    release_date,
                    revenue,
                    runtime,
                    status,
                    tagline,
                    title,
                    vote_average,
                    vote_count,
                    original_language
FROM proyecto.original_title_movies_tmp;


-- Poblacion de Director
use proyecto;
DROP TABLE IF EXISTS director_TMP2;
CREATE TABLE director_TMP2 AS
SELECT DISTINCT directorNuevo
FROM proyecto.director_tmp;

ALTER TABLE director_TMP2
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

INSERT INTO  director(
                    id_director,
                    name_director
                    )

SELECT              id,
                    directorNuevo
FROM proyecto.director_tmp2;


-- Poblacion de Keywords
DROP TABLE IF EXISTS keywords_TMP2;
CREATE TABLE keywords_TMP2 AS
SELECT DISTINCT keywordsNuevo
FROM proyecto.keywords_tmp;

ALTER TABLE keywords_TMP2
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

INSERT INTO  keywords(
                      id_keywords,
                      keywords
                    )

SELECT                id,
                      keywordsNuevo
FROM proyecto.keywords_tmp2;


-- Poblacion de production_companies
DROP TABLE IF EXISTS production_companies_TMP3;
CREATE TABLE production_companies_TMP3 AS
SELECT DISTINCT ProductionCompanyName, ProductionCompanyId
FROM proyecto.production_companies_tmp2;

INSERT INTO  production_companies(
                      id_production_companies,
                      name
                    )

SELECT                ProductionCompanyId,
                      ProductionCompanyName
FROM proyecto.production_companies_TMP3;


-- Poblacion de production_countries
DROP TABLE IF EXISTS production_countries_TMP3;
CREATE TABLE production_countries_TMP3 AS
SELECT DISTINCT ProductionCountriesId, ProductionCountriesNames
FROM proyecto.production_countries_TMP2;

INSERT INTO  production_countries(
                      id_production_countries,
                      name
                    )

SELECT                ProductionCountriesId,
                      ProductionCountriesNames
FROM proyecto.production_countries_TMP3;


-- Poblacion de spoken_languages
DROP TABLE IF EXISTS spoken_languages_tmpx2;
CREATE TABLE spoken_languages_tmpx2 AS
SELECT DISTINCT iso_639_1, name
FROM proyecto.spoken_languages_tmpx;

INSERT INTO  spoken_languages(
                      id_spoken_languages,
                      name
                    )

SELECT                iso_639_1,
                      name
FROM proyecto.spoken_languages_tmpx2;


-- Poblacion de genres
DROP TABLE IF EXISTS movies_genres2;
CREATE TABLE movies_genres2 AS
SELECT DISTINCT genre
FROM proyecto.movies_genres;

ALTER TABLE movies_genres2
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

INSERT INTO  genres(
                      genres,
                      id_genres
                    )

SELECT                genre,
                      id
FROM proyecto.movies_genres2;


-- Poblacion de cast
DROP TABLE IF EXISTS cast_final2;
CREATE TABLE cast_final2 AS
SELECT DISTINCT nombres
FROM proyecto.cast_final;

ALTER TABLE cast_final2
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

INSERT INTO  `cast`(
                      id_cast,
                      name_cast

                    )

SELECT                id,
                      nombres
FROM proyecto.cast_final2;


 --              --------------------tablas intermedias--------------------

-- Poblacion de movies_production_companies
INSERT INTO  movies_production_companies (
                      idMovies,
                      id_production_companies
                    )

SELECT                id,
                      ProductionCompanyId
FROM proyecto.production_companies_tmp2;


-- Poblacion de movies_production_countries
INSERT INTO  movies_production_countries (
                      idMovies,
                      id_production_countries
                    )

SELECT                id,
                      ProductionCountriesId
FROM proyecto.production_countries_tmp2;


-- Poblacion de movies_spoken_languages
INSERT INTO  movies_spoken_languages (
                      idMovies,
                      id_spoken_languages
                    )

SELECT                id_movie,
                      iso_639_1
FROM proyecto.spoken_languages_tmpx;


-- Poblacion de movies_cast
DROP TABLE IF EXISTS movies_cast_join;
CREATE TABLE movies_cast_join AS
SELECT cast_final2.nombres, cast_final2.id AS id_actor, cast_final.id AS id_movies
FROM cast_final2
INNER JOIN cast_final
ON cast_final2.nombres = cast_final.nombres;

INSERT INTO  movies_cast (
                      idMovies,
                      id_cast
                    )

SELECT                id_movies,
                      id_actor
FROM proyecto.movies_cast_join;


-- Poblacion director_movies
DROP TABLE IF EXISTS director_movies_join;
CREATE TABLE director_movies_join AS
SELECT director_tmp2.directorNuevo AS nombreDirector, director_tmp2.id AS idDirector, director_tmp.id AS idMovies
FROM director_tmp2
INNER JOIN director_tmp
ON director_tmp2.directorNuevo = director_tmp.directorNuevo;

INSERT INTO  director_movies (
                      idMovies,
                      id_director

                    )

SELECT                idMovies,
                      idDirector
FROM proyecto.director_movies_join;


-- Poblacion de movies_keywords
DROP TABLE IF EXISTS movies_keywords_join;
CREATE TABLE movies_keywords_join AS
SELECT keywords_tmp.id AS idMovies, keywords_tmp.keywordsNuevo , keywords_tmp2.id AS idKeywords
FROM keywords_tmp
INNER JOIN keywords_tmp2
ON keywords_tmp.keywordsNuevo = keywords_tmp2.keywordsNuevo;

INSERT INTO  movies_keywords (
                      idMovies,
                      id_keywords

                    )

SELECT                idMovies,
                      idKeywords
FROM proyecto.movies_keywords_join;


-- Poblacion de movies_genres
DROP TABLE IF EXISTS movies_genres_join;
CREATE TABLE movies_genres_join AS
SELECT movies_genres2.genre, movies_genres2.id AS idGender, movies_genres.id AS idMovies
FROM movies_genres2
INNER JOIN movies_genres
ON movies_genres2.genre = movies_genres.genre;

INSERT INTO  movies_genres (
                      idMovies,
                      id_genres

                    )

SELECT                idMovies,
                      idGender
FROM proyecto.movies_genres_join;


-- ---------------------------------------Correccion Crew---------------------------------------

-- Poblacion de Crew
DROP TABLE IF EXISTS crew_tmp4;
CREATE TABLE crew_tmp4 AS
SELECT DISTINCT crew_tmp3.id, crew_tmp3.gender, crew_tmp3.name
FROM crew_tmp3;

DELETE FROM crew_tmp4
WHERE id = 30711;

INSERT INTO  crew(
                    id_crew,
                    gender,
                    name
                    )

SELECT              id,
                    gender,
                    name
FROM proyecto.crew_tmp4;


-- Poblacion de Credit
DROP TABLE IF EXISTS crew_tmp5;
CREATE TABLE crew_tmp5 AS
SELECT DISTINCT crew_tmp3.credit_id, crew_tmp3.job, crew_tmp3.department, crew_tmp3.id
FROM crew_tmp3;

DELETE FROM crew_tmp5
WHERE id = 30711;

INSERT INTO  credit(
                    credit,
                    job,
                    department,
                    id_crew
                    )

SELECT              credit_id,
                    job,
                    department,
                    id
FROM proyecto.crew_tmp5;



-- Poblacion de movies_crew
DROP TABLE IF EXISTS crew_tmp6;
CREATE TABLE crew_tmp6 AS
SELECT *
FROM crew_tmp3;

DELETE FROM crew_tmp6
WHERE id = 30711;

INSERT INTO  movies_crew (
                      credit,
                      idMovies
                    )
SELECT                credit_id,
                      id_movie
FROM proyecto.crew_tmp6;