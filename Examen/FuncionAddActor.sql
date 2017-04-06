CREATE DEFINER=`root`@`localhost` PROCEDURE `guarda_Actor`(IN nom varchar(45), in personaj varchar(45), in pelicula varchar(45),in nacionalidad varchar(45))
BEGIN
	insert into ACTOR (nombre) values (nom, nacion);
    insert into pelicula_has_actor (titulo, nombre, personaje)
    values (pelicula, nom, personaj, nacionalidad);
END