##  iii) Número de veces que un actor ha actuado para un director en específico.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
use examen;
SELECT 
	pelicula.nombre , pelicula_has_actor.nombre, COUNT(pelicula_has_actor.nombre) AS Num_Veces_en_peli
FROM
    pelicula
    cross join
	pelicula_has_actor where pelicula.titulo = pelicula_has_actor.titulo
    group by pelicula_has_actor.nombre;