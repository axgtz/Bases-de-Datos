use kioskos;
SELECT
  upc,
  SUM(cantidad) AS TOTAL_VENTA
FROM(
 SELECT upc, cantidad
	 FROM
	 producto_venta
	 natural JOIN producto natural join Venta where upc = upc_Producto) AS Venta 
GROUP BY upc;