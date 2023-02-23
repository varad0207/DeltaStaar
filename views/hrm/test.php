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
} else
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
    <title>DELTA@STAAR | Employee Details</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <!-- CSS files -->
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/table.css">
    <link rel="stylesheet" href="../../css/form.css">
    <!-- Live Search -->

    <script type="text/javascript">
        function search() {
            // Declare variables
            var input, filter, listing, i, txtValue;
            input = document.getElementById("form1");
            filter = input.value.toUpperCase();
            listing = document.getElementsByClassName("live");
            // Loop through all 
            for (i = 0; i < listing.length; i++) {
                if (listing[i]) {
                    txtValue = listing[i].textContent || listing[i].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        listing[i].style.display = "";
                    } else {
                        listing[i].style.display = "none";
                        // document.getElementById("demo").innerHTML = "No Results Found";
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

    <h1 class="tc f1 lh-title spr">Employee Details</h1>
    <div class="item fl w-50 pa1">
        <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
    </div>
    <div class="fl w-50 pa1">
        <form action="" method="post" class="myForm">
            <div class="input-group mb-3">
                <select name="sort_alpha" class="form-control">
                    <option value="">--Select Option--</option>
                    <option value="a-z" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "a-z") echo "selected"; ?>>A-Z(Ascending Order)</option>
                    <option value="z-a" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "z-a") echo "selected"; ?>>Z-A(Descending Order)</option>
                </select>
                <button class="btn btn-light btn-outline-dark">
                    <i class="bi bi-filter-circle">Sort By</i>
                </button>
            </div>
        </form>
    </div>

    <!-- FILTERING DATA -->
    <div class="pa1">
        <br>
        <form action="" method="GET">
            <label style="color:white;">Filter By</label>
            <button type="sumbit" class="btn btn-light">Go</button>
            <button type="reset" class="btn btn-light">Reset</button>
            <br>
            <br>
            <table class="table">
                <thead>
                    <th>Designation : </th>
                    <th>Department : </th>
                    <th>Joining Date : </th>

                </thead>
                <tbody>
                    <tr>
                        <td>
                            <?php
                            $fetch_desig = "SELECT * FROM employee_designation";
                            $fetch_desig_run = mysqli_query($conn, $fetch_desig);
                            if (mysqli_num_rows($fetch_desig_run) > 0) {
                                foreach ($fetch_desig_run as $desig) {
                                    $checked1 = [];
                                    if (isset($_GET['designation'])) {
                                        $checked1 = $_GET['designation'];
                                    }
                            ?>
                                    <div>
                                        <input type="checkbox" name="designation[]" value="<?= $desig['id']; ?>" <?php if (in_array($desig['id'], $checked1)) {
                                                                                                                        echo "checked";
                                                                                                                    }
                                                                                                                    ?>>
                                        <label><?= $desig['designation']; ?></label>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "No designation availabe";
                            }
                            ?>
                        </td>
                        <td>
                            <?php
                            $fetch_dept = "SELECT * FROM employee_dept";
                            $fetch_dept_run = mysqli_query($conn, $fetch_dept);
                            if (mysqli_num_rows($fetch_dept_run) > 0) {
                                foreach ($fetch_dept_run as $dept) {
                                    $checked2 = [];
                                    if (isset($_GET['department'])) {
                                        $checked2 = $_GET['department'];
                                    }
                            ?>
                                    <div>
                                        <input type="checkbox" name="department[]" value="<?= $dept['dept_id']; ?>" <?php if (in_array($dept['dept_id'], $checked2)) {
                                                                                                                        echo "checked";
                                                                                                                    }
                                                                                                                    ?>>
                                        <label><?= $dept['dept_name']; ?></label>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "No designation availabe";
                            }
                            ?>
                        </td>
                        <td>
                            <label>From Date :- </label>
                            <input type="date" name="start_date" value="<?php if (isset($_POST['start_date']))
                                                                            echo $_POST['start_date']; ?>">
                            <br>
                            <br>
                            <label>To Date:- </label>
                            <input type="date" name="end_date" value="<?php  if (isset($_POST['end_date']))
                                                                            echo $_POST['end_date']; ?>"><br>

                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>

    <?php
    $sort_condition = "";
    if (isset($_POST['sort_alpha'])) {
        if ($_POST['sort_alpha'] == "a-z") {
            $sort_condition = "ASC";
        } else if ($_POST['sort_alpha'] == "z-a") {
            $sort_condition = "DESC";
        }
    }

    $sql="SELECT * from employee JOIN employee_designation on employee_designation.id = employee.designation join employee_dept on employee.department=employee_dept.dept_id where 1=1";
    if(isset($_GET['designation'])){
        $designation_checked = [];
        $designation_checked = $_GET['designation'];
        $sql.=" and ( ";
        foreach ($designation_checked as $row_desig) {
            $sql .= " employee.designation=$row_desig or";
        }
        $sql=substr($sql,0,strripos($sql,"or"));  
        $sql.=" ) ";
        // echo $sql;
    }
    if(isset($_GET['department'])){
        $department_checked = [];
        $department_checked = $_GET['department'];
        $sql.=" and ( ";
        foreach ($department_checked as $row_dept) {
            $sql .= " employee.department=$row_dept or";
        }
        $sql=substr($sql,0,strripos($sql,"or"));  
        $sql.=" ) ";
        // echo $sql;
    }
    if (isset($_GET['start_date'])) {
        // $start_date=date("Y-m-d",($_GET['start_date'])); 
        // echo $start_date;
        $_GET['start_date']!=""?$sql .= " and joining_date>='{$_GET['start_date']}' ":$a=0;
            // echo $sql;

    }
    if (isset($_GET['end_date'])) {
        // $end_date=date("Y-m-d",($_GET['end_date'])); 
        $_GET['end_date']!=""?$sql .= " and joining_date<='{$_GET['end_date']}' ":$a=0;
    }
    $sql .=" ORDER BY fname $sort_condition";
    $result=mysqli_query($conn,$sql);
    ?>
    <!-- Displaying Database Table -->
    <div class="table-div" style="margin-top:100px">
        <?php if (isset($_SESSION['message'])) : ?>
            <div class="msg">
                <?php
                echo $_SESSION['message'];
                unset($_SESSION['message']);
                ?>
            </div>
        <?php endif ?>
        <div class="pl1 pr1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <th scope="col">Employee Code</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Middle Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Department</th>
                        <th scope="col">Joining Date</th>
                        <th scope="col">State</th>
                        <th scope="col">Contact Number</th>
                        <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php

                    

                    
                        if (mysqli_num_rows($result) > 0) {
                            while($row=mysqli_fetch_array($result)) { ?>
                                <tr class="live">
                                    <td><?php echo $row['emp_code'] ?></td>
                                    <td><?php echo $row['fname'] ?></td>
                                    <td><?php echo $row['mname'] ?></td>
                                    <td><?php echo $row['lname'] ?></td>
                                    <td><?php echo $row['designation'] ?></td>
                                    <td><?php echo $row['dept_name'] ?></td>
                                    <td><?php echo $row['joining_date'] ?></td>
                                    <td><?php echo $row['state'] ?></td>
                                    <td><?php echo $row['contact'] ?></td>
                                    <td style="text-align: center;">
                                        <a href="./emp_viewmore.php?id=<?php echo $row['emp_code'] ?> " class="btn btn-primary">View More
                                        </a>

                                        <a href="./employee.php?edit=<?php echo $row['emp_code']; ?>" class="edit_btn"><i class="bi bi-pencil-square" style="font-size: 1rem; color: black;"></i>
                                        </a>

                                        <a href="../../controllers/employee_controller.php?del=<?php echo $row['emp_code']; ?>" class="del_btn"><i class="bi bi-trash" style="font-size: 1rem;    color: black;"></i></a>
                                    </td>
                                </tr>
                            <?php
                            }
                        } else { ?> 
                            <label style="color:white;">No entries found</label> 
                        <?php  } ?>
                </tbody>
            </table>

        </div>
    </div>

    <div class="table-footer pa4">
        <div class="fl w-75 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="employee.php">Add Employee</a></h4>
            </button>
        </div>
    </div>

    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <!-- Script Files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>