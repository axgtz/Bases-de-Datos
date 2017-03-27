##Lista de actores de un director en especifico. 
use examen;
SELECT 
    titulo, nombre
FROM(
	SELECT titulo, nombre
		FROM pelicula_has_actor 
			natural join 
            pelicula
			
            where nombre = "Christopher Nolan")AS Temp 
GROUP BY nombre;
