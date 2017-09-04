CREATE PROCEDURE `agregar_conductor` (IN idConductor INT(11), 
IN nombre varchar(45), IN apellido varchar(45),IN rf INT(15))
BEGIN
	insert into CLIENTE (idConductor,nombre,apellido,rfc) values (idConductor,nombre,apellido,rfc);
END
