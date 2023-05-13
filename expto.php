<?php

// Set the path to the Python script
$python_script = 'exp.py';

// Set the database credentials
$host="localhost";
$user="root";
$password="";
$database="deltastaar";

// Execute the Python script with the database credentials as arguments
exec("python3 $python_script $host $user $password $database");

// Redirect the user to the Excel file
header('Location: path/to/output.xlsx');
// header("Content-Type: application/xls");
// header("Content-Disposition: attachment; filename=Employee_detail.xls");
exit();

?>