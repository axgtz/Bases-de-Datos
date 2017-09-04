CREATE PROCEDURE `actualizar_cliente` (IN idCliente INT(11), 
IN nombre varchar(45), IN telefono INT(11))
BEGIN
	Select * from Cliente c where c.idCliente = id;
	update c set c.telefono = tel;
    update c set c.nombre = nom;
END