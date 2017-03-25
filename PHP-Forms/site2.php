<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pag 2</title>
    <link rel="stylesheet" href="style.css">
    <meta name="author" content="Alejandro Guti">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body style="color: <?php echo($_POST["color"]); ?>">
  <div>
     <h4>Tipo de Sangre: </h4></label><?php echo($_POST["sangre"]); ?><br>

     <h4>Mail: </h4><?php echo($_POST["email"]); ?><br>

     <h4>Fecha de Nacimiento: </h4><?php echo($_POST["birthday"]); ?><br>

     <h4>Arrival Date: </h4><?php echo($_POST["arrDate"]); ?><br>

     <h4>Numero de Noches: </h4><?php echo($_POST["nights"]); ?><br>

     <h4>Numero de guests: </h4><?php echo($_POST["guests"]); ?><br>

    <?php $dateOfBirth = $_POST["birthday"];
    $today = date("Y-m-d");
    $diff = date_diff(date_create($dateOfBirth), date_create($today));
    echo '<h4>Tu edad es: </h4>'.$diff->format('%y');?>
  </div>
</body>

</html>
