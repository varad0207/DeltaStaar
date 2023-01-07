<!-- test file for login/logout -->

<?php 
require 'includes/common.php';
if (!isset($_SESSION['emp_id'])) header("location:..//views/login.html");
?>
<html>
    <head>  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
    <body>
    <a type="button" class="btn btn-secondary btn-lg" href = "logout.php">logout</a>
    </body>
</html>