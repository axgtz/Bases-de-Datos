CREATE PROCEDURE `actualizar_tel_cliente` (IN id INT(11), IN tel INT(11))
BEGIN
	Select * from Cliente c where c.idCliente = id;
	update c set c.telefono = tel;
END
