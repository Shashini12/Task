<?php

$host_name = 'localhost';
$user_name = 'root';
$password = ''; // Add your MySQL password if required
$db_name = 'nuwazhsc_task_management';

try {
    // Establish the connection
    $connection = new PDO("mysql:host={$host_name};dbname={$db_name};charset=utf8mb4", $user_name, $password);

    // Set PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Database connection successful!";
} catch (PDOException $message) {
    // Display error message
    echo "Connection failed: " . $message->getMessage();
}

?>
