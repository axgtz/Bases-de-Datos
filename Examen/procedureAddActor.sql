CREATE DEFINER=`root`@`localhost` PROCEDURE `guarda_Actor`(IN nombre varchar(45),
 in personaje varchar(45), in pelicula varchar(45),in nacion varchar(45))
BEGIN
	insert into ACTOR (nombre,nacion) values (nombre, nacion);
    insert into pelicula_has_actor (titulo, nombre, personaje)
    values (pelicula, nombre, personaje);
END