<?php 
include('../../controllers/includes/common.php');
include('../../controllers/visitor_log_controller.php');
if (!isset($_SESSION["emp_id"])) 
header("location:../../index.php");
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_visitor_log'] > 1) {
    $isPrivilaged = $rights['rights_visitor_log'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if($_SESSION['is_superadmin'] == 1){
    die('<script>alert("You dont have access to this page, Please contact security");window.location = history.back();</script>');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Visitor</title>

    <meta name="description" content="Employee Addition portal for deltin employees">
    <link rel="stylesheet" href="../../css/form.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
                        <h1 class="f2 lh-copy tc" style="color: white;">Visitor Log</h1>
                        <form class="f3 lh-copy" id="myForm" action="../../controllers/visitor_log_controller.php" method="post">
                            <div class="col-md-12 pa2">
                                <label for="visitor-type">Visitor Type:</label>
                                <select id="visitor-type" name="visitor-type">
                                    <option value="Nota">Select Visitor Category</option>
                                    <option name="emp" value="employee">Employee</option>
                                    <option name="non-emp" value="non-employee">Non Employee</option>
                                </select>
                                <small></small>
                            </div>

                            <div id="employee-form" style="display: none;">
                                <div class="col-md-12 pa2">
                                    <label for="empcode">Employee Code</label>
                                    <select class="form-select mt-3" name="emp_id" id="empid">
                                            <option selected disabled value="" name="employee_code">Select Employee Code</option>
                                            <?php $emp_code = mysqli_query($conn, "SELECT * FROM employee");
                                            foreach ($emp_code as $row) { ?>
                                                <option name="employee_code" value="<?= $row["emp_id"] ?>"><?= $row["emp_code"]; ?></option>
                                            <?php
                                            }
                                            ?>
                                    </select>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="vehicle-number">Vehicle Number</label>
                                    <input type="text" name="evehiclenumber" id="empVNo" placeholder="Vehicle Number">
                                    <small></small>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="purpose-of-visit">Purpose of Visit</label>
                                    <input type="text" name="epurposeofvisit" id="empPurpose" placeholder="Purpose">
                                    <small></small>
                                </div>
                            </div>
                            
                            <div id="non-employee-form" style="display: none;">
                                <div class="col-md-12 pa2">
                                    <label for="visitorName">Visitor Name</label>
                                    <input type="text" name="visitor-name" id="visitor" placeholder="Visitor Name">
                                    <small></small>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="vehicleno">Vehicle Number</label>
                                    <input type="text" name="vehiclenumber" id="nempVNo" placeholder="Vehicle Number">
                                    <small></small>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="purpose">Purpose of Visit</label>
                                    <input type="text" name="purposeofvisit" id="nempPurpose" placeholder="Purpose">
                                    <small></small>
                                </div>

                                <div class="col-md-12 pa2">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" name="visitor-phone" id="visitor-phone" placeholder="Phone Number">
                                    <small></small>
                                </div>
                            </div>

                            <div class="form-button mt-3 tc">
                                <button class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <script>
        const visitorTypeSelect = document.getElementById('visitor-type');
        const employeeForm = document.getElementById('employee-form');
        const nonEmployeeForm = document.getElementById('non-employee-form');

        visitorTypeSelect.addEventListener('change', (event) => {
            if (event.target.value === 'employee') {
                employeeForm.style.display = 'block';
                nonEmployeeForm.style.display = 'none';
            } else if (event.target.value === 'non-employee') {
                employeeForm.style.display = 'none';
                nonEmployeeForm.style.display = 'block';
            } else {
                employeeForm.style.display = 'none';
                nonEmployeeForm.style.display = 'none';
            }
        });
    </script>
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateVisitor.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
</body>

</html>