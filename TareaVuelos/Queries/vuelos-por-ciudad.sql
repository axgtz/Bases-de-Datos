use aeropuerto;
select numero_vuelo,destino,origen from vuelo where vuelo.origen = "Cancun" || vuelo.destino = "Cancun";
