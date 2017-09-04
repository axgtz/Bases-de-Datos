CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cliente`(IN idCliente INT(11), 
IN nombre varchar(45), IN telefono INT(11))
BEGIN
	insert into CLIENTE (idCliente,nombre,telefono) values  (idCliente,nombre,telefono);
END