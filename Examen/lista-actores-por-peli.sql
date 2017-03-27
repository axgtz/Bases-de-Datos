##Lista de actores de una pelicula en especifico.
use examen;
SELECT 
    titulo, nombre
FROM pelicula_has_actor where titulo = "Interstellar";