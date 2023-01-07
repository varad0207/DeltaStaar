<?php
require '../../controllers/includes/common.php';
require '../../controllers/jobs_controller.php';
require '../../controllers/complaint_controller.php';

// raise complaint if logged in
if (isset($_SESSION['emp_id'])) {
    // $_SESSION['emp_code']
    //  display this emp code directly in the form below
}
$warden_id = $_SESSION['emp_id'];
$complaints_id = $_GET['raise'];
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
    <nav class="navbar  navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="../../images/logo-no-name.png" height="50px" alt="Deltin Logo"
                    class="d-inline-block align-text-top" style="border-radius: 50px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: #fff;">Delta@STAAR</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../dashboard.php">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active1" id="adminlogin" onmouseover="this.style.cursor='pointer'"
                                onclick=history.back()>Back</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
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
                                <textarea name="description" placeholder="Please describe your problem" cols="30"
                                    rows="10" value="<?php echo $description; ?>"></textarea>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="completion_date">Completion Date</label>
                                <input class="form-control" type="date" name="completion_date" value="<?php echo $completion_date; ?>" required>
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