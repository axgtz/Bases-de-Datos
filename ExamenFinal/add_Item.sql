CREATE PROCEDURE `agregar_item` (IN idCliente INT(11), IN id INT(11),
IN descr varchar(300), IN pso FLOAT)
BEGIN
	insert into ITEM (idItem,descripcion,peso,Cliente_idCliente) values  (id,descr,pso,idCliente);
END