CREATE PROCEDURE `select_conductor` (IN idconductor INT(11))
BEGIN
	Select * from Conductor c where c.idConductor = idconductor;
END