<?php
/**
 * This code demonstrates how to use the query and execute functions to,
 * interact with the database.
 */



// index.php
require_once 'db.php';

// Example usage:
$rows = query("SELECT * FROM users");
print_r($rows);

// Execute a query
execute("INSERT INTO users (username, email, password) VALUES ('john', 'john@example.com', 'password123')");
?>