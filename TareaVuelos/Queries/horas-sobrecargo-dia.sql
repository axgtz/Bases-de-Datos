use aeropuerto;
SELECT
    nombre AS Nombre_Sobrecargo, SUM(duracion) AS Horas_de_Vuelo
FROM
	vuelo
		NATURAL join
	tripulacion_has_vuelo
		NATURAL join
	tripulacion
    WHERE
		DAYOFMONTH(fecha) = 1 && cargo = 'Sobrecargo'
GROUP BY codigo;

