<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Pag 1</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
  <h1>Supa Form!!</h1>
    <form action="php/site2.php" method="post" oninput="total.value = (nights.valueAsNumber * 50) + ((guests.valueAsNumber - 1) * 10)">
            <!--Forms-->
            <label>Nombre: </label>
            <input type="text" name="yourname" id="yourname" placeholder="Joe Doe" required/>

            <label>Rola su tipo de sangre: </label>
            <input type="text" name="sangre" id="sangre" placeholder="O+" required/>

            <label>Email: </label>
            <input type="email" name="email" id="email" placeholder="joe@gmail.com" required/>

            <label>Confirm Email: </label>
            <input type="email" name="emailCon" oninput="check(this)" placeholder="joe@gmail.com" required/>

            <label>Arrival Date: </label>
            <input type="date" name="arrDate" id="arrDate" name="arrivalDate" placeholder="Write Here" required/>

            <label>Number of Nights: (Rooms = ¢50 night)</label>
            <input type="number" name="nights" id="nights" value="1" min="1" max="31" placeholder="Write Here" required/>

            <label>Number of Guests: (each additional guest adds $10.00 per night)</label>
            <input type="number" name="guests" id="guests" name="guests" value="1" min="1" max="4" required/>

            <label>Estimated Total: </label>

            <output id="total">¢50</output>.00
            <br><br>

            <input type="submit" value="submit" />
  </form>
 <script>
    function check(input) {
        if (input.value != document.getElementById("email").value) {
          input.setCustomValidity("Los emails no son iguales, te pasas compa");
        } else {
            input.setCustomValidity("");
        }
    }
</script>
</body>

</html>
