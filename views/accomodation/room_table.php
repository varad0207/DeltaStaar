<?php 
    include('../../controllers/includes/common.php'); 
    include('../../controllers/rooms_controller.php'); 
    if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
    // check rights
    $isPrivilaged = 0;
if ($_SESSION['rights_rooms'] > 0) {
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
    <title>DELTA@STAAR | Room Details</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
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
    <!-- Sidebar -->
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

        <a class="navbar-brand mb-2" href="#" style="padding: 8px;">
            <img src="../../images/logo-no-name-circle.png" height="120px" alt="Deltin Logo" class="">
        </a>

        <ul class="nav flex-column p-4" id="nav_accordion" style="--bs-nav-link-hover-color: #f8f9fa;">

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-building"></i>
                    Accommodation
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="accomodation.php">
                            Add Accommodation
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="accomodation_table.php">
                            Accommodation Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="rooms.php">
                            Add Rooms
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="#">
                            Rooms Table
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-file-text"></i> Complaints <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../complaint/complaint.php">
                            Raise A Complaint
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../complaint/complaint_table.php">
                            Complaint Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/complaint_type.php">
                            Add Complaint Type
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="../config/complaint_type_table.php">
                            Complaint Type Table
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-person"></i> HRM <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/emp_desig.php">
                            Add Designation Details
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../config/emp_desig_table.php">
                            Employees Designation Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/employee.php">
                            Add Employee Details
                        </a>
                    </li>
                    
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/employee_table.php">
                            Employees Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/roles.php">
                            Add Role </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/roles_table.php">
                            Roles Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/security_table.php">
                            Security Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/technician_table.php">
                            Technician Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/vaccination.php">
                            Add Vacination Details
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../hrm/vaccination_table.php">
                            Vacination Table
                        </a>
                    </li>

                </ul>
            </li>

            <li class="nav-item has-submenu">
                <a class="nav-link border-dark border-bottom" href="#">
                    <i class="bi bi-shield"></i> Security <i class="bi bi-chevron-down"></i>
                </a>
                <ul class="submenu collapse">
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/employee_outing.php">
                            Add Employee Outing
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom"
                            href="../security/employee_outing_table.php">
                            Employee Outings Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/tanker.php">
                            Add Tanker Entry
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/tanker_table.php">
                            Tanker Table
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/visitor_log.php">
                            Visitor Log Form
                        </a>
                    </li>
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../security/visitor_log_table.php">
                            Visitor Log Table
                        </a>
                    </li>
                </ul>
            </li>

            <!--
            <li class="nav-item">
                <a class="nav-link" href="#"> Other link </a>
            </li>
            -->
        </ul>

    </div>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark f3 lh-copy fw5">
        <div class="container-fluid">
        <button class="openbtn" onclick="openNav()">&#9776; Menu</button>
            <a class="navbar-brand" href="#">
                <img src="../../images/logo-no-name.png" height="50px" alt="Deltin Logo" class="d-inline-block align-text-top"
                    style="border-radius: 50px;">
            </a>
            <ul class="navbar-nav justify-content-end">    
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../dashboard.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" id="adminlogin" onmouseover="this.style.cursor='pointer'" onclick = "history.back()" >Back</a>
                </li>
            </ul>    
        </div>
    </nav>

    
    <div class="table-header">
    <h1 class="tc f1 lh-title spr">Room Details</h1>
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
        <?php if (isset($_SESSION['message'])): ?>
                <div class="msg">
                    <?php
                    echo $_SESSION['message'];
                    unset($_SESSION['message']);
                    ?>
                </div>
        <?php endif ?>
        
        <?php $results = mysqli_query($conn, "SELECT * FROM rooms JOIN accomodation ON rooms.acc_id = accomodation.acc_id"); ?>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                    <th scope="col">Accommodation Name</th>
                    <th scope="col">Room Number</th>
                    <th scope="col">Room Capacity</th>
                    <th scope="col">Status</th>
                    <th scope="col">Current Room Occupancy</th>
                    <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>
                    <?php $acc_id = $row['acc_id'];
                    $queryAccName = mysqli_query($conn, "SELECT * FROM accomodation where acc_id='$acc_id'");
                    $AccName_row = mysqli_fetch_assoc($queryAccName);
					?>
                    <tr>
                    <th scope="row"><?php echo $AccName_row['acc_name']; ?></th>
                        
                        <td>
                            <?php echo $row['room_no']; ?>
                        </td>
                        <td>
                            <?php echo $row['room_capacity']; ?>
                        </td>
                        <td>
                            <?php echo $row['status']; ?>
                        </td>
                        <td>
                            <?php echo $row['current_room_occupancy']; ?>
                        </td>

                        <td>
                            <a href="rooms.php?edit=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="edit_btn"> <i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            &nbsp;
                            <a href="../../controllers/rooms_controller.php?del=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                        </td>
                    </tr>
                    <?php } ?>
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
                <h4><a href="rooms.php">Add Room</a></h4>
            </button>   
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <!-- Script Files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>