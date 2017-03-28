use aeropuerto;
select numero_vuelo from vuelo where vuelo.origen = "Cancun" || vuelo.destino = "Cancun";
