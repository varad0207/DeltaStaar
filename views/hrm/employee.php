<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/employee_controller.php'); ?>
<?php

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");

if (isset($_GET['edit'])) {
    $emp_code = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM employee WHERE emp_code=$emp_code");

    $n = mysqli_fetch_array($record);
    $emp_id = $n['emp_id'];
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
    $room_id = $n['room_id'];
    // $for_contacts = mysqli_query($conn, "SELECT * FROM contact WHERE emp_id='{$n['emp_id']}'");
    // $contacts = mysqli_fetch_array($for_contacts);
    // $contact1 = $contacts['primary_contact'];
    // $contact2 = $contacts['secondary_contact'];
    // $contact_id = $contacts['id'];
    $contact = $n['contact'];

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
    <title>Delta@STAAR | Add Employees</title>
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

    <!-- Sidebar and Navbar -->
    <?php
    include '../../controllers/includes/sidebar.html';
    include '../../controllers/includes/navbar.html';
    ?>

    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Enter Employee Details</h1>
                        <form class="requires-validation f3 lh-copy" novalidate
                            action="../../controllers/employee_controller.php" method="post">
                            <input type="hidden" name="emp_code" value="<?php echo $emp_code; ?>">
                            <!-- <input type="hidden" name="contacts_id" value="<?php //echo $contact_id; ?>"> -->
                            <input type="hidden" name="emp_id" value="<?php echo $emp_id; ?>">


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
                                    <option name="employee_desig" selected disabled value="">Select Designation</option>
                                    <?php
                                    $emp_desig = mysqli_query($conn, "SELECT * FROM employee_designation");

                                    foreach ($emp_desig as $row) { ?>
                                        <option name="employee_desig" value="<?= $row["id"] ?>">
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
                                <input class="form-control" type="date" name="dob" value="<?php echo $dob; ?>" required>
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
                                <label for="contact1">Contact Number</label>
                                <input class="form-control" type="tel" name="contact1" placeholder="Contact Number"
                                    value="<?php echo $contact; ?>" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>
                            <!-- <div class="col-md-12 pa2">
                                <label for="contact2">Secondary Contact Number</label>
                                <input class="form-control" type="number" name="contact2" placeholder="Contact Number"
                                    value="<?php //echo $contact2; ?>">
                                 <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div> -->

                            <div class="col-md-12 pa2">
                                <label for="email">Email</label>
                                <input class="form-control" type="email" name="email" placeholder="Email"
                                    value="<?php echo $email; ?>" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="blood_group">Blood Group</label>
                                <select class="form-select mt-3" name="blood_group" value="<?php echo $blood_group ?>"
                                    required>
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
                                <select class="form-select mt-3" name="acc_id" id="accList" onchange="myfunc()">
                                    <option name="employee_accomodation" selected disabled value="">Select Accomodation
                                    </option>
                        
                                <?php $emp_acc = mysqli_query($conn, "SELECT * FROM accomodation");
                                    $empAcc_row = mysqli_fetch_assoc($emp_acc);
                                    foreach ($emp_acc as $row) { ?>
                                        <option name="employee_accomodation" value="<?= $row["acc_id"] ?>">
                                            <?= $row["acc_name"]; ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                    </select>
                                <div class="invalid-feedback">Please select an option!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="room_id">Room</label>
                                <select class="form-select mt-3" name="room_id">
                                    
                                    <option name="employee_room" selected disabled value="">Select room
                                    </option>
                                    <?php
                                    // $accid = $empAcc_row['acc_id'];
                                    $emp_room = mysqli_query($conn, "SELECT * FROM rooms");
                                    
                                    foreach ($emp_room as $row) { 
                                        if($row['status'] == 'Occupied') {
                                        ?>
                                        <option name="employee_room" disabled value="<?= $row["id"] ?>">
                                            <?= $row["room_no"]; ?>
                                        </option>
                                        <?php } 
                                        elseif($row['status'] == 'Available') {
                                        ?>
                                        <option name="employee_room" value="<?= $row["id"] ?>">
                                            <?= $row["room_no"]; ?>
                                        </option>
                                        <?php
                                        }
                                        else {
                                        ?>
                                        <option name="employee_room" value="<?= $row["id"] ?>">
                                            <?= $row["room_no"]; ?>
                                        </option>
                                        <?php 
                                        }
                                        
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
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
    
    <!-- Script files -->
    <script>
        function myfunc() {
            var x = document.getElementById("accList").value;
            func(x);
        }
    </script>
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
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