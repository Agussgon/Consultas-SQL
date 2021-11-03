1. Obtener los artistas que han actuado en una o más películas.
SELECT *, count(pelicula_id) as peliculasActuadas
FROM artista_x_pelicula
inner join artista on artista.id=artista_id
inner join pelicula on pelicula.id=pelicula_id
group by artista_id
having peliculasActuadas >= 1;


2. Obtener las películas donde han participado más de un artista según nuestra
base de datos.
SELECT pelicula.titulo, count(artista_id) as artistasCantidad
FROM artista_x_pelicula
inner join artista on artista.id=artista_id
inner join pelicula on pelicula.id=pelicula_id
group by pelicula_id
having artistasCantidad > 1;

3. Obtener aquellos artistas que han actuado en alguna película, incluso
aquellos que aún no lo han hecho, según nuestra base de datos.

SELECT artista_id, artista.nombre
FROM artista_x_pelicula
right join artista on artista.id=artista_id
group by artista_id

4. Obtener las películas que no se le han asignado artistas en nuestra base de
datos. ¿Por qué aparececomo nulo?

SELECT *
FROM artista_x_pelicula
right join pelicula on pelicula.id=pelicula_id
inner join artista on artista.id=artista_id
where ISNULL(artista_id)
5. Obtener aquellos artistas que no han actuado en alguna película, según
nuestra base de datos.
SELECT *
FROM artista_x_pelicula
inner join pelicula on pelicula.id=pelicula_id
right join artista on artista.id=artista_id
where ISNULL(artista_id)

6. Obtener aquellos artistas que han actuado en dos o más películas según
nuestra base de datos.
SELECT count(pelicula_id) as pelisactuadas,artista.nombre
FROM artista_x_pelicula
inner join pelicula on pelicula.id=pelicula_id
inner join artista on artista.id=artista_id
group by artista_id
having pelisactuadas >= 2

7. Obtener aquellas películas que tengan asignado uno o más artistas, incluso
aquellas que aún no le han asignado un artista en nuestra base de datos.
SELECT count(artista_id) as cantidadArtistas
FROM artista_x_pelicula
right join pelicula on pelicula.id=pelicula_id
-- inner join artista on artista.id=artista_id
-- where ISNULL(artista_id) 
group by pelicula_id
having cantidadArtistas >=1 or null