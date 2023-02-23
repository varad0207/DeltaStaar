<?php
include('../../controllers/includes/common.php');
include('../../controllers/jobs_controller.php');
include('../../controllers/complaint_controller.php');
if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// check rights
$isPrivilaged = 0;
// $check = mysqli_query($conn,"select emp_id from employee where emp_id in(select emp_id from technician) and emp_id='{$_SESSION['emp_id']}')");
//     if (mysqli_num_rows($check) > 0)
//     $isPrivilaged = 1;
//     else
// die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

$rights = unserialize($_SESSION['rights']);
if ($rights['rights_jobs'] > 0) {
    $isPrivilaged = $rights['rights_jobs'];
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

    <?php  //Entries per-page
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
        $results = mysqli_query($conn, "SELECT * FROM jobs ");
        ?>

        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <th>Job Id </th>
                        <th>Complaint Id</th>
                        <th>Assigned technician </th>
                        <th>Raised By </th>
                        <th>Raised on </th>
                        <th>Description</th>
                        <th>Completion Date </th>
                        <th>Status </th>
                        <th>Remarks </th>
                        <th colspan="3">Closures</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>

                    <?php


                        $query = mysqli_query($conn, "SELECT * FROM complaints WHERE id = '{$row['complaint_id']}'");
                        $row3 = mysqli_fetch_array($query);

                    ?>
                    <?php
                        $tech_id = mysqli_query($conn, "SELECT * FROM technician");



                        $row2 = mysqli_fetch_array($tech_id);
                        $emp_det = mysqli_query($conn, "SELECT * FROM employee where emp_id={$row2["emp_id"]}");
                        $row1 = mysqli_fetch_array($emp_det);

                        $total_time_pending = strtotime($row['completion_date']) - strtotime($row['raise_timestamp']);

                        // if (is_numeric($total_time_pending)) {
                        //     $time_elapsed = time() - is_numeric($row['raise_timestamp']);
                        //   } else {
                        //     $time_elapsed = 0;
                        //   }
                        $time_elapsed = time() - strtotime($row['raise_timestamp']);

                        if (is_numeric($time_elapsed) && is_numeric($total_time_pending) && $total_time_pending > 0) {
                            $progress = ($time_elapsed / $total_time_pending) * 100;
                        } else {
                            $progress = 0;
                        }

                        if ($progress > 100) {
                            $progress = 100;
                        }

                    ?>

                    <tr>
                        <td>
                            <?php echo $row['id']; ?>
                        </td>
                        <td>
                            <?php echo $row['complaint_id']; ?>
                        </td>
                        <!-- fetch complaint category -->
                        <td>
                            <?= $row1["fname"] ?><?=" " ?><?= $row1["lname"] ?>(<?= $row1["emp_code"]; ?>)
                        </td>
                        <td>
                            <?php echo $row['warden_emp_code']; ?>
                        </td>
                        <td>
                            <?php echo $row['raise_timestamp']; ?>
                        </td>
                        <td>
                            <?php echo $row['description']; ?>
                        </td>
                        <td>
                            <?php echo $row['completion_date']; ?>
                        </td>
                        <td>
                            <div class='progress-bar'>
                                <div style='width:  <?= $progress ?>%' class='progress'><?= $progress ?>%</div>
                            </div>
                        </td>
                        <td>
                            <?php echo $row['remarks']; ?>
                        </td>
                        <!-- fetch emp name -->

                        <!-- <td>

                        
                        <a href="jobs.php?edit=<?php echo $row['id']; ?>" class="edit_btn">Edit</a>
                        

                            
                        </td>
                        <td>
                            <a href="../../controllers/jobs_controller.php?del=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="del_btn">Delete</a>
                        </td> -->
                        <td style="text-align:center;">
                            <?php if (!isset($row3['tech_closure_timestamp'])) { ?>
                            <a href="../../controllers/complaint_controller.php?tech=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                class="del_btn"
                                >Done</a><br>
                            <span class="closure-label">Technician</span>
                            <?php } else { ?>
                            <p class="del_btn"
                                style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                disabled>Closed</p><br>
                            <span class="closure-label">Technician</span>
                            <?php } ?>
                        </td>

                        <td style="text-align:center;">
                            <?php if (!isset($row3['sec_closure_timestamp'])) { ?>
                                
                                <?php    if (!isset($row3['tech_closure_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?sec=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                class="btn btn-secondary" style="pointer-events: none;"
                                >Done</a><br>
                            <span class="closure-label">Security</span>
                                    <?php } else { ?>
                                        <a href="../../controllers/complaint_controller.php?sec=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                class="del_btn"
                                >Done</a><br>
                            <span class="closure-label">Security</span>
                                        <?php } ?>
                            <?php } else { ?>
                            <p class="del_btn"
                                style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                disabled>Closed</p><br>
                            <span class="closure-label">Security</span>
                            <?php } ?>
                        </td>

                        <td style="text-align:center;">
                            <?php if (!isset($row3['warden_closure_timestamp'])) { ?>
                                <?php    if (!isset($row3['tech_closure_timestamp']) && !isset($row3['sec_closure_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?warden=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                class="btn btn-secondary" style="pointer-events: none;"
                                >Done</a><br>
                            <span class="closure-label">Warden</span>
                            <?php } else { ?>
                            <a href="../../controllers/complaint_controller.php?warden=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                class="del_btn"
                                >Done</a><br>
                            <span class="closure-label">Warden</span>
                            <?php } ?>
                            <?php } else { ?>
                            <p class="del_btn"
                                style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                disabled>Closed</p><br>
                            <span class="closure-label">Warden</span>
                            <?php } ?>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
            <?php
            
            //display the links to the pages
            for($page=1;$page<=$number_of_pages;$page++)
                echo '<a href="jobs_table.php?page=' .$page .'">' .$page .'</a>';
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