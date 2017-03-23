use prueban;
SELECT 
    no_venta,
    SUM(subtotal) AS TOTAL_PRODUCTOS,
    SUM(cantidad) AS TOTAL_VENTA
FROM
    (SELECT 
        nombre, ean, precio, cantidad, no_venta, precio * cantidad AS subtotal
    FROM
        ticket_venta
    NATURAL JOIN producto_ticket_venta
    NATURAL JOIN producto) AS Venta
GROUP BY no_venta;