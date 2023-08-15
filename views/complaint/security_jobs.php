<?php
include('../../controllers/includes/common.php');

if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
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
// $sql = mysqli_query($conn, "SELECT * FROM security where emp_id='{$_SESSION['emp_id']}' ");
// if(mysqli_num_rows($sql)==0) 
//     die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');


if(!$isPrivilaged)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$sql = mysqli_query($conn, "SELECT * FROM security where emp_id='{$_SESSION['emp_id']}' ");
if(mysqli_num_rows($sql)>0) 
    $security_id = mysqli_fetch_array($sql);
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
    </div>
    <div class="table-div">
        <?php if (isset($_SESSION['message'])): ?>
            <div class="msg">
            <script>alert("<?php echo $_SESSION['message'];?>");</script>
                <?php
                // echo $_SESSION['message'];
                unset($_SESSION['message']);
                ?>
            </div>
        <?php endif ?>

        <?php
         $sql = "SELECT complaints.*,
         j.id as job_id,
         j.complaint_id as complaint_id,
         j.raise_timestamp as job_raise_time,
         j.description as job_desc,
         j.completion_date as job_comp_time,
         j.warden_emp_code as warden_emp_code
                  FROM jobs j join complaints on complaint_id=complaints.id 
          join accomodation on accomodation.acc_id=complaints.acc_id 
          join security on security.acc_id=accomodation.acc_id where security.emp_id='{$_SESSION['emp_id']}' and 1=1 ";
    /* ***************** PAGINATION ***************** */      
    if (!isset($_GET['page'])) {
        $_SESSION['query'] = $sql;
    }
    $limit = 100;
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $start = ($page - 1) * $limit;
    // Calculate total records based on filters
    $rowcount=mysqli_num_rows(mysqli_query($conn,$_SESSION['query']));
    $total = $rowcount;
    $pages = ceil($total / $limit);
    // Adjust page numbers to prevent out-of-range values
    $page = max(1, min($page, $pages));
    $Previous = ($page > 1) ? $page - 1 : 1;
    $Next = ($page < $pages) ? $page + 1 : $pages;
    $sql = $_SESSION['query'];
    $sql .= " LIMIT $start, $limit";
    $results = mysqli_query($conn, $sql);
    /* ************************************************ */
     
       
        ?>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <!-- <th>Job Id </th> -->
                        <th>Complaint Id</th>
                        <!-- <th>Assigned security </th> -->
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
                                <?php if(isset($row['tech_pending_timestamp']) || isset($row['tech_closure_timestamp'])) { ?>
                                    <p class="del_btn"
                                        style="background-color: green; color: white; padding: 5px 10px; border-radius: 5px; margin-bottom: 0px; text-align: center; display: inline-block;"
                                        disabled>Closed</p><br>
                                <?php } else { ?>
                                    <a href="../../controllers/complaint_controller.php?tech_pending=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                        class="del_btn">Material</a><br>
                                <?php } ?>
                            </td>

                            <td style="text-align:center;">
                                <?php if (!isset($row['tech_closure_timestamp'])) { ?>
                                    <a href="../../controllers/complaint_controller.php?tech=<?php echo '%27' ?><?php echo $row['complaint_id']; ?><?php echo '%27' ?>"
                                        class="del_btn">Close</a><br>
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
            <!-- Pagination numbers -->
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="security_jobs.php?page=<?= $Previous; ?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
                    <?php for ($i = 1; $i <= $pages; $i++) : ?>
                        <li class="page-item"><a class="page-link" href="security_jobs.php?page=<?= $i ?>">
                                <?php echo $i; ?>
                            </a></li>
                    <?php endfor; ?>
                    <li class="page-item"><a class="page-link" href="security_jobs.php?page=<?= $Next; ?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
                </ul>
            </nav>

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

    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
</body>

</html>