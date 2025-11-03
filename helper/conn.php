<?php

$DB_HOST = 'localhost';
$DB_USER = 'root';     
$DB_PASS = '';         
$DB_NAME = 'itech_db'; 

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if ($conn->connect_error) {
    die("Koneksi Gagal: " . $conn->connect_error);
}
?>