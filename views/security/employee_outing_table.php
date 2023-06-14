<?php
include('../../controllers/includes/common.php');
include('../../controllers/employee_outing_controller.php');
if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
$isPrivilaged = 0;
$isWarden = 0;
$isSecurity = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_employee_outing'] > 0) {
    $isPrivilaged = $rights['rights_employee_outing'];
}
else
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$sec=mysqli_query($conn,"select acc_id from security where emp_id='{$_SESSION['emp_id']}'");
$ward=mysqli_query($conn,"select acc_id from accomodation where warden_emp_code='{$_SESSION['emp_code']}'");
if(mysqli_num_rows($sec)>0){
    $isSecurity=1;
    $aid=mysqli_fetch_array($sec);
} 
if(mysqli_num_rows($ward)>0) {
    $isWarden=1;
    $aid=mysqli_fetch_array($ward);
}
if($_SESSION['is_superadmin']==1) $aid['acc_id']="rooms.acc_id";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>DELTA@STAAR | Employee Outing</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../../css/overlay.css">
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
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
    <h1 class="tc f1 lh-title spr">Employee Outing Details</h1>
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
        <form action="" method="GET">
            <label style="color:white;">Filter By</label>
            <button type="sumbit" class="btn btn-light">Go</button>
            <!-- <button type="reset" class="btn btn-light">Reset</button> -->
            <br>
            <br>
            <table class="table">
                <thead>
                    <th>Outing Date : </th>
                    <th>Sort By : </th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label>From : </label>
                            <input type="date" name="start_date" value="<?php if (isset($_POST['start_date']))
                            echo $_POST['start_date']; ?>">
                            <br>
                            <br>
                            <label>To : </label>
                            <input type="date" name="end_date" value="<?php  if (isset($_POST['end_date']))
                            echo $_POST['end_date']; ?>"><br>

                        </td>
                        <td>
                        <div class="input-group mb-3">
                            <select name="sort_alpha" class="form-control">
                                <option value="">--Select Option--</option>
                                <option value="a-z" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "a-z") echo "selected"; ?>>A-Z(Ascending Order)</option>
                                <option value="z-a" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "z-a") echo "selected"; ?>>Z-A(Descending Order)</option>
                            </select>
                        </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    </div>
    <?php
    $sort_condition = "";
    $sql="SELECT * FROM employee_outing JOIN employee ON employee_outing.emp_code = employee.emp_code join rooms on rooms.id=employee.room_id WHERE rooms.acc_id={$aid['acc_id']}";
    if (isset($_GET['sort_alpha'])) 
    {
        if ($_GET['sort_alpha'] == "a-z") {
            $sort_condition = "ASC";
        } else if ($_GET['sort_alpha'] == "z-a") {
            $sort_condition = "DESC";
        }
    }
    if (isset($_GET['start_date'])) {
    
        $_GET['start_date']!=""?$sql .= " and outing_date>='{$_GET['start_date']}' ":$a=0;
        

    }
    if (isset($_GET['end_date'])) {
        
        $_GET['end_date']!=""?$sql .= " and outing_date<='{$_GET['end_date']}' ":$a=0;
    }
    $sql .=" ORDER BY fname $sort_condition";
    $outing_qry=$sql;

    // echo $sql;
    $result=mysqli_query($conn,$sql);
    ?>
    <?php
    /* ***************** PAGINATION ***************** */
    $limit=10;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $start=($page-1) * $limit;
    

    $q1="SELECT * FROM employee_outing";
    $result1=mysqli_query($conn,$q1);
    $total=mysqli_num_rows($result1);
    $pages=ceil($total/$limit);
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
    $sql .=" LIMIT $start,$limit";
    $result=mysqli_query($conn,$sql);
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
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                    <th scope="col">Employee Name</th>
                    <th scope="col">Outing Date</th>
                    <th scope="col">Arrival Date</th>
                    <th scope="col">Purpose of Outing</th>
                    <th>Description</th>
                    <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($result)) { ?>
                    <?php
                    $empid = $row['emp_id'];
                    $queryEmpID = mysqli_query($conn, "SELECT * FROM employee where emp_id='$empid'");
                    $EmpID_row = mysqli_fetch_assoc($queryEmpID);
                    $sql1 = mysqli_query($conn, "SELECT * FROM outing_type where type_id='{$row['type']}'");
                    $row1 = mysqli_fetch_array($sql1);
                    ?>
                    <tr>
                    <th scope="row">
                        <?php echo $EmpID_row['fname']; ?>
                        <?php echo $EmpID_row['lname']; ?>
                    </th>
                        <td>
                            <?php echo $row['outing_date']; ?>
                        </td>
                        <td>
                            <?php 
                            echo $row['arrival_date']; ?>
                        </td>
                        <td>
                            <?php 
                                echo $row1['type_name']; ?>
                        </td>
                        <td>
                            <?php echo $row['category']; ?>
                        </td>
                        
                        <td>
                        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>

                            <a href="./employee_outing.php?edit=<?php echo '%27' ?><?php echo $row['emp_code']; ?><?php echo '%27' ?>"
                                class="edit_btn"> <i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i></a>
                            <?php } ?>
                                &nbsp;
                                <?php if($isPrivilaged>=4){ ?>
                            <a class="del_btn" onclick="myfunc('<?php echo $row['emp_code']; ?>')"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i></a>
                                <form id="del_response" action="../../controllers/employee_outing_controller.php" method="get">
                                    <input type="hidden" id="hidden-del" name="del" value="" />
                                </form>
                        <?php } ?>
                            </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="employee_outing_table.php?page=<?=$Previous;?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for($i=1;$i<=$pages;$i++) :?>
    <li class="page-item"><a class="page-link" href="employee_outing_table.php?page=<?=$i?>">
                <?php echo $i; ?>
            </a></li>
            <?php endfor;?>
            <li class="page-item"><a class="page-link" href="employee_outing_table.php?page=<?=$Next;?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>

    <div class="table-footer pa4">
        <div class="fl w-75 tl">
        <form action="../EXCEL_export.php" method="post">
                <button class="btn btn-warning" name="outing_export" value="<?php echo  $outing_qry;?>"><h4><i class="bi bi-file-earmark-pdf"> Export</i></h4></button>
        </form>
        </div>
        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="employee_outing.php">Add Outing</a></h4>
            </button>   
        </div>
        <?php } ?>
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