<?php
require "dbconnect.php";
$result = $conn->query("SELECT * FROM Билет ") ;
echo "<h2>Билеты</h2>";
while ($row = $result->fetch()) {
    echo $row['FIO']."<br>";

}