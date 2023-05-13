<?php include('../../controllers/includes/common.php');
include('../../controllers/rooms_controller.php');

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_rooms'] > 1) {
    $isPrivilaged = $rights['rights_rooms'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

$update = "";
$acc_id = "";
if (isset($_GET['edit'])) {
    $room_id = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM rooms WHERE id=$room_id");

    $n = mysqli_fetch_array($record);

    $acc_id = $n['acc_id'];
    echo $acc_id;
    $room_no = $n['room_no'];
    $room_cap = $n['room_capacity'];
    $status = $n['status'];
    $curr_room_cap = $n['current_room_occupancy'];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Room</title>
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="b ma2">
    <style>
        span{
            color: gold;
            font-size: 14px;
        }
    </style>
    <!-- Sidebar and Navbar-->
    <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Enter Room Details</h1>
                        <form class="f3 lh-copy" action="../../controllers/rooms_controller.php" method="post" id="myForm" >
                            <input class="form-control" type="hidden" name="id" value="<?php echo $room_id ?>">

                            <div class="col-md-12 pa2">
                                <label for="accomodation">Accomodation</label>
                                <select class="form-select mt-3" name="acc" id="acc">
                                    <option selected disabled value="">Select Accomodation</option>
                                    <?php
                                    $acc_code = mysqli_query($conn, "SELECT * FROM accomodation");
                                    // $accrow = mysqli_fetch_assoc($acc_code);
                                    // $no_of_rooms = $accrow['no_of_rooms'];
                                    foreach ($acc_code as $row) { ?>
                                        <option name="acc" value="<?= @$row["acc_id"] ?>"
                                            <?php 
                                            $acc_id = @$row['acc_id'];
                                            $sql2 = mysqli_query($conn, "SELECT COUNT(id) AS count_room FROM `rooms` WHERE acc_id='$acc_id' GROUP BY `acc_id`");
                                            $roomCount = mysqli_fetch_array($sql2);
                                            $room_count = @$roomCount['count_room'];
                                            if(@$acc_id == @$row['acc_id']) { 
                                                if(@$room_count < @$row['no_of_rooms']) { ?> 
                                                 
                                            <?php } 
                                            else { ?>
                                                disabled
                                            <?php } ?>>
                                            <?= @$row['acc_name']; ?>
                                            <?php } ?>
                                        </option>
                                    <?php } ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="room_no">Room Number</label>
                                <input class="form-control" type="number" name="room_no" id="rommno" value="<?php echo $room_no ?>" placeholder="Room Number">
                                <small></small>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="room_cap">Room Capacity</label>
                                <input class="form-control" type="number" name="room_cap" id="roomcap" value="<?php echo $room_cap ?>" placeholder="Room Capacity">
                                <small></small>
                            </div>

                            <div class="form-button mt-3 tc">
                                <?php if ($update == true): ?>
                                    <button id="submit" name="update" value="update" type="submit"
                                        class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                                <?php else: ?>
                                    <button id="submit" name="submit" value="submit" type="submit"
                                        class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
                                <?php endif ?>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <!-- Script files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateRoom.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>