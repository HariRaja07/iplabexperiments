<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPL_10💻</title>
</head>
<body>
<?php
$JDBC_DRIVER = "com.mysql.jdbc.Driver";
$DB_HOST = "localhost";
$DB_PORT = 3306;
$DB_NAME = "phone";
$DB_USER = "root";
$DB_PASS = "";

// Set response content type
header("Content-Type: text/html");
$out1 = fopen("php://output", "w");

$title = "Database Result [ PHP ]";

fwrite($out1, "<html>\n");
fwrite($out1, "<head>\n");
fwrite($out1, "<title>$title</title>\n");
fwrite($out1, "</head>\n");
fwrite($out1, "<body bgcolor=\"#f0f0f0\">\n");
fwrite($out1, "<br>\n");
fwrite($out1, "<hr>\n");
fwrite($out1, "<center><h1>$title</h1></center>\n");

try {
    // Create a new MySQLi instance
    $conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME, $DB_PORT);

    // Check for connection errors
    if ($conn->connect_error) {
        throw new Exception("Failed to connect to the database: " . $conn->connect_error);
    }

    // Execute SQL query
    $sql = "SELECT * FROM smartphone";
    $result = $conn->query($sql);

    fwrite($out1, "<style> th, td { padding-top: 10px; padding-bottom: 20px; padding-left: 30px; padding-right: 40px; }</style>\n");
    fwrite($out1, "<center><div><table border=\"1\">\n");
    fwrite($out1, "<tr><td> Brand </td>");
    fwrite($out1, "<td> Model </td>");
    fwrite($out1, "<td> Operating System </td></tr>\n");

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $brand = $row['brand'];
            $model = $row['model'];
            $os = $row['os'];

            fwrite($out1, "<tr><td>$brand</td>");
            fwrite($out1, "<td>$model</td>");
            fwrite($out1, "<td>$os</td></tr>\n");
        }
    } else {
        fwrite($out1, "<tr><td colspan='3'>No data found</td></tr>\n");
    }

    fwrite($out1, "</table></div></center>\n");
    fwrite($out1, "</body></html>\n");

    // Close connections
    $result->close();
    $conn->close();
} catch (Exception $e) {
    fwrite($out1, "Failed to connect to the database - Error: " . $e->getMessage());
}

fclose($out1);
?>

</body>
</html>
