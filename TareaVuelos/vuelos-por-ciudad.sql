use mydb;
select numero_vuelo,destino,origen from vuelo where vuelo.origen = "Cancun" || vuelo.destino = "Cancun";
