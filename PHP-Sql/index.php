<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Conexion a Base de Datos</title>
</head>
<body>
<?php
    erro_reporting(E_ALL);
    ini_set('display_errors', 1);
    $enlace = mysqli_connect("127.0.0.1","root","","prueban");
    if($enlace)
        echo "Conexion exitosa.<br>";
    else
        die("Conexion no exitosa.");

    $resultado_query = mysql_query($enlace, "select * from PRODUCTO;");

    while($row_asociativo = mysqli_fetch_assoc($resultado_query))
    //var_dump($row_asociativo);
    {
        echo $row_asociativo['nombre']."<br>";
    }


?>
</body>
</html>