<?php
require "dbconnect.php";
$result = $conn->query("SELECT * FROM билет") ;
echo "<h2>Билеты</h2>";
while ($row = $result->fetch()) {
    echo $row['name']."<br>";

}