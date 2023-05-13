<?php include('../../controllers/includes/common.php'); ?>
<?php 
if (!isset($_SESSION["emp_id"]))
header("location:../../views/login.php");
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_employee_details'] > 1) {
$isPrivilaged = $rights['rights_employee_details'];
} else
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logs</title>
    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Employees</title>
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <link rel="stylesheet" href="../../css/table.css">

    <!-- CSS only -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>
<body class="b ma2">
    <!-- Sidebar and Navbar -->
    <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>

    <h1 class="tc f1 lh-title spr">Logs</h1>
    <ul class="nav nav-pills nav-fill f3 lh-copy ulcolor">
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed1" role="button" aria-expanded="false" aria-controls="collapsed1">Employee</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed2" role="button" aria-expanded="false" aria-controls="collapsed2">Accommodation</a>        
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed3" role="button" aria-expanded="false" aria-controls="collapsed3">Rooms</a>        
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed4" role="button" aria-expanded="false" aria-controls="collapsed4">Complaint</a>        
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed5" role="button" aria-expanded="false" aria-controls="collapsed5">Jobs</a>        
        </li>
        <!-- <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#collapsed6" role="button" aria-expanded="false" aria-controls="collapsed6">Visitor Log</a>        
        </li> -->
    </ul>

    <div class="collapse" id="collapsed1">
        <div class="pl1 pr1 table-responsive">
                <table class="table table-bordered tc">
                    <thead>
                        <tr>
                            <th scope="col">Employee ID</th>
                            <th scope="col">Employee Code</th>
                            <th scope="col">User</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Type of Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = mysqli_query($conn, "SELECT * FROM change_tracking_employee");
                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['emp_id'] ?></td>
                                    <td><?php echo $row['emp_code'] ?></td>
                                    <td><?php echo $row['user'] ?></td>
                                    <td><?php echo $row['timestamp'] ?></td>
                                    <td><?php echo $row['type'] ?></td>
                                </tr>
                            <?php }
                        } else { ?>
                            <label style="color:white;">No entries found</label>
                        <?php
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="collapse" id="collapsed2">
        <div class="pl1 pr1 table-responsive">
                <table class="table table-bordered tc">
                    <thead>
                        <tr>
                            <th scope="col">Accommodation ID</th>
                            <th scope="col">Accommodation Code</th>
                            <th scope="col">User</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Type of Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = mysqli_query($conn, "SELECT * FROM change_tracking_accomodation");
                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['acc_id'] ?></td>
                                    <td><?php echo $row['acc_code'] ?></td>
                                    <td><?php echo $row['user'] ?></td>
                                    <td><?php echo $row['timestamp'] ?></td>
                                    <td><?php echo $row['type'] ?></td>
                                </tr>
                            <?php }
                        } else { ?>
                            <label style="color:white;">No entries found</label>
                        <?php
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="collapse" id="collapsed3">
        <div class="pl1 pr1 table-responsive">
                <table class="table table-bordered tc">
                    <thead>
                        <tr>
                            <th scope="col">Room ID</th>
                            <th scope="col">Accommodation ID</th>
                            <th scope="col">User</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Type of Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = mysqli_query($conn, "SELECT * FROM change_tracking_rooms");
                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['room_id'] ?></td>
                                    <td><?php echo $row['acc_id'] ?></td>
                                    <td><?php echo $row['user'] ?></td>
                                    <td><?php echo $row['timestamp'] ?></td>
                                    <td><?php echo $row['type'] ?></td>
                                </tr>
                            <?php }
                        } else { ?>
                            <label style="color:white;">No entries found</label>
                        <?php
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="collapse" id="collapsed4">
        <div class="pl1 pr1 table-responsive">
                <table class="table table-bordered tc">
                    <thead>
                        <tr>
                            <th scope="col">Complaint ID</th>
                            <th scope="col">Complaint Type</th>
                            <th scope="col">User</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Type of Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = mysqli_query($conn, "SELECT * FROM change_tracking_complaints");
                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['complaint_id'] ?></td>
                                    <td><?php echo $row['complaint_type'] ?></td>
                                    <td><?php echo $row['user'] ?></td>
                                    <td><?php echo $row['timestamp'] ?></td>
                                    <td><?php echo $row['type'] ?></td>
                                </tr>
                            <?php }
                        } else { ?>
                            <label style="color:white;">No entries found</label>
                        <?php
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="collapse" id="collapsed5">
        <div class="pl1 pr1 table-responsive">
                <table class="table table-bordered tc">
                    <thead>
                        <tr>
                            <th scope="col">Jobs ID</th>
                            <th scope="col">Complaint ID</th>
                            <th scope="col">Technician ID</th>
                            <th scope="col">User</th>
                            <th scope="col">Timestamp</th>
                            <th scope="col">Type of Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $result = mysqli_query($conn, "SELECT * FROM change_tracking_jobs");
                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['jobs_id'] ?></td>
                                    <td><?php echo $row['complaint_id'] ?></td>
                                    <td><?php echo $row['technician_id'] ?></td>
                                    <td><?php echo $row['user'] ?></td>
                                    <td><?php echo $row['timestamp'] ?></td>
                                    <td><?php echo $row['type'] ?></td>
                                </tr>
                            <?php }
                        } else { ?>
                            <label style="color:white;">No entries found</label>
                        <?php
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</body>
</html>