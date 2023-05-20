<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>basic php</title>
</head>
<body>
  <div>
    <h1>
      Welcome to PHP <hr>
    </h1>
  </div>
  <div class="jsp">
    <p style="font-size: medium;font-family: 'Courier New', Courier, monospace;">Select Submit Option below</p>

    <form action="ex.php" method="POST">
      <input type="submit" name="submit" value="SUBMIT">
    </form>
    <a href="ex.html">Back</a>
  </div>

  <?php
  if (isset($_POST['submit']) && $_POST['submit'] === 'SUBMIT') {
    $smartphones = array(
      array("Brand" => "Samsung", "Model" => "Galaxy S21", "OS" => "Android"),
      array("Brand" => "Apple", "Model" => "iPhone 12", "OS" => "iOS"),
      array("Brand" => "Google", "Model" => "Pixel 5", "OS" => "Android"),
      array("Brand" => "OnePlus", "Model" => "9 Pro", "OS" => "Android")
    );

    echo "<h2>Smartphone Information:</h2>";
    echo "<ul>";
    foreach ($smartphones as $smartphone) {
      echo "<li>";
      echo "Brand: " . $smartphone["Brand"] . "<br>";
      echo "Model: " . $smartphone["Model"] . "<br>";
      echo "OS: " . $smartphone["OS"];
      echo "</li>";
    }
    echo "</ul>";
  }
  ?>
</body>
</html>
