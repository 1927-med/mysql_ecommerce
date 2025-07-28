<?php
/**
 * Database connection and query execution functions
 * 
 * This file contains functions to connect to the MySQL database and execute queries.
 * It uses the mysqli extension for database operations.
 */
// db.php
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "ecommerce";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function query($sql) {
    global $conn;
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $rows = array();
        while($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    } else {
        return array();
    }
}

function execute($sql) {
    global $conn;
    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        return false;
    }
}
?>