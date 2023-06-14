<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>DELTA@STAAR | Jobs</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
        <div class="fl w-75 form-outline srch">
            <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
            <h4 id="demo"></h4>
        </div>
        <!-- Displaying Database Table -->
        <div class="fl w-25 tr pa1">
            <button class="btn btn-dark" class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
                <i class="bi bi-filter-circle"> Sort By</i> </button>

        </div>
    </div>

    <!-- FILTERING DATA -->
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <div class="pa1">
            <br>
            <form action="" method="GET">
                <label style="color:white;">Filter By</label>
                <button type="sumbit" class="btn btn-light">Go</button>
                <!-- <button type="reset" class="btn btn-light">Reset</button> -->
                <br>
                <br>
                <table class="table">
                    <thead>
                        <th>Technician : </th>
                        <th>Status : </th>
                        <th>Sort By : </th>
                    </thead>
                    <tbody>

                        <tr>
                            <td>
                                <?php
                                $technician = (mysqli_query($conn, "SELECT employee.fname, employee.lname, employee.emp_id, employee.emp_code,technician.id as id
                                    FROM employee
                                    INNER JOIN technician ON employee.emp_id = technician.emp_id;")); ?>
                                <select class="form-select mt-4" name="emp_id" id="empcode">
                                    <option selected disabled value="" name="employee_code">Select Technician
                                    </option>
                                    <?php
                                    foreach ($technician as $row) {
                                    ?>
                                        <option name="employee_id" value="<?= $row['id'] ?>" style="color:black;"><?php echo $row["fname"] . " " . $row['lname'] . " " . $row['emp_code']; ?></option>
                                    <?php
                                    }
                                    ?>
                            </td>
                            <td><input type="checkbox" name="completed" value="1"> Completed
                                <br>
                                <input type="checkbox" name="waiting" value="1"> Waiting For Material
                                <br>
                                <input type="checkbox" name="progress" value="1"> In Progress
                                <br>
                                <input type="checkbox" name="not_started" value="1"> Not Started
                                <br>
                            </td>
                            <td>
                                <label>From : </label>
                                <input type="date" name="start_date" value="<?php if (isset($_POST['start_date']))
                                                                                echo $_POST['start_date']; ?>">
                                <br>
                                <br>
                                <label>To : </label>
                                <input type="date" name="end_date" value="<?php if (isset($_POST['end_date']))
                                                                                echo $_POST['end_date']; ?>"><br>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

    <!-- APPLYING FILTERS -->
    <?php
    $sql = "SELECT *,jobs.id as 'job_id' FROM jobs join complaints on jobs.complaint_id=complaints.id join technician on jobs.technician_id=technician.id where 1=1";

    // CHECK FOR TECHNICIAN CATEGORY 
    if (isset($_GET['emp_id'])) {
        $employee_id = $_GET['emp_id'];
        $sql .= " and (`technician_id`=$employee_id or";
        $sql = substr($sql, 0, strripos($sql, "or"));
        $sql .= " ) ";
    }

    /* ***************** PAGINATION ***************** */
    $limit = 10;
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $start = ($page - 1) * $limit;
    $q1 = "SELECT * FROM jobs";
    $result1 = mysqli_query($conn, $q1);
    $total = mysqli_num_rows($result1);
    $pages = ceil($total / $limit);
    //check if current page is less then or equal 1
    if(($page>1)||($page<$pages))
    {
        $Previous=$page-1;
        $Next=$page+1;
    }
    if($page<=1)
    {
        $Previous=1;
        $Next=0;
    }
    if($page>=$pages)
    {
        $Next=$pages;
    }
    $sql .= " LIMIT $start,$limit";
    $result = mysqli_query($conn, $sql);
    /* ************************************************ */

    ?>
    <div class="table-div">
        <?php if (isset($_SESSION['message'])) : ?>
            <div class="msg">
                <?php
                echo $_SESSION['message'];
                unset($_SESSION['message']);
                ?>
            </div>
        <?php endif ?>

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
                    <?php 
                    while ($row = mysqli_fetch_array($result)) { ?>
                        <?php
                        $total_time_pending = strtotime($row['completion_date']) - strtotime($row['raise_timestamp']);
                        $time_elapsed = time() - strtotime($row['raise_timestamp']);
                        if (is_numeric($time_elapsed) && is_numeric($total_time_pending) && $total_time_pending > 0) {
                            $progress = ($time_elapsed / $total_time_pending) * 100;
                        } else {
                            $progress = 0;
                        }

                        // Ensure that the progress is within the valid range of 0 to 100
                        $progress = max(0, min(100, $progress));

                        // Check if the ticket is already closed
                        $is_closed = isset($row['tech_closure_timestamp']) && isset($row['sec_closure_timestamp']) || isset($row['warden_closure_timestamp']);
                        // Stop progress at 90% if not closed before completion date and display 'over-dew'
                        if (!$is_closed && time() > strtotime($row['completion_date'])) {
                            $progress = min(90, $progress);
                            if ($progress == 90) {
                                $progress_text = 'over-dew';
                            } else {
                                $progress_text = round($progress) . '%';
                            }
                        } else {
                            $progress_text = round($progress) . '%';
                        }
                        ?>
                        <tr>
                            <td>
                                <?php echo $row['job_id']; ?>
                            </td>

                            <td>
                                <?php echo $row['complaint_id']; ?>
                            </td>
                            <!-- fetch complaint category -->
                            <td>
                                <?php
                                $row1 = mysqli_fetch_array(mysqli_query($conn, "select fname,mname,lname,emp_code,emp_id from employee where emp_id='$row[emp_id]'"));
                                echo $row1['fname'] . " " . $row1['lname'] . " " . $row['emp_id'] ?>
                            </td>
                            <td>
                                <?php 
                                $warden_code=$row['warden_emp_code'];
                                $row2 = mysqli_fetch_array(mysqli_query($conn, "select fname,mname,lname,emp_code from employee where emp_code='$warden_code'"));
                                echo $row2['fname'] . " " . $row2['lname'] . " " . $row2['emp_code'];
                                
                                ?>
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
                                <div class="progress-bar">
                                    <?php if ($is_closed) { ?>
                                        <div style="width: 100%" class="progress">100%</div>
                                    <?php } elseif ($progress_text == 'over-dew') { ?>
                                        <div style="width: 90%" class="progress">over-dew</div>
                                    <?php } else { ?>
                                        <div style="width: <?= $progress ?>%" class="progress"><?= $progress_text ?></div>
                                    <?php } ?>
                                </div>
                            </td>
                            
                            <td>
                                <?php echo $row['remarks']; ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (!isset($row['tech_closure_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?tech=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>" class="del_btn">Done</a><br>
                                    <span class="closure-label">Technician</span>
                                <?php } else { ?>
                                    <p class="del_btn" style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;" disabled>Closed</p><br>
                                    <span class="closure-label">Technician</span>
                                <?php } ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (isset($row['sec_closure_timestamp']) || isset($row3['warden_closure_timestamp'])) { ?>

                                    <p class="del_btn" style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;" disabled>Closed</p><br>
                                    <span class="closure-label">Security</span>

                                <?php } else if (!isset($row['sec_closure_timestamp'])) { ?>
                                    <?php if (!isset($row['tech_closure_timestamp'])) { ?>
                                        <a href="../../controllers/complaint_controller.php?sec=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>" class="btn btn-secondary" style="pointer-events: none;">Done</a><br>
                                        <span class="closure-label">Security</span>
                                    <?php } else { ?>
                                        <a href="../../controllers/complaint_controller.php?sec=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>" class="del_btn">Done</a><br>
                                        <span class="closure-label">Security</span>
                                    <?php } ?>
                                <?php } ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (isset($row['sec_closure_timestamp']) || isset($row3['warden_closure_timestamp'])) { ?>

                                    <p class="del_btn" style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;" disabled>Closed</p><br>
                                    <span class="closure-label">Warden</span>

                                <?php } else if (!isset($row['warden_closure_timestamp'])) { ?>
                                    <?php if (!isset($row['tech_closure_timestamp'])) { ?>
                                        <a href="../../controllers/complaint_controller.php?warden=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>" class="btn btn-secondary" style="pointer-events: none;">Done</a><br>
                                        <span class="closure-label">Warden</span>
                                    <?php } else { ?>
                                        <a href="../../controllers/complaint_controller.php?warden=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>" class="del_btn">Done</a><br>
                                        <span class="closure-label">Warden</span>
                                    <?php } ?>
                                <?php } ?>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination numbers -->
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="test.php?page=<?= $Previous; ?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for ($i = 1; $i <= $pages; $i++) : ?>
                <li class="page-item"><a class="page-link" href="test.php?page=<?= $i ?>">
                        <?php echo $i; ?>
                    </a></li>
            <?php endfor; ?>
            <li class="page-item"><a class="page-link" href="test.php?page=<?= $Next; ?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>

    <div class="table-footer pa4">
        <div class="fl w-75 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div>
        <br>

        <!-- Footer -->
        <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>

</html>