<?php
include('../../controllers/includes/common.php');
include('../../controllers/employee_controller.php');

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights
$isPrivilaged = 0;
if ($_SESSION['rights_employee_details'] > 0) {
    $isPrivilaged = $_SESSION['rights_employee_details'];
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
    include '../../controllers/includes/sidebar.html';
    include '../../controllers/includes/navbar.html';
    ?>


    <div class="table-header">
        <h1 class="tc f1 lh-title spr">Employee Details</h1>
        <div class="fl w-75 form-outline srch">
            <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
            <h4 id="demo"></h4>
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-dark">
                <h5><i class="bi bi-filter-circle"> Sort By</i></h5>
            </button>
        </div>
    </div>

    <!-- Displaying Database Table -->

    <div class="table-div">
        <?php if (isset($_SESSION['message'])) : ?>
            <div class="msg">
                <?php
                echo $_SESSION['message'];
                unset($_SESSION['message']);
                ?>
            </div>
        <?php endif ?>
        
       <?php  //Entries per-page
        $results_per_page = 5;

        //Number of results in the DB
        $sql = "select * from employee";
        $result = mysqli_query($conn, $sql);
        $number_of_results = mysqli_num_rows($result); 
        //number of pages
        $number_of_pages = ceil($number_of_results / $results_per_page);

        // on which is the user
        if (!isset($_GET['page']))
        $page = 1;
    else
        $page = $_GET['page'];
    //starting limit number for the results
    $this_page_first_result = ($page - 1) * $results_per_page;

    // retrieve the selected results
   // $sqli = "SELECT * FROM employee LIMIT " . $this_page_first_result . ',' . $results_per_page;
   // $results = mysqli_query($conn, $sqli);

        ?>

        <?php $results = mysqli_query($conn, "SELECT * FROM employee JOIN employee_designation ON employee_designation.id = employee.designation LIMIT " . $this_page_first_result . ',' . $results_per_page); ?>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <th scope="col">Employee Code</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Middle Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Date of Birth</th>
                        <th scope="col">Address</th>
                        <th scope="col">State</th>
                        <th scope="col">Country</th>
                        <th scope="col">Pincode</th>
                        <th scope="col">Contact Number</th>
                        <th scope="col">Email</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Department</th>
                        <th scope="col">Joining Date</th>
                        <th scope="col">Aadhar Number</th>
                        <th scope="col">Salary</th>
                        <th scope="col">Accommodation</th>
                        <th scope="col">Room Number</th>
                        <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>
                        <?php
                        $desigid = $row['designation'];
                        $queryEmployeeDesig = mysqli_query($conn, "SELECT * FROM employee_designation WHERE designation='$desigid'");
                        $EmployeeDesig_row = mysqli_fetch_assoc($queryEmployeeDesig);
                        ?>
                        <?php
                        $roomid = $row['room_id'];
                        $queryRoom = mysqli_query($conn, "SELECT * FROM rooms WHERE id = '$roomid'");
                        $EmployeeRoom_row = mysqli_fetch_assoc($queryRoom);
                        ?>
                        <?php
                        $accid = $EmployeeRoom_row['acc_id'];
                        if (!empty($accid)) {
                            $queryAcc = mysqli_query($conn, "SELECT * FROM accomodation where acc_id='$accid'");
                            $Acc_row = mysqli_fetch_assoc($queryAcc);
                            $accName = $Acc_row['acc_name'];
                        }else{
                            $accName = 'N/A';
                        }
                        ?>

                        <tr>
                            <th scope="row"><?php echo $row['emp_code']; ?></th>
                            <td>
                                <?php echo $row['fname']; ?>
                            </td>
                            <td>
                                <?php echo $row['mname']; ?>
                            </td>
                            <td>
                                <?php echo $row['lname']; ?>
                            </td>
                            <td>
                                <?php echo $EmployeeDesig_row['designation']; ?>
                            </td>
                            <td>
                                <?php echo date('d-m-Y', strtotime($row['dob'])); ?>
                            </td>
                            <td>
                                <?php echo $row['address']; ?>
                            </td>
                            <td>
                                <?php echo $row['state']; ?>
                            </td>
                            <td>
                                <?php echo $row['country']; ?>
                            </td>
                            <td>
                                <?php echo $row['pincode']; ?>
                            </td>
                            <td>
                                <?php echo $row['contact']; ?>
                            </td>
                            <td>
                                <?php echo $row['email']; ?>
                            </td>
                            <td>
                                <?php echo $row['blood_group']; ?>
                            </td>
                            <td>
                                <?php echo $row['department']; ?>
                            </td>
                            <td>
                                <?php echo date('d-m-Y', strtotime($row['joining_date'])); ?>
                            </td>
                            <td>
                                <?php echo $row['aadhaar_number']; ?>
                            </td>
                            <td>
                                <?php echo $row['salary']; ?>
                            </td>
                            <td>
                                <?php echo $accName; ?>
                            </td>
                            <td>
                                <?php echo $EmployeeRoom_row['room_no']; ?>
                            </td>
                            <td>
                                <a href="./employee.php?edit=<?php echo '%27' ?><?php echo $row['emp_code']; ?><?php echo '%27' ?>" class="edit_btn"> <i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i></a>
                                &nbsp;
                                <a href="../../controllers/employee_controller.php?del=<?php echo '%27' ?><?php echo $row['emp_code']; ?><?php echo '%27' ?>" class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i></a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>

            <?php
            
            //display the links to the pages
            for($page=1;$page<=$number_of_pages;$page++)
                echo '<a href="employee_table.php?page=' .$page .'">' .$page .'</a>';
            ?>
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