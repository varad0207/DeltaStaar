<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/employee_controller.php'); ?>
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

if (isset($_GET['edit'])) {
    $emp_code = $_GET['edit'];
    $update = true;
    // echo $emp_code;
    $record = mysqli_query($conn, "SELECT * FROM employee WHERE emp_code='$emp_code'");

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
    $contact = $n['contact'];
    $accid = '';

    $sql2 = mysqli_query($conn, "SELECT * FROM rooms WHERE id='$room_id'");
    $n1 = mysqli_fetch_assoc($sql2);
    @$accid = $n1['acc_id'];
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
    <?php if (isset($_GET['edit'])) : ?>
        <title>Delta@STAAR | Edit Employees</title>
    <?php else : ?>
        <title>Delta@STAAR | Add Employees</title>
    <?php endif ?>    
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="b ma2">
    <!-- Sidebar and Navbar -->
    <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>

    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                    <?php if (isset($_GET['edit'])) : ?>
                        <h1 class="f2 lh-copy tc" style="color: white;">Edit Employee Details</h1>
                        <?php else : ?>
                            <h1 class="f2 lh-copy tc" style="color: white;">Enter Employee Details</h1>
                            <?php endif ?> 
                        <form class="f3 lh-copy" action="../../controllers/employee_controller.php" method="post" id="myForm">
                            <input type="hidden" name="emp_code" value="<?php echo $emp_code; ?>">
                            <input type="hidden" name="emp_id" value="<?php echo $emp_id; ?>">


                            <div class="col-md-12 pa2">
                                <label for="emp_code">Employee Code</label>
                                <input class="form-control" type="text" name="emp_code" id="empcode" placeholder="Employee Code" value="<?php echo $emp_code; ?>">
                                <small></small>
                            </div>
                            <div id="phpJS">
                                <?php
                                $sql1 = mysqli_query($conn, "SELECT * FROM employee");
                                $a = array();
                                foreach ($sql1 as $row1) {
                                    $op = $row1['emp_code'];
                                    array_push($a, $op);
                                }
                                ?>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="fname">First Name</label>
                                <input class="form-control" type="text" name="fname" id="fname" placeholder="First Name" value="<?php echo $fname; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="mname">Middle Name</label>
                                <input class="form-control" type="text" name="mname" id="mname" placeholder="Middle Name" value="<?php echo $mname; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="lname">Last Name</label>
                                <input class="form-control" type="text" name="lname" id="lname" placeholder="Last Name" value="<?php echo $lname; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="designation">Designation</label>
                                <select class="form-select mt-3" name="designation" id="desig" required>
                                    <option name="employee_desig" selected disabled value="">Select Designation</option>
                                    <?php
                                    $emp_desig = mysqli_query($conn, "SELECT * FROM employee_designation");

                                    foreach ($emp_desig as $row) { ?>
                                        <option value="<?= $row["id"] ?>" name="employee_desig" <?php if ($designation == $row['id']) { ?> selected <?php } ?>><?= $row["designation"]; ?>
                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="dob">Date of Birth</label>
                                <input class="form-control" type="date" name="dob" id="dob" value="<?php echo $dob; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="address">Address</label>
                                <input class="form-control" type="text" name="address" placeholder="Address" value="<?php echo $address; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="state">State</label>
                                <input class="form-control" type="text" name="state" id="state" placeholder="State" value="<?php echo $state; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="country">Country</label>
                                <input class="form-control" type="text" name="country" id="country" placeholder="Country" value="<?php echo $country; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="pincode">Pincode</label>
                                <input class="form-control" type="number" name="pincode" id="pin" placeholder="Pincode" value="<?php echo $pincode; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="contact1">Contact Number</label>
                                <input class="form-control" type="tel" name="contact1" id="phone" placeholder="Contact Number" value="<?php echo $contact; ?>">
                                <small></small>
                            </div>


                            <div class="form-field col-md-12 pa2">
                                <label for="email">Email</label>
                                <input class="form-control" type="email" name="email" id="email" placeholder="Email" value="<?php echo $email; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="blood_group">Blood Group</label>
                                <select class="form-select mt-3" name="blood_group" value="<?php echo $blood_group ?>">
                                    <option selected disabled value="">Select Blood Group</option>
                                    <option value="A+" <?php if ($blood_group == 'A+') { ?> selected <?php } ?>>A+</option>
                                    <option value="A-" <?php if ($blood_group == 'A-') { ?> selected <?php } ?>>A-</option>
                                    <option value="B+" <?php if ($blood_group == 'B+') { ?> selected <?php } ?>>B+</option>
                                    <option value="B-" <?php if ($blood_group == 'B-') { ?> selected <?php } ?>>B-</option>
                                    <option value="O+" <?php if ($blood_group == 'O+') { ?> selected <?php } ?>>O+</option>
                                    <option value="O-" <?php if ($blood_group == 'O-') { ?> selected <?php } ?>>O-</option>
                                    <option value="AB+" <?php if ($blood_group == 'AB+') { ?> selected <?php } ?>>AB+</option>
                                    <option value="AB-" <?php if ($blood_group == 'AB-') { ?> selected <?php } ?>>AB-</option>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="department">Department</label>
                                <select class="form-select mt-3" name="department" id="dept">
                                    <option name="employee_dept" selected disabled value="">Select Department</option>
                                    <?php
                                    $emp_dept = mysqli_query($conn, "SELECT * FROM employee_dept");

                                    foreach ($emp_dept as $row) { ?>
                                        <option name="employee_dept" value="<?= $row["dept_id"] ?>" <?php if ($department == $row['dept_id']) { ?> selected <?php } ?>>
                                            <?= $row["dept_name"]; ?>
                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="joiningdate">Joining Date</label>
                                <input class="form-control" type="date" name="joining_date" max="<?= date('Y-m-d'); ?>" value="<?php echo $joining_date; ?>">
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="aadhar_no">Aadhar Number</label>
                                <input class="form-control" type="number" name="aadhaar_number" id="ano" value="<?php echo $aadhaar_number; ?>" placeholder="Aadhar Number">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="salary">Salary</label>
                                <input class="form-control" type="number" name="salary" placeholder="Salary" value="<?php echo $salary; ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="acc_id">Accomodation</label>

                                <select class="form-select mt-3" name="acc_id" id="select_acc" onchange="GetDetail()">
                                    <option selected disabled value=""> Select Accommodation </option>
                                    <?php
                                    $emp_acc = mysqli_query($conn, "SELECT * FROM accomodation");
                                    foreach ($emp_acc as $row) { ?>
                                        <option name="employee_accomodation" value="<?= $row["acc_id"] ?>" <?php if (@$accid == $row['acc_id']) { ?> selected <?php } ?>>
                                            <?= $row["acc_name"]; ?>
                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="room_id">Room</label>
                                <input type="hidden" value="<?php echo $room_id; ?>" name="existing_room">
                                <select class="form-select mt-3" name="room_id" id="room">
                                    <option selected disabled value="">Select Room Number</option>
                                    <?php
                                    $emp_room = mysqli_query($conn, "SELECT * FROM rooms");
                                    foreach ($emp_room as $row) { ?>
                                        <option name="emp_room" value="<?= $row['id'] ?>" <?php if ($room_id == $row['id']) { ?> selected <?php } ?>>
                                            <?= $row['room_no']; ?>
                                        </option>
                                    <?php } ?>

                                </select>
                                <small></small>
                            </div>

                            <div class="form-button mt-3 tc">
                                <?php if ($update == true) : ?>
                                    <button id="submit" name="update" value="update" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                                <?php else : ?>
                                    <button id="submit" name="submit" value="sumbit" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
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
        function GetDetail() {

            var select = document.getElementById("room");
            while (select.firstChild) {
                select.removeChild(select.firstChild);
            }
            var selectedValue = document.getElementById("select_acc").value;
            console.log(selectedValue)
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var myObj = JSON.parse(this.responseText);
                    var el = document.createElement("option");
                    el.textContent = "Select Room Number";
                    // console.log(selectedValue);

                    el.value = "";
                    el.disabled = true;
                    el.defaultSelected = true;
                    select.appendChild(el);

                    for (var key in myObj) {
                        var el = document.createElement("option");
                        el.textContent = myObj[key];
                        el.value = key;
                        select.appendChild(el);
                    }
                }
            };
            xmlhttp.open("GET", "../../controllers/validation.php?acc=" + selectedValue, true);
            xmlhttp.send();
        }
        window.onload = GetDetail;
    </script>
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateEmp.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>