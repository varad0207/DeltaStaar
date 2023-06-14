<?php
include('../../controllers/includes/common.php');
include('../../controllers/complaint_controller.php');
if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");
// check rights
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_complaints'] > 0) {
    $isPrivilaged = $rights['rights_complaints'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$isWarden = 0;
$check = mysqli_query($conn, "select emp_id,emp_code from employee where emp_id not in(select emp_id from technician) and emp_id not in (select emp_id from security) and emp_id='{$_SESSION['emp_id']}' and emp_code in (select warden_emp_code from accomodation)");
if (mysqli_num_rows($check) > 0)
    $isWarden = 1;
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

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../../css/overlay.css">

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
            listing = document.getElementsByClassName("live");
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
    <h1 class="tc f1 lh-title spr">Complaint Details</h1>
    <div class="fl w-75 form-outline srch">
        <input type="search" id="form1" class="form-control" placeholder="Live Search" aria-label="Search" oninput="search()" />
        <h4 id="demo"></h4>
    </div>
    <div class="fl w-25 tr pa1">
    <button class="btn btn-dark" class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
    <i class="bi bi-filter-circle"> Sort By</i> </button>
    
    </div>
    </div>

    
    <!-- FILTERING DATA -->
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <div class="pa1">
        <br>
        <form action="" method="GET" class="myForm">
            <label style="color:white;">Filter By</label>
            <button type="sumbit" class="btn btn-light">Go</button>
            <!-- <button type="reset" class="btn btn-light" onclick="resetForm()">Reset</button> -->
            <!-- <input type="button" value="Reset" onclick="resetForm()"> -->
            <br>
            <br>
            <table class="table">
                <thead>
                    <th>Complain Category : </th>
                    <th>Accommodation : </th>
                    <th>Sort By : </th>
                   
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <?php
                            $fetch_filter = "SELECT * FROM complaint_type";
                            $fetch_filter_run = mysqli_query($conn, $fetch_filter);
                            if (mysqli_num_rows($fetch_filter_run) > 0) {
                                foreach ($fetch_filter_run as $filter) {
                                    $checked1 = [];
                                    if (isset($_GET['type'])) {
                                        $checked1 = $_GET['type'];
                                    }
                            ?>
                                    <div>
                                        <input type="checkbox" name="type[]" value="<?= $filter['complaint_type']; ?>" <?php if (in_array($filter['complaint_type'], $checked1)) {
                                                                                                                        echo "checked";
                                                                                                                    }
                                                                                                                    ?>>
                                        <label><?= $filter['complaint_type']; ?></label>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "No Data available";
                            }
                            ?>
                        </td>
                        <td>
                        <?php
                            $fetch_filter = "SELECT * FROM accomodation";
                            $fetch_filter_run = mysqli_query($conn, $fetch_filter);
                            if (mysqli_num_rows($fetch_filter_run) > 0) {
                                foreach ($fetch_filter_run as $filter) {
                                    $checked1 = [];
                                    if (isset($_GET['acc_name'])) {
                                        $checked1 = $_GET['acc_name'];
                                    }
                            ?>
                                    <div>
                                        <input type="checkbox" name="acc_name[]" value="<?= $filter['acc_name']; ?>" <?php if (in_array($filter['acc_name'], $checked1)) {
                                                                                                                        echo "checked";
                                                                                                                    }
                                                                                                                    ?>>
                                        <label><?= $filter['acc_name']; ?></label>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "No Data available";
                            }
                            ?>
                        </td>
                        <td>
                        <!-- <form action="" method="post" class="myForm"> -->
                        <div class="input-group mb-3">
                            <select name="sort_alpha" class="form-control">
                                <option value="">--Select Option--</option>
                                <option value="a-z" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "a-z") echo "selected"; ?>>A-Z(Ascending Order)</option>
                                <option value="z-a" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "z-a") echo "selected"; ?>>Z-A(Descending Order)</option>
                            </select>
                        </div>
                    <!-- </form> -->
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </form>
    </div>
    </div>
    <div class="table-header">
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
    </div>

    <?php
    $part="";
    
    if($isWarden){
        $empc="'{$_SESSION['emp_code']}'";
    }
    else if($_SESSION['is_superadmin']) {       
        $empc="accomodation.warden_emp_code";
    }
else{
    $empc="accomodation.warden_emp_code";

    $part=" and emp_code='{$_SESSION['emp_code']}'";
}
    $sqli = "SELECT * FROM complaint_type join complaints ON type=type_id join accomodation USING(acc_code) where accomodation.warden_emp_code=$empc and 1=1 ";
    $sort_condition = "";
    if (isset($_GET['sort_alpha'])) {
        if ($_GET['sort_alpha'] == "a-z") {
            $sort_condition = "ASC";
        } else if ($_GET['sort_alpha'] == "z-a") {
            $sort_condition = "DESC";
        }
    }
    if(isset($_GET['type'])){
        $filter_checked = [];
        $filter_checked = $_GET['type'];
        $sqli .= " AND ( ";
        foreach($filter_checked as $row_filter){
            $sqli .= " complaint_type='$row_filter' OR"; 
        }
        $sqli =substr($sqli,0,strripos($sqli,"OR"));  
        $sqli .=" ) ";
        
    }
    if(isset($_GET['acc_name'])){
        $filter_checked = [];
        $filter_checked = $_GET['acc_name'];
        $sqli .= " AND ( ";
        foreach($filter_checked as $row_filter){
            $sqli .= " acc_name='$row_filter' OR"; 
        }
        $sqli =substr($sqli,0,strripos($sqli,"OR"));  
        $sqli .=" ) ";
        
    }
    $sqli.=$part;
    $sqli .=" ORDER BY complaint_type $sort_condition";
    // echo $sqli;
    $complaint_qry=$sqli;
   // $results = mysqli_query($conn, $sqli);
    ?>
    <?php
    /* ***************** PAGINATION ***************** */
    $limit=10;
    $pages = 0;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $start=($page-1) * $limit;
    //check if current page is less then or equal 1
    if(($page>=1)||($page<$pages))
    {
        $start=($page-1) * $limit;
        $Previous=$page-1;
        $Next=$page+1;
    }
    if($page<1)
    {
        $Previous=1;
        $Next=1;
        $start=0;
    }
    if($page>=$pages)
    {
        $Next=$pages;
    }
    $sqli .=" LIMIT $start,$limit";
    $result=mysqli_query($conn,$sqli);

//     if($isWarden){
//     $sess_emp_code=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM employee where emp_id='{$_SESSION["emp_id"]}'"));
//     // $c1=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM employee where complaints.emp_code=employee.emp_code"));
//     // $c2=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM rooms where rooms.id='{$c1['room_id']}'"));
//     // $c3=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM accomodation where accomodation.acc_id='{$c2['acc_id']}'"));
//     $q1="SELECT * FROM complaints where {$sess_emp_code['']}";
//     $result1=mysqli_query($conn,$q1);
// }else{
    $q1="SELECT * FROM complaints";
    $result1=mysqli_query($conn,$q1);
// }
    $total=mysqli_num_rows($result1);
    $pages=ceil($total/$limit);
    
    /* ************************************************ */
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
            if (isset($_POST['save']) || (isset($_SESSION['emp_id']) && $isPrivilaged)) {
            if (isset($_POST['Id']))
                $emp_code = $_POST['Id'];
            // $results = isset($_SESSION['emp_id']) ? mysqli_query($conn, "SELECT * FROM complaints") : mysqli_query($conn, "SELECT * FROM complaints where emp_code='$emp_code'");
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
                        <?php 
                        while ($row = mysqli_fetch_array($result)) { 
                            $emp_code = $row['emp_code'];
                            $EmpName_row = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM employee where emp_code='$emp_code'"));
                            $EmployeeRoom_row = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM rooms WHERE id = '{$EmpName_row['room_id']}'"));

                            $AccName_row = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM accomodation where acc_code='{$row['acc_code']}'"));
                            $complaintType_row = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM complaint_type where type_id='{$row['type']}'"));
                    
                            $query = mysqli_query($conn, "SELECT * FROM jobs WHERE complaint_id = '{$row['id']}'");
                            
                            ?>
                            <tr class="live">
                                <td>
                                    <?php echo $row['id']; ?>
                                </td>
                                <td>
                                    <?php echo $row['raise_timestamp']; ?>
                                </td>
                                <!-- fetch complaint category -->
                                <td>
                                    <?php echo $complaintType_row['complaint_type']; ?>
                                </td>
                                <td>
                                    <?php echo $row['description']; ?>
                                </td>
                                <td>
                                    <?php

                                    if (isset($row['tech_closure_timestamp']) && isset($row['sec_closure_timestamp']) || isset($row['warden_closure_timestamp'])) {
                                        echo "<p>Completed</p>";
                                    } else if (isset($row['tech_pending_timestamp']) && !isset($row['tech_closure_timestamp']) && !isset($row['sec_closure_timestamp']) && !isset($row['warden_closure_timestamp'])) {
                                        echo "<p>Waiting for material</p>";
                                    } else if (!isset($row['tech_closure_timestamp']) && !isset($row['sec_closure_timestamp']) && !isset($row['warden_closure_timestamp'])) {
                                        echo "<p>Not Started</p>";
                                    } else {
                                        echo "<p>In Progress</p>";
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
                                <?php
                                    if (isset($AccName_row['acc_name']) && !empty($AccName_row['acc_name'])) {
                                        echo $AccName_row['acc_name'];
                                    } else {
                                        echo $AccName_row['acc_name'] = 'N/A';
                                    }
                                ?>
                                </td>
                                <td>
                                    <?php
                                    if (isset($EmployeeRoom_row['room_no']) && !empty($EmployeeRoom_row['room_no'])) {
                                        echo $EmployeeRoom_row['room_no'];
                                    } else {
                                        echo $EmployeeRoom_row['room_no'] = 'N/A';
                                    }
                                    ?>
                                </td>
                                <td>

                                    <?php
                                    if ($query) {
                                        if (mysqli_num_rows($query) > 0) {
                                            ?>
                                            <a href="jobs_table.php" class="edit_btn"
                                                        style="color: green;">Job Raised</a>
                                            <!-- <b style="color: green;">Job Raised</b> -->
                                            <?php
                                        } else {
                                            if ($isWarden || $_SESSION['is_superadmin']) {
                                                if ($rights['rights_jobs'] > 1 && $rights['rights_jobs'] != 5 && $rights['rights_jobs'] != 4) { ?>
                                                    <a href="jobs.php?raise=<?php echo $row['id']; ?>" class="edit_btn"
                                                        style="color: red;">Raise Job</a>
                                                    <?php
                                                }
                                            }
                                        }
                                    }
                                    ?>


                                </td>
                                <td>
                                    <?php if ($isPrivilaged >= 4) { ?>
                                        <a class="del_btn" onclick="myfunc('<?php echo $row['id']; ?>')"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i></a>
                                            <form id="del_response" action="../../controllers/complaint_controller.php" method="get">
                                                <input type="hidden" id="hidden-del" name="del" value="" />
                                            </form>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            <?php } ?>
        </div>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="complaint_table.php?page=<?=$Previous;?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for($i=1;$i<=$pages;$i++) :?>
    <li class="page-item"><a class="page-link" href="complaint_table.php?page=<?=$i?>">
                <?php echo $i; ?>
            </a></li>
            <?php endfor;?>
            <li class="page-item"><a class="page-link" href="complaint_table.php?page=<?=$Next;?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>

    <div class="table-footer pa4">
        <div class="fl w-75 tl">
        <form action="../EXCEL_export.php" method="post">
                <button class="btn btn-warning" name="complaint_export" value="<?php echo $complaint_qry;?>"><h4><i class="bi bi-file-earmark-pdf"> Export</i></h4></button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
    <?php include '../../controllers/overlays/deleteOverlay.php'; ?>

<script>
    function myfunc(code) {
        console.log(code);
        document.getElementById("hidden-del").value = code;
        document.getElementById('overlay').style.display = 'flex';
    }
</script>
    <script src="../../js/Overlay.js"></script>
</body>

</html>