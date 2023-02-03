<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/employee_controller.php'); ?>
<?php

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");

if (isset($_GET['edit'])) {
    $emp_code = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM employee WHERE emp_code=$emp_code");

    // if (count($record) == 1 ) {
    $n = mysqli_fetch_array($record);

    $emp_code = $n['emp_code'];
    $fname = $n['fname'];
    $mname = $n['mname'];
    $lname = $n['lname'];
    $designation = $n['designation'];
    $dob = $n['dob'];
    $address = $n['address'];
    $state = $n['state'];
    $country = $n['country'];
    $pincode = $n['pincode'];
    $email = $n['email'];
    $blood_group = $n['blood_group'];
    $department = $n['department'];
    $joining_date = $n['joining_date'];
    $aadhaar_number = $n['aadhaar_number'];
    $salary = $n['salary'];
    $acc_id = $n['acc_id'];

    // }
}
?>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <link href="../../css/sidebar.css" rel="stylesheet">
    

    <link rel="stylesheet" href="../../css/style1.css">
    <link rel="stylesheet" href="../../css/form.css">

    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />

    <title>Sidebar Code</title>

</head>

<body class="bgcolor b ma2">
    
    <!-- Sidebar -->
    <?php
    include '../../controllers/includes/sidebar.php';
    ?>

    <!--Start of Main content-->

    <div id="main">

        <!-- Navigation Bar -->
        
        <nav class="navbar  navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
        <div class="container-fluid">
        <button class="openbtn" onclick="openNav()">&#9776; Menu</button>
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
                            <h1 class="f2 lh-copy tc" style="color: white;">Enter Employee Details</h1>
                            <form class="requires-validation f3 lh-copy" novalidate
                                action="../../controllers/employee_controller.php" method="post">
                                <input type="hidden" name="emp_code" value="<?php echo $emp_code; ?>">

                                <div class="col-md-12 pa2">
                                    <label for="acc_code">Employee Code</label>

                                    <input class="form-control" type="text" name="emp_code" placeholder="Employee Code"
                                        value="<?php echo $emp_code; ?>" value="??php echo $emp_code; ??" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="fname">First Name</label>
                                    <input class="form-control" type="text" name="fname" placeholder="First Name"
                                        value="<?php echo $fname; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="mname">Middle Name</label>
                                    <input class="form-control" type="text" name="mname" placeholder="Middle Name"
                                        value="<?php echo $mname; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="lname">Last Name</label>
                                    <input class="form-control" type="text" name="lname" placeholder="Last Name"
                                        value="<?php echo $lname; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="designation">Designation</label>
                                    <select class="form-select mt-3" name="designation" required>
                                        <option name="employee_desig" selected disabled value="">Select Designation
                                        </option>
                                        <?php
                                        $emp_desig = mysqli_query($conn, "SELECT * FROM employee_designation");

                                        foreach ($emp_desig as $row) { ?>
                                            <option name="employee_desig" value="<?= $row[" id"] ?>">
                                                <?= $row["designation"]; ?>
                                            </option>
                                            <?php
                                        }

                                        ?>
                                    </select>
                                    <div class="invalid-feedback">Please select an option!</div>
                                </div>
                                <div class="col-md-12 pa2">
                                    <label for="dob">Date of Birth</label>
                                    <input class="form-control" type="date" name="dob" value="<?php echo $dob; ?>"
                                        required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="address">Address</label>
                                    <input class="form-control" type="text" name="address" placeholder="Address"
                                        value="<?php echo $address; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="state">State</label>
                                    <input class="form-control" type="text" name="state" placeholder="State"
                                        value="<?php echo $state; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="country">Country</label>
                                    <input class="form-control" type="text" name="country" placeholder="Country"
                                        value="<?php echo $country; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="pincode">Pincode</label>
                                    <input class="form-control" type="number" name="pincode" placeholder="Pincode"
                                        value="<?php echo $pincode; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="email">Email</label>
                                    <input class="form-control" type="email" name="email" placeholder="Email"
                                        value="<?php echo $email; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="blood_group">Blood Group</label>
                                    <select class="form-select mt-3" name="blood_group"
                                        value="<?php echo $blood_group ?>" required>
                                        <option selected disabled value="">Select Blood Group</option>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                    </select>
                                    <div class="invalid-feedback">Please select an option!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="dept">Department</label>
                                    <input class="form-control" type="text" name="department" placeholder="Department"
                                        value="<?php echo $department; ?>" value="??php echo $department; ??" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="joiningdate">Joining Date</label>
                                    <input class="form-control" type="date" name="joining_date"
                                        value="<?php echo $joining_date; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>



                                <div class="col-md-12 pa2">
                                    <label for="aadhar_no">Aadhar Number</label>
                                    <input class="form-control" type="number" name="aadhaar_number"
                                        value="<?php echo $aadhaar_number; ?>" placeholder="Aadhar Number" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="salary">Salary</label>
                                    <input class="form-control" type="number" name="salary" placeholder="Salary"
                                        value="<?php echo $salary; ?>" required>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="acc_id">Accomodation</label>


                                    <select class="form-select mt-3" name="acc_id">
                                        <option name="employee_accomodation" selected disabled value="">Select
                                            Accomodattion
                                        </option>
                                        <?php
                                        $emp_acc = mysqli_query($conn, "SELECT * FROM accomodation");

                                        foreach ($emp_acc as $row) { ?>
                                            <option name="employee_accomodation" value="<?= $row[" acc_id"] ?>">
                                                <?= $row["acc_name"]; ?>
                                            </option>
                                            <?php
                                        }

                                        ?>
                                    </select>

                                    <div class="invalid-feedback">Please select an option!</div>
                                </div>

                                <!-- <div class="col-md-12 pa2">
                            <label for="desig_id">Designation ID</label>
                              <input class="form-control" type="number" name="desig_id" placeholder="Designation ID" required>
                              <div class="valid-feedback">field is valid!</div>
                              <div class="invalid-feedback">field cannot be blank!</div>
                          </div> -->

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



        <!-- Footer -->
        <footer class="tc f3 lh-copy mt6">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>


    </div>

    <!--End of Main content-->

    <!--Scripts for form (as in employee.php)-->
    <script src="../../js/form.js"></script>


    <!--Scripts for Navbar (as in dashboard.php)-->
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <!--Scripts required for Bootstrap and Sidebar-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
</body>

</html>