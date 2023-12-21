<?php
if(!defined('DB_SERVER')){
    require_once("initialize.php");
}
    $host = DB_SERVER;
    $username = DB_USERNAME;
    $password = DB_PASSWORD;
    $database = DB_NAME;

    $conn = new mysqli($host, $username, $password, $database);
    if ($conn->connect_error)
    {
        die("Error connecting to". $conn->connect_error);
    }
?>