use prueban;
select 
sum(VENTA.subtotal) as TOTAL_PRODUCTOS, 
sum(VENTA.cantidad) as TOTAL_VENTA FROM(

select nombre, ean, precio, cantidad, 
	precio * cantidad  as subtotal
    from ticket_venta 
		natural join producto_ticket_venta
		natural join producto
	where no_venta = 3
) as	Venta;