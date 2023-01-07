<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/accomodation_controller.php');
?>
<?php
if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
$acc_code = $acc_name = $bldg_status = $location = $gender = $tot_capacity = $no_of_rooms = $occupied_rooms = $available_rooms = $owner = $remark = "";
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

<!-- Sidebar -->
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

        <a class="navbar-brand mb-2" href="#" style="padding: 8px;">
            <img src="../../images/logo-no-name-circle.png" height="120px" alt="Deltin Logo" class="">
        </a>

        <ul class="nav flex-column p-4" id="nav_accordion" style="--bs-nav-link-hover-color: #f8f9fa;">

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-building"></i>
                    Accommodation
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="#">
                            Add Accommodation
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="accomodation_table.php">
                            Accommodation Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="rooms.php">
                            Add Rooms
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="room_table.php">
                            Rooms Table
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-file-text"></i> Complaints <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../complaint/complaint.php">
                            Raise A Complaint
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../complaint/complaint_table.php">
                            Complaint Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/complaint_type.php">
                            Add Complaint Type
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="../config/complaint_type_table.php">
                            Complaint Type Table
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-person"></i> HRM <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/emp_desig.php">
                            Add Designation Details
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/emp_desig_table.php">
                            Employees Designation Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/employee.php">
                            Add Employee Details
                        </a>
                    </li>
                    
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/employee_table.php">
                            Employees Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/roles.php">
                            Add Role </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/roles_table.php">
                            Roles Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/security_table.php">
                            Security Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/technician_table.php">
                            Technician Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/vaccination.php">
                            Add Vacination Details
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/vaccination_table.php">
                            Vacination Table
                        </a>
                    </li>

                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-shield"></i> Security <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/employee_outing.php">
                            Add Employee Outing
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="../security/employee_outing_table.php">
                            Employee Outings Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/tanker.php">
                            Add Tanker Entry
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/tanker_table.php">
                            Tanker Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/visitor_log.php">
                            Visitor Log Form
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/visitor_log_table.php">
                            Visitor Log Table
                        </a>
                    </li>
                </ul>
            </li>

            <!--
            <li class="nav-item">
                <a class="nav-link" href="#"> Other link </a>
            </li>
            -->
        </ul>

    </div>

    <!-- Navbar -->
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
                        <h1 class="f2 lh-copy tc" style="color: white;">Enter Accomodation Details</h1>
                        <form class="requires-validation f3 lh-copy" novalidate
                            action="../../controllers/accomodation_controller.php" method="post">

                            <div class="col-md-12 pa2">
                                <label for="acc_code">Accomodation Code</label>
                                <input class="form-control" type="text" name="code" value="<?php echo $acc_code ?>"
                                    placeholder="Accomodation Code" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="acc_name">Accomodation Name</label>
                                <input class="form-control" type="text" name="name" value="<?php echo $acc_name ?>"
                                    placeholder="Accomodation Name" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="bldg_status">Building Status</label>
                                <select class="form-select mt-3" name="bldg" value="<?php echo $bldg_status ?>"
                                    required>
                                    <option selected disabled value="">Select status</option>
                                    <option value="Active">Active</option>
                                    <option value="Permanently Closed">Permanently Closed</option>
                                    <option value="Temporarily Closed">Temporarily Closed</option>
                                </select>
                                <!-- <div class="valid-feedback">You selected a position!</div> -->
                                <div class="invalid-feedback">Please select an option!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="location">Location</label>
                                <input class="form-control" type="text" name="loc" value="<?php echo $location ?>"
                                    placeholder="Location " required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="gender">Gender</label>
                                <select class="form-select mt-3" name="gender" value="<?php echo $gender ?>" required>
                                    <option selected disabled value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Femlae</option>
                                    <option value="Unisex">Unisex</option>
                                </select>

                                <div class="invalid-feedback">Please select a gender!</div>
                            </div>

                            <!-- <div class="col-md-12 pa2">
                                <label for="tot_capacity">Total Capacity</label>
                                <input class="form-control" type="number" name="cap" value="<?php echo $tot_capacity ?>"
                                    placeholder="Total Capacity" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div> -->

                            <div class="col-md-12 pa2">
                                <label for="no_of_rooms">Number of Rooms</label>
                                <input class="form-control" type="number" id="nor" name="rooms"
                                    value="<?php echo $no_of_rooms ?>" placeholder="Number of Rooms" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
						<label class="d-block mb-4"> <span class="d-block mb-2">Warden Employee Code <span></span>

								<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="warden_emp_code">
									<option name="employee_code" selected>Choose...</option>

									<?php
                            $emp_det = mysqli_query($conn, "SELECT * FROM employee");

                            foreach ($emp_det as $row) { ?>
									<option name="employee_code" value="<?= $row["emp_code"] ?>"><?= $row["emp_code"]; ?>
									</option>
									<?php
                            }

                                ?>
								</select>
					</div>

                            <!-- <div class="col-md-12 pa2">
                                <label for="occupied_rooms">Occupied Rooms</label>
                                <input class="form-control" type="number" id="occnor" name="orooms"
                                    value="<?php echo $occupied_rooms ?>" placeholder="Number of Rooms Occupied"
                                    required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div> -->

                            <!-- <div class="col-md-12 pa2">
                                <label for="available_rooms">Available Number of Rooms</label>
                                <input class="form-control" type="number" id="avr" name="arooms"
                                    value="<?php echo $available_rooms ?>" placeholder="Availabe number of Rooms"
                                    onclick="calc()" required>
                                <p id="avrp" style="display: none;color:red;">Invalid Input!</p>

                            </div> -->

                            <div class="col-md-12 pa2">
                                <label for="owner">Owner</label>
                                <input class="form-control" type="text" name="owner" value="<?php echo $owner ?>"
                                    placeholder="Owner" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 pa2">
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