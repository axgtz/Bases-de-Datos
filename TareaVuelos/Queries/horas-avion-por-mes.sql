use aeropuerto;
SELECT 
    matricula, SUM(duracion) AS Horas_de_Vuelo
FROM
    (SELECT 
        matricula, duracion, fecha
    FROM
        vuelo
    NATURAL JOIN avion
) AS Horas_Avion WHERE MONTH(fecha) = 1
GROUP BY matricula;

