-- Explotación de la data

-- Examinar el contenido de la tabla de Películas. 
SELECT * 
FROM movies; 
 
 
-- Consultar las películas y su fecha de estreno solamente de aquellas que tienen una duración superior a 100 minutos. 
SELECT original_title, release_date 
FROM movies 
WHERE runtime > 100.0; 
 
 
-- Mostrar las peliculas con popularidad mayor a 150 
SELECT original_title, popularity 
FROM movies 
WHERE popularity > 150; 
 
 
-- Muestra el nombre del director que dirigio la pelicula con la mayor duracion 
SELECT movies.original_title AS Peliculas, movies.runtime AS Duracion, director.name_director AS Director 
FROM movies 
INNER JOIN director_movies ON director_movies.idMovies = movies.idMovies 
INNER JOIN director ON director.id_director = director_movies.id_director 
WHERE (runtime = (SELECT MAX(CAST(runtime AS DOUBLE)) as runtimeMax 
FROM movies)); 
 
 
-- Muestra todos los directores que grabron peliculas en frances 
SELECT director.name_director AS Director 
FROM movies 
INNER JOIN director_movies ON director_movies.idMovies = movies.idMovies 
INNER JOIN director ON director.id_director = director_movies.id_director 
WHERE (movies.original_lenguague = 'fr'); 
 
 
-- Muestra los generos y el nombre de la pelicula con menor popularity 
SELECT movies.original_title AS Peliculas, genres.genres AS Generos 
FROM movies 
INNER JOIN movies_genres ON movies_genres.idMovies = movies.idMovies 
INNER JOIN genres ON genres.id_genres = movies_genres.id_genres 
WHERE (popularity = (SELECT MIN(CAST(popularity AS DOUBLE)) as popularityMin 
FROM movies)); 
 
 
-- Muestra las peliculas en las que participo Antonio Banderas 
SELECT movies.original_title AS Peliculas 
FROM movies 
INNER JOIN movies_cast ON movies_cast.idMovies = movies.idMovies 
INNER JOIN cast ON cast.id_cast = movies_cast.id_cast 
WHERE (cast.name_cast = 'Antonio Banderas'); 
 
 
-- Muestra todos los idiomas que se hablan en la pelicula X-Men: Days of Future Past 
SELECT spoken_languages.name AS LenguajesHablados 
FROM movies 
INNER JOIN movies_spoken_languages ON movies_spoken_languages.idMovies = movies.idMovies 
INNER JOIN spoken_languages ON spoken_languages.id_spoken_languages = movies_spoken_languages.id_spoken_languages 
WHERE (movies.original_title = 'X-Men: Days of Future Past'); 
 
 
-- Muestra todas las companias que estuvieron en la produccion de la pelicula Harry Potter and the Prisoner of Azkaban 
SELECT production_companies.name AS Companias 
FROM movies 
INNER JOIN movies_production_companies ON movies_production_companies.idMovies = movies.idMovies 
INNER JOIN production_companies ON production_companies.id_production_companies = movies_production_companies.id_production_companies 
WHERE (movies.original_title = 'Harry Potter and the Prisoner of Azkaban'); 
 
 
-- Muestra todas las peluculas de genero Horror y presupuesto mayor a 300000 
SELECT movies.original_title AS Peliculas 
FROM movies 
INNER JOIN movies_genres ON movies_genres.idMovies = movies.idMovies 
INNER JOIN genres ON genres.id_genres = movies_genres.id_genres 
WHERE (genres.genres = 'Horror' AND movies.budget = 300000); 