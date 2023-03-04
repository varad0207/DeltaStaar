<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../images/logo-no-name-circle.png">
    <title>Admin Dashboard</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    <style>
        .chart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .chartBox {
            width: 50%;

        }
    </style>
</head>

<body>

    <?php
    include '../charts/waterTankers_Line.php';
    /*include '../charts/complaintStatus_Pie.php';*/
    ?>

</body>

</html>