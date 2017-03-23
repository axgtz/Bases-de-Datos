<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pag 2</title>
    <link rel="stylesheet" href="../style.css">
</head>

<body>
   <label>Tipo de Sangre:</label><?php echo($_POST["sangre"]); ?><br>

   <label>Mail: </label><?php echo($_POST["email"]); ?><br>

   <label>Día en el que llegas: </label><?php echo($_POST["arrDate"]); ?><br>
   
   <label>Numero de Noches: </label><?php echo($_POST["nights"]); ?><br>

   <label>Numero de guests: </label><?php echo($_POST["guests"]); ?>
</body>

</html>
