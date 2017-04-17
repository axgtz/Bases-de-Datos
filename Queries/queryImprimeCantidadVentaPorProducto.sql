use kioskos;

SELECT sum(CANTIDAD) as QTY, upc_producto
	from producto_venta group by upc_producto 
    order by QTY;