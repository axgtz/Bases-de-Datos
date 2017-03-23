select * from ticket_venta INNER join empleado ON (no_empleado = id_empleado)
	where no_venta = 4;

select nombre, ean, precio, cantidad, 
	precio * cantidad  as subtotal
    from ticket_venta 
		natural join producto_ticket_venta
		natural join producto
	where no_venta = 4;