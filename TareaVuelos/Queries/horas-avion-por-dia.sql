
use aeropuerto;
SELECT 
    matricula, SUM(duracion) AS Horas_de_Vuelo
    FROM
        vuelo
    NATURAL JOIN avion
 WHERE DAYOFMONTH(fecha) = 1
GROUP BY matricula;