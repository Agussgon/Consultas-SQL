SELECT * FROM movies_db.movies;
/*1. Mostrar el título de todas las series y usar alias para que tanto el nombre de la
tabla como el campo estén en español. se pueden traducir tdos slos campos al español?*/

SELECT title AS Titulo 
FROM series AS Series;  

/*2. Traer el título de las películas con el rating mayor a 3, con más de 1 premio
 y con fecha de lanzamiento entre el año 1988 al 2009. Ordenar los resultados por
rating. creo una vista de practica */
CREATE VIEW Buscando_premios_88_09 AS
SELECT title, rating,awards, release_date
FROM movies
WHERE  rating > 3 AND awards> 1 AND 
YEAR(release_date) BETWEEN "1988" AND "2009" 
ORDER BY release_date;

# 3. Traer el top 3 a partir del registro 10 de la consulta anterior.
SELECT title, rating,awards, release_date
FROM movies
WHERE  rating > 3 AND awards> 1 AND 
YEAR(release_date) BETWEEN "1988" AND "2009" 
ORDER BY release_date
limit 3 offset 10 ;

# 4. ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?
SELECT title , number , rating
from episodes 
order by rating asc
-- limit 3 
 
/*5. Obtener el listado de todos los actores. Quitar las columnas de fechas y película favorita, además traducir los nombres de las columnas.  */

SELECT CONCAT(first_name," " ,last_name) AS Actores, id, rating 
 from actors;

# queremos conocer, por un lado, los títulos y el nombre del género 
# de todas las series de la base de datos, es left xq dice tooodas las series.
SELECT genres.name, series.title
FROM series
LEFT JOIN genres ON series.genre_id=genres.id

2. Por otro, necesitamos listar los títulos de los episodios junto 
con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT CONCAT(actors.first_name, " " , actors.last_name) AS actores ,episodes.title
FROM actor_episode
INNER JOIN  episodes ON episode_id =episodes.id
INNER JOIN  actors  ON actor_id= actors.id
order by episodes.id;

3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
actrices (mostrar nombre y apellido) que han trabajado en cualquier película
de la saga de La Guerra de las galaxias.
SELECT CONCAT(actors.first_name, " " , actors.last_name) AS actores ,movies.title
FROM actor_movie
INNER JOIN  movies ON movie_id =movies.id
INNER JOIN  actors  ON actor_id= actors.id
WHERE movies.title like "%La Guerra de las galaxias%";

4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por nombre de género.
SELECT COUNT(movies.id) AS "cantidad de peliculas",genres.name AS genero
FROM movies
RIGHT JOIN genres ON genres.id=genre_id
GROUP by genres.name


