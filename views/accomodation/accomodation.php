<?php include('../../controllers/includes/common.php');
include('../../controllers/accomodation_controller.php');


if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");

// check rights
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_accomodation'] > 1) {
    $isPrivilaged = $rights['rights_accomodation'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

$acc_code = $acc_name = $bldg_status = $location = $gender = $tot_capacity = $no_of_rooms = $occupied_rooms = $available_rooms = $owner = $remark = $warden_emp_code = "";
if (isset($_GET['edit'])) {
    $acc_code = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_code=$acc_code");

    $n = mysqli_fetch_array($record);

    $acc_code = $n['acc_code'];
    $acc_name = $n['acc_name'];
    $bldg_status = $n['bldg_status'];
    $location = $n['location'];
    $gender = $n['gender'];
    $tot_capacity = $n['tot_capacity'];
    $no_of_rooms = $n['no_of_rooms'];
    $warden_emp_code = $n['warden_emp_code'];
    $occupied_rooms = $n['occupied_rooms'];
    $available_rooms = $n['available_rooms'];
    $owner = $n['owner'];
    $remark = $n['remark'];
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
    <title>Delta@STAAR | Add Accommodation</title>

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
                        <h1 class="f2 lh-copy tc" style="color: white;">Enter Accomodation Details</h1>
                        <form class="f3 lh-copy" action="../../controllers/accomodation_controller.php" method="post" id="myForm">

                            <div class="form-field col-md-12 pa2">
                                <label for="acc_code">Accomodation Code</label>
                                <input class="form-control" type="text" name="code" id="acccode" value="<?php echo $acc_code ?>" placeholder="Accomodation Code" <?php if(isset($_GET['edit'])) echo "readonly"; ?>>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="acc_name">Accomodation Name</label>
                                <input class="form-control" type="text" name="name" id="accname" value="<?php echo $acc_name ?>" placeholder="Accomodation Name">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="bldg_status">Building Status</label>
                                <select class="form-select mt-3" name="bldg" id="bldg" value="<?php echo $bldg_status ?>">
                                    <option selected disabled value="">Select status</option>
                                    <option value="Active"
                                    <?php if($bldg_status == 'Active') { ?>
                                        selected
                                    <?php } ?>
                                    >Active</option>
                                    <option value="Permanently Closed" 
                                    <?php if($bldg_status == 'Permanently Closed') { ?>
                                        selected
                                    <?php } ?>
                                    >Permanently Closed</option>
                                    <option value="Temporarily Closed" 
                                    <?php if($bldg_status == 'Temporarily Closed') { ?>
                                        selected
                                    <?php } ?>
                                    >Temporarily Closed</option>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="location">Location</label>
                                <select class="form-select mt-3" name="loc" id="loc">
                                    <option name="acc_loc" selected disabled value="">Select Location</option>
                                    <?php
                                    $acc_loc = mysqli_query($conn, "SELECT * FROM acc_locations");

                                    foreach ($acc_loc as $row) { ?>
                                        <option name="acc_loc" value="<?= $row["loc_id"] ?>"
                                        <?php if($location == $row['loc_id']) { ?>
                                            selected
                                        <?php } ?>>
                                            <?= $row["location"]; ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="gender">Gender (Accommodation for which gender)</label>
                                <select class="form-select mt-3" name="gender" id="gender" value="<?php echo $gender ?>">
                                    <option selected disabled value="">Select Gender</option>
                                    <option value="Male"
                                    <?php if($gender == 'Male') { ?>
                                        selected
                                    <?php } ?>
                                    >Male</option>
                                    <option value="Female"
                                    <?php if($gender == 'Female') { ?>
                                        selected
                                    <?php } ?>
                                    >Female</option>
                                    <option value="Unisex"
                                    <?php if($gender == 'Unisex') { ?>
                                        selected
                                    <?php } ?>
                                    >Unisex</option>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="no_of_rooms">Number of Rooms</label>
                                <input class="form-control" type="number" id="nor" name="rooms" value="<?php echo $no_of_rooms ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label class="d-block mb-4">Warden Employee Code</label>
                                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="warden_emp_code">
                                <option name="employee_code" selected>Choose...</option>
                                <?php
                                $emp_det = mysqli_query($conn, "SELECT * FROM employee");
                                foreach ($emp_det as $row) { ?>
                                    <option name="employee_code" value="<?= $row["emp_code"] ?>"
                                    <?php if($warden_emp_code == $row['emp_code']) { ?>
                                        selected
                                    <?php } ?>>
                                    <?= $row["emp_code"]. "-" .$row["fname"]." ".$row["lname"]; ?>
                                    </option>
                                <?php } ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="owner">Owner</label>
                                <input class="form-control" type="text" name="owner" id="owner" value="<?php echo $owner ?>" placeholder="Owner">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="description">Remark</label>
                                <textarea name="remark" value="<?php echo $remark ?>" placeholder="Enter remark if any"
                                cols="30" rows="10"></textarea>
                            </div>


                            <div class="form-button mt-3 tc">
                                <?php if ($update == true): ?>
                                    <button id="submit" name="update" value="update" type="submit"
                                        class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                                <?php else: ?>
                                    <button id="submit" name="submit" value="sumbit" type="submit"
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
    <script src="../../js/form.js"></script>
    <script>
        function calc() {
            var nor = document.getElementById("nor").value;
            var occnor = document.getElementById("occnor").value;
            var roomsum = parseInt(nor) - parseInt(occnor);
            if (parseInt(roomsum) > 0) {
                document.getElementById("avr").value = roomsum;
                document.getElementById("avrp").style.display = "none";
            } else {
                document.getElementById("avrp").style.display = "block";
            }
        }
    </script>
    <!-- Script files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateAcc.js"></script>
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