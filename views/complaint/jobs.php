<?php
require '../../controllers/includes/common.php';
require '../../controllers/jobs_controller.php';
require '../../controllers/complaint_controller.php';

if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
// check rights
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_jobs'] > 1) {
    $isPrivilaged = $rights['rights_jobs'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

$warden_id = $_SESSION['emp_id'];
$complaints_id = $_GET['raise'];
$complaints=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM complaints where complaints.id='$complaints_id'"));
$desc=$complaints['description'];
$update = "";
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $record = mysqli_query($conn, "SELECT * FROM jobs WHERE id=$id");

    $n = mysqli_fetch_array($record);

    $complaint_id = $n['complaint_id'];
    $technician_id = $n['technician_id'];
    $warden_emp_code = $n['warden_emp_code'];
    $raise_timestamp = $n['raise_timestamp'];
    $description = $n['description'];
    $status = $n['status'];
    $tentative_date = $n['tentative_date'];
    $completion_date = $n['completion_date'];
    $remarks = $n['remarks'];

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
    <title>Delta@STAAR | Raise Job</title>
    <meta name="description" content="Complaint submission portal for deltin employees">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
                        <h1 class="f2 lh-copy tc" style="color: white;">Raise Job</h1>
                        <?php if (isset($_SESSION['message'])): ?>
                        <div class="msg">
                            <?php
                            echo $_SESSION['message'];
                            unset($_SESSION['message']);
                            ?>
                        </div>
                        <?php endif ?>
                        <form class="requires-validation f3 lh-copy" novalidate
                            action="../../controllers/jobs_controller.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $id; ?>">
                            <div class="col-md-12 pa2">
                                <label for="complaint_id">Complaint Id</label>
                                <input class="form-control" value="<?php echo $complaints_id; ?>" type="text"
                                    name="complaint_id" required style="pointer-events: none;">
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="warden_emp_code">Raised By</label>
                                <?php
                                $emp_dets = mysqli_query($conn, "SELECT * FROM employee where emp_id=$warden_id");
                                $row2 = mysqli_fetch_array($emp_dets);
                                ?>
                                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref"
                                    name="warden_emp_code" style="pointer-events: none;" required>
                                    <option name="employee_code" value="<?php echo $row2["emp_code"]; ?>" selected><?= $row2["fname"] . " " . $row2["lname"] ?></option>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </select>
                            </div>


                            <div class="col-md-12 pa2">
                                <label for="empcode">Assign Technician</label>

                                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref"
                                    name="technician_id">
                                    <option name="employee_code" selected>Choose...</option>

                                    <?php
                                    $tech_id = mysqli_query($conn, "SELECT * FROM technician");



                                    foreach ($tech_id as $row) {
                                        $emp_det = mysqli_query($conn, "SELECT * FROM employee where emp_id={$row["emp_id"]}");
                                        $row1 = mysqli_fetch_array($emp_det);

                                    ?>

                                    <option name="employee_code" value="<?= $row["id"] ?>"><?= $row1["fname"] ?><?=" " ?><?= $row1["lname"] ?>(<?= $row1["emp_code"]; ?>)
                                    </option>
                                    <?php
                                    }

                                    ?>
                                </select>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="description">Job Description</label>
                                <?php if (isset($_GET['edit'])): ?>
                                <textarea name="description" placeholder="Please describe your problem" cols="30"
                                    rows="10" value="<?php echo $description; ?>"></textarea>
                                <?php else:?>
                                    <textarea name="description" placeholder="Please describe your problem" cols="30"
                                    rows="10" value="<?php echo $desc; ?>"><?php echo $desc; ?></textarea>
                                <?php endif ?>
                            </div>
                                    <!--Backend remaining-->
                            <div class="col-md-12 pa2">
                                <label for="tentative_date">Tentative Completion Date</label>
                                <input class="form-control" type="date" name="tentative_date" value="<?php echo $tentative_date; ?>" min="<?= date('Y-m-d'); ?>" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>
                            <div class="col-md-12 pa2">
                                <label for="completion_date">Completion Date</label>
                                <input class="form-control" type="date" name="completion_date" value="<?php echo $completion_date; ?>" min="<?= date('Y-m-d'); ?>" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="remarks">Remarks</label>
                                <textarea name="remarks" placeholder="Please describe your problem" cols="30"
                                    rows="10" value="<?php echo $remarks; ?>"></textarea>
                            </div>


                            <div class="form-button mt-3 tc">

                                <?php if ($update == true): ?>
                                <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;"
                                    type="submit" name="update" value="update"
                                    style="background: #556B2F;">update</button>
                                <?php else: ?>
                                <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;"
                                    type="submit" name="submit" value="submit">Submit</button>
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
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>