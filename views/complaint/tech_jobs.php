<?php
include('../../controllers/includes/common.php');

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights

if($_SESSION['is_superadmin']){
    
}

$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_jobs'] > 0) {
    $isPrivilaged = $rights['rights_jobs'];
} 
// else
//     die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
// $sql = mysqli_query($conn, "SELECT * FROM technician where emp_id='{$_SESSION['emp_id']}' ");
// if(mysqli_num_rows($sql)==0) 
//     die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');


if(!$isPrivilaged)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$sql = mysqli_query($conn, "SELECT * FROM technician where emp_id='{$_SESSION['emp_id']}' ");
if(mysqli_num_rows($sql)>0) 
    $technician_id = mysqli_fetch_array($sql);
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
    <title>DELTA@STAAR | Jobs</title>

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
    <!-- Sidebar and Navbar-->
    <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>

    <div class="table-header">
        <h1 class="tc f1 lh-title spr">Raised Jobs</h1>
        <!-- <div class="fl w-75 form-outline srch">
        <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
        <h4 id="demo"></h4>
    </div> -->
        <!-- Displaying Database Table -->
        <!-- <div class="tr">
        <button class="btn btn-dark">
            <h5><i class="bi bi-filter-circle"> Sort By</i></h5>
        </button>
    </div> -->
    </div>

    <?php //Entries per-page
    $results_per_page = 5;

    //Number of results in the DB
    $sql = "SELECT * FROM jobs";
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
    $sqli = "SELECT * FROM jobs LIMIT " . $this_page_first_result . ',' . $results_per_page;
    $results = mysqli_query($conn, $sqli);

    ?>
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
        $results = mysqli_query($conn, "SELECT complaints.*,
        j.id as job_id,
        j.complaint_id as complaint_id,
        j.technician_id as technician_id,
        j.raise_timestamp as job_raise_time,
        j.description as job_desc,
        j.completion_date as job_comp_time,
        j.warden_emp_code as warden_emp_code
         FROM jobs j join complaints on complaint_id=complaints.id where technician_id='{$technician_id['id']}' ");
        ?>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <!-- <th>Job Id </th> -->
                        <th>Complaint Id</th>
                        <!-- <th>Assigned technician </th> -->
                        <th>Raised By </th>
                        <th>Raised on </th>
                        <th>Description</th>
                        <th>Expected Completion Date </th>
                        <!-- <th>Status </th> -->
                        <!-- <th>Remarks </th> -->
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) {
                        $emp_det = mysqli_query($conn, "SELECT concat(fname,' ',lname) raised_by,emp_code FROM employee where emp_code='{$row['warden_emp_code']}'");
                        $row1 = mysqli_fetch_array($emp_det);

                        ?>
                        <tr>
                            <td>
                                <?php echo $row['complaint_id']; ?>
                            </td>
                            <td>
                                <?php echo $row1['raised_by'] . "(" . $row1['emp_code'] . ")"; ?>
                            </td>
                            <td>
                                <?php echo $row['job_raise_time']; ?>
                            </td>
                            <td>
                                <?php echo $row['description'] . "\n" . $row['job_desc']; ?>
                            </td>
                            <td>
                                <?php echo $row['job_comp_time']; ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (!isset($row['tech_pending_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?tech_pending=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                        class="del_btn">Material</a><br>
                                <?php } else { ?>
                                    <p class="del_btn"
                                        style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                        disabled>Closed</p><br>
                                <?php } ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (!isset($row['tech_closure_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?tech=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                        class="del_btn">Done</a><br>
                                <?php } else { ?>
                                    <p class="del_btn"
                                        style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                        disabled>Closed</p><br>
                                <?php } ?>
                            </td>

                           

                            
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
            <?php

            //display the links to the pages
            for ($page = 1; $page <= $number_of_pages; $page++)
                echo '<a href="jobs_table.php?page=' . $page . '">' . $page . '</a>';
            ?>
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