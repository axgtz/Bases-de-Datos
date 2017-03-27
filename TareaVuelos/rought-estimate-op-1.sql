use mydb;
SELECT 
    codigo, fecha, SUM(duracion) AS Horas_de_Vuelo
FROM
    (SELECT 
        numero_vuelo, duracion, fecha, codigo
    FROM
        vuelo
    CROSS JOIN tripulacion CROSS JOIN tripulacion_has_vuelo
    WHERE
        codigo = TRIPULACION_codigo) AS temp WHERE MONTH(fecha) = 1
GROUP BY codigo;

