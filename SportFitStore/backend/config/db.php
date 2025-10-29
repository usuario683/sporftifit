<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "sportfitstore_db"; // usa el nombre real de tu base de datos

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die(json_encode([
        "success" => false,
        "message" => "Error al conectar con la base de datos: " . $conn->connect_error
    ]));
}
?>
