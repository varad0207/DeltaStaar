<?php
include('../../controllers/includes/common.php');
include('../../controllers/employee_controller.php');

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights
$isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_employee_details'] > 0) {
        $isPrivilaged = $rights['rights_employee_details'];
    }
else
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

if(isset($_GET["id"])){
    $empid =$_GET["id"];
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
    <title>DELTA@STAAR | Employee Details</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <!-- CSS files -->
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/table.css">
    <!-- Live Search -->
    <script type="text/javascript">
        function search() {
            // Declare variables
            var input, filter, listing, i, txtValue;
            input = document.getElementById("form1");
            filter = input.value.toUpperCase();
            listing = document.getElementsByTagName("tr");
            // Loop through all 
            for (i = 0; i < listing.length; i++) {
                if (listing[i]) {
                    txtValue = listing[i].textContent || listing[i].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        listing[i].style.display = "";
                    } else {
                        listing[i].style.display = "none";
                        //   document.getElementById("demo").innerHTML = "No Results Found";
                    }
                }
            }
        }
    </script>
</head>
<body class="bg">
    <!-- Sidebar and Navbar-->
    <?php
   include '../../controllers/includes/sidebar.php';
   include '../../controllers/includes/navbar.php';
   ?>


    <div class="table-header">
        <h1 class="tc f1 lh-title spr">Employee Details</h1>
    </div>


        <?php
        $query = "SELECT * FROM employee JOIN employee_designation ON employee_designation.id = employee.designation AND employee.emp_code='$empid'";
        $res = mysqli_query($conn, $query);
        ?>
           
        
        <div class="card">
            
            <div class="card-body">
                <h3 class="card-title">Personal Details</h3>
                <?php while($row = mysqli_fetch_array($res)){
                    ?>
                <p class="card-text"><b>Employee code : </b><?php echo $row['emp_code']; ?></p>
                <p class="card-text"><b>Employee Name : </b><?php echo $row['fname'];
                echo " "; echo $row['lname']; ?></p>
                <p class="card-text"><b>Designation : </b><?php echo $row['designation']; ?></p>
                <p class="card-text"><b>Date of birth : </b><?php echo date('d-m-Y', strtotime($row['dob'])); ?></p>
                <p class="card-text"><b>Address : </b><?php echo $row['address']; ?></p>
                <p class="card-text"><b>State : </b> <?php echo $row['state']; ?></p>
                <p class="card-text"><b>Country : </b><?php echo $row['country']; ?></p>
                <p class="card-text"><b>Pincode : </b><?php echo $row['pincode']; ?></p>
                <p class="card-text"><b>Contact : </b><?php echo $row['contact']; ?></p>
                <p class="card-text"><b>Email : </b><?php echo $row['email']; ?></p>
                <p class="card-text"><b>Blood group : </b><?php echo $row['blood_group']; ?></p>
                <p class="card-text"><b>Department : </b><?php echo $row['department']; ?></p>
                <p class="card-text"><b>Joining Date : </b><?php echo date('d-m-Y', strtotime($row['joining_date'])); ?></p>
                <p class="card-text"><b>Aadhar number : </b><?php echo $row['aadhaar_number']; ?></p>
                <p class="card-text"><b>Salary : </b><?php echo $row['salary']; ?></p>
                <p class="card-text"><b></b></p>
            </div>
            <?php }?>
            
        </div>  
        <br>
        <a href="employee_table.php" class="btn btn-success">Back</a>
</body> 
