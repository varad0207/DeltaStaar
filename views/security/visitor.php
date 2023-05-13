<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/visitor_log_controller.php');
if (!isset($_SESSION["emp_id"])) header("location:../../views/login.php");
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
                        <h1 class="f2 lh-copy tc" style="color: white;">VISITOR LOG FORM</h1>
                        <form class="f3 lh-copy" id="myForm" action="../../controllers/visitor_log_controller.php" method="post">
                            <label for="visitor-type">Visitor Type:</label>
                            <select id="visitor-type" name="visitor-type">
                                <option value="Nota">Select Visitor Category</option>
                                <option name="emp" value="employee">Employee</option>
                                <option name="non-emp" value="non-employee">Non Employee</option>
                            </select>
                            <small></small>
                            <br><br>

                            <!-- div for employee form -->
                            <div id="employee-form" style="display: none;">
                                <div class="col-md-12">
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
                                    <div class="invalid-feedback">Please select an option!</div>
                                    <br>
                                </div>
                                <label name="vehicle-no"for="vehicle-number">Vehicle Number:</label>
                                <input type="text" id="vehicle-number" name="vehiclenumber">
                                <br><br>
                                <label name="purpose"for="purpose-of-visit">Purpose of Visit:</label>
                                <input type="text" id="purpose-of-visit" name="purposeofvisit">
                                <small></small>
                            </div>

                            <!-- div for non-employee form -->
                            <div id="non-employee-form" style="display: none;">
                                <label for="visitor-name">Visitor Name:</label>
                                <input type="text" id="visitor-name" name="visitor-name" placeholder="Your Name">
                                <br><br>
                                <label for="vehicle-number">Vehicle Number:</label>
                                <input type="text" id="vehicle-number" name="vehicle-number" placeholder="Your Vehicle Number">
                                <br><br>
                                <label for="purpose-of-visit">Purpose of Visit:</label>
                                <input type="text" id="purpose-of-visit" name="purpose-of-visit" placeholder="Purpose of the visit">
                                <br><br>
                                <label for="visitor-phone">Visitor Phone:</label>
                                <br><br>
                                <input type="tel" id="visitor-phone" name="visitor-phone" placeholder="Phone Number" style="border-radius:5px;">
                                <small></small>
                            </div>

                            <br><br>
                            <div class="mb-3 tc">
                                <button class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
    <script src="../../js/validateVisitor.js"></script>
</body>

</html>