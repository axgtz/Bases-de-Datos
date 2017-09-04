CREATE DEFINER=`root`@`localhost` PROCEDURE `select_cliente`(IN idcliente INT(11))
BEGIN
	Select * from Cliente c where c.idCliente = idcliente;
END