CREATE PROCEDURE `borrar_cliente` (IN id INT(11))
BEGIN
     DELETE dCliente
     FROM   dCliente
     WHERE  
     idCliente = id;
END
