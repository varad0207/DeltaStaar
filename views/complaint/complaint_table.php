<?php
include('../../controllers/includes/common.php');
include('../../controllers/complaint_controller.php');
if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights
$isPrivilaged = 0;
if ($_SESSION['rights_complaints'] > 0) {
    $isPrivilaged = $_SESSION['rights_complaints'];
}
else
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>DELTA@STAAR | Complaints</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <!-- CSS files -->
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
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark f3 lh-copy fw5">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="../../images/logo-no-name.png" height="50px" alt="Deltin Logo"
                    class="d-inline-block align-text-top" style="border-radius: 50px;">
            </a>
            <ul class="navbar-nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="adminlogin" onmouseover="this.style.cursor='pointer'"
                        onclick="history.back()">Back</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="table-header">
        <h1 class="tc f1 lh-title spr">All Complaints</h1>
        <!-- <div class="fl w-75 form-outline srch">
        <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
        <h4 id="demo"></h4>
    </div> -->
        <!-- Displaying Database Table -->
        <?php if (!isset($_SESSION['emp_id'])) { ?>
        <form class="requires-validation f3 lh-copy tc" novalidate action="complaint_table.php" method="post">
            <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="Id">
                <option name="employee_code" selected>Choose...</option>

                <?php
                $emp_det = mysqli_query($conn, "SELECT * FROM employee");

                foreach ($emp_det as $row) { ?>
                <option name="employee_code" value="<?= $row["emp_code"] ?>"><?= $row["emp_code"]; ?></option>
                <?php
                }
                    ?>
                </select>
                <button class="btn btn-dark px-3" class="btnn" type="submit" name="save" value="save">Save</button>
            </form>
            <?php
            
        } 
        

        ?>
        <!-- <div class="tr">
        <button class="btn btn-dark">
            <h5><i class="bi bi-filter-circle"> Sort By</i></h5>
        </button>
    </div> -->
    </div>


    <div class="table-div">
        <?php if (isset($_SESSION['message'])): ?>
        <div class="msg">
            <?php
            echo $_SESSION['message'];
            unset($_SESSION['message']);
                    ?>
        </div>
        <?php endif ?>

        <?php
        if (isset($_POST['save'])|| (isset($_SESSION['emp_id']) && $isPrivilaged)) {
            if(isset($_POST['Id']))$emp_code = $_POST['Id'];
            echo "<script>console.log('$emp_code')</script>";
                $results = isset($_SESSION['emp_id'])?mysqli_query($conn, "SELECT * FROM complaints"):mysqli_query($conn, "SELECT * FROM complaints where emp_code='$emp_code'");
            ?>
        
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <th>Complaint Id </th>
                        <th>Raised Time </th>
                        <th>Complaint Category </th>
                        <th>Description </th>
                        <th>Status </th>
                        <th>Closure Time<br>(Technician)</th>
                        
                        <th>Closure Time<br>(Security) </th>
                        <th>Closure Time<br>(Warden) </th>
                        <th>Remarks </th>
                        <th>Employee Name </th>
                        <th>Employee Code </th>
                        <th>Accomodation Name</th>
                        <th>Room Number</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>
                    <?php
                $emp_code = $row['emp_code'];
                $queryEmpName = mysqli_query($conn, "SELECT * FROM employee where emp_code='$emp_code'");
                $EmpName_row = mysqli_fetch_assoc($queryEmpName);
                
                $queryAccName = mysqli_query($conn, "SELECT * FROM accomodation where warden_emp_code='$emp_code'");
                $AccName_row = mysqli_fetch_assoc($queryAccName);
                        ?>
                    <?php
                    $comp_type = $row['type'];
                    $queryCompType = mysqli_query($conn, "SELECT * FROM complaint_type WHERE id='$comp_type'");
                    $CompType_row = mysqli_fetch_assoc($queryCompType);
                    $query = mysqli_query($conn, "SELECT * FROM jobs WHERE complaint_id = '{$row['id']}'");
                
                        ?>
                    <tr>
                        <td>
                            <?php echo $row['id']; ?>
                        </td>
                        <td>
                            <?php echo $row['raise_timestamp']; ?>
                        </td>
                        <!-- fetch complaint category -->
                        <td>
                            <?php echo $CompType_row['type']; ?>
                        </td>
                        <td>
                            <?php echo $row['description']; ?>
                        </td>
                        <td>
                            <?php
                                if (!isset($row['tech_closure_timestamp'])||!isset($row['sec_closure_timestamp'])||!isset($row['warden_closure_timestamp'])) {
                                    echo "<p>Pending</p>";
                                  } else{
                                    echo "<p>Completed</p>";
                                  }
                             ?>
                        </td>
                        <td>
                            <?php echo $row['tech_closure_timestamp']; ?>
                        </td>
                        <td>
                            <?php echo $row['sec_closure_timestamp']; ?>
                        </td>
                        <td>
                            <?php echo $row['warden_closure_timestamp']; ?>
                        </td>
                        <td>
                            <?php echo $row['remarks']; ?>
                        </td>
                        <!-- fetch emp name -->
                        <td>
                            <?php echo $EmpName_row['fname']; ?>
                        </td>
                        <td>
                            <?php echo $row['emp_code']; ?>
                        </td>
                        <!-- fetch acc name -->
                        <td>
                            <?php echo $Acc_row['acc_name']; ?>
                        </td>
                        <td>
                            <?php echo $Room_row['room_no']; ?>
                        </td>
                        <td>

                        <?php 
                            if ($query) {
                            if (mysqli_num_rows($query) > 0) {
                        ?>
                        <b style="color: green;">Job Raised</b>
                        <?php
                            } else {
                        ?>
                        <a href="jobs.php?raise=<?php echo $row['id']; ?>" class="edit_btn" style="color: red;">Raise Job</a>
                        <?php
                            }
                            
                            }
                        ?>

                            
                        </td>
                        <td>
                            <a href="../../controllers/complaint_controller.php?del=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="del_btn">Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
            <?php } ?>
        </div>
    </div>

    <!-- <div class="table-footer pa4">
        <div class="fl w-75 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="tanker.php">Add Tanker</a></h4>
            </button>   
        </div>
    </div> -->

    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>

</html>