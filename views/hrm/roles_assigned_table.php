<?php 
    include('../../controllers/includes/common.php'); 
    if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");

        if ($_SESSION['is_superadmin'] == 0)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

    // check rights

$none = '<span class="material-icons">block</span>';
$read = '<span class="material-icons">menu_book</span>';
$write = '<span class="material-icons">edit</span>';
$delete = '<span class="material-icons">delete</span>';
$all = '<span class="material-icons">done_all</span>';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    
    <title>DELTA@STAAR | Roles</title>
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
    <h1 class="tc f1 lh-title spr">All Assigned Roles</h1>
    <!-- <div class="fl w-75 form-outline srch">
        <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search" oninput="search()" />
        <h4 id="demo"></h4>
    </div> -->
    <div class="tr">
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
        
        <?php 
        $emp = mysqli_query($conn, "select * from employee where role is not null ");
        ?>
<div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
        <tr>
                        <th scope="col">
                            <?php echo $none; ?>No rights
                        </th>
                        &nbsp;
                        <th scope="col">
                            <?php echo $read; ?>Read-only
                        </th>
                        &nbsp;
                        <th scope="col">

                            <?php echo $write; ?>Add/Update
                        </th>

                        &nbsp;
                        <th scope="col">

                            <?php echo $delete; ?>Delete
                        </th>

                        &nbsp;
                        <th scope="col">

                            <?php echo $all; ?>All rights
                        </th>


                    </tr>
        </thead>
        </table>
        </div>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                        <th>Employee</th>
                        <th scope="col" rowspan="2">Role Name</th>
                        <th scope="col" colspan="8">Rights</th>
                        <th scope="col" colspan="2">Un-assign</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Accommodation</th>
                        <th>Complaints</th>
                        <th>Employee</th>
                        <th>Employee Outing</th>
                        <!-- <th>Roles</th> -->
                        <th>Tankers</th>
                        <th>Jobs</th>
                        <th>Vaccination</th>
                        <!-- <th>Vaccination Category</th> -->
                        <th>Visitor Log</th>
                        <th></th>
                        <!-- <th colspan="2">Action</th> -->
                    </tr>
                    <?php while ($emp_row = mysqli_fetch_array($emp)) { 
                        $results = mysqli_query($conn, "SELECT * FROM roles JOIN rights ON rights = id where role_id='{$emp_row['role']}'");
                    $row = mysqli_fetch_array($results);
                        ?>
                    <tr>
                        <td><?php echo $emp_row['fname']." ".$emp_row['lname']." - ".$emp_row['emp_code']; ?></td>
                        <td>
                            <?php echo $row['role_name']; ?>
                        </td>
                        <td>
                                <?php
                                if ($row['accomodation'] < 1)
                                    echo $none;
                                if ($row['accomodation'] == 1)
                                    echo $read;
                                if (($row['accomodation'] >= 2 && $row['accomodation'] <= 3) || $row['accomodation'] == 6)
                                    echo $write;
                                if ($row['accomodation'] >= 4 && $row['accomodation'] < 7)
                                    echo $delete;
                                if ($row['accomodation'] == 7)
                                    echo $all;

                                ?>


                            </td>
                            <td>
                                <?php
                                if ($row['complaints'] < 1)
                                    echo $none;
                                if ($row['complaints'] == 1)
                                    echo $read;
                                if (($row['complaints'] >= 2 && $row['complaints'] <= 3) || $row['complaints'] == 6)
                                    echo $write;
                                if ($row['complaints'] >= 4 && $row['complaints'] < 7)
                                    echo $delete;
                                if ($row['complaints'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <td>
                                <?php
                                if ($row['employee_details'] < 1)
                                    echo $none;
                                if ($row['employee_details'] == 1)
                                    echo $read;
                                if (($row['employee_details'] >= 2 && $row['employee_details'] <= 3) || $row['employee_details'] == 6)
                                    echo $write;
                                if ($row['employee_details'] >= 4 && $row['employee_details'] < 7)
                                    echo $delete;
                                if ($row['employee_details'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <td>
                                <?php
                                if ($row['employee_outing'] < 1)
                                    echo $none;
                                if ($row['employee_outing'] == 1)
                                    echo $read;
                                if (($row['employee_outing'] >= 2 && $row['employee_outing'] <= 3) || $row['employee_outing'] == 6)
                                    echo $write;
                                if ($row['employee_outing'] >= 4 && $row['employee_outing'] < 7)
                                    echo $delete;
                                if ($row['employee_outing'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <!-- <td>
                                        <?php
                                        //     if ($row['roles'] < 1)
                                        //     echo $none;
                                        // if ($row['roles'] == 1)
                                        //     echo $read;
                                        // if (($row['roles'] >= 2 && $row['roles'] <= 3)||$row['roles'] ==6 )
                                        //     echo $write;
                                        // if ($row['roles'] >= 4 && $row['roles'] < 7)
                                        //     echo $delete;
                                        // if ($row['roles'] == 7)
                                        //     echo $all;
                                        ?>
                            
                                    </td> -->
                            <td>
                                <?php
                                if ($row['tankers'] < 1)
                                    echo $none;
                                if ($row['tankers'] == 1)
                                    echo $read;
                                if (($row['tankers'] >= 2 && $row['tankers'] <= 3) || $row['tankers'] == 6)
                                    echo $write;
                                if ($row['tankers'] >= 4 && $row['tankers'] < 7)
                                    echo $delete;
                                if ($row['tankers'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <td>
                                <?php
                                if ($row['jobs'] < 1)
                                    echo $none;
                                if ($row['jobs'] == 1)
                                    echo $read;
                                if (($row['jobs'] >= 2 && $row['jobs'] <= 3) || $row['jobs'] == 6)
                                    echo $write;
                                if ($row['jobs'] >= 4 && $row['jobs'] < 7)
                                    echo $delete;
                                if ($row['jobs'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <td>
                                <?php
                                if ($row['vaccination'] < 1)
                                    echo $none;
                                if ($row['vaccination'] == 1)
                                    echo $read;
                                if (($row['vaccination'] >= 2 && $row['vaccination'] <= 3) || $row['vaccination'] == 6)
                                    echo $write;
                                if ($row['vaccination'] >= 4 && $row['vaccination'] < 7)
                                    echo $delete;
                                if ($row['vaccination'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <!-- <td>
                                        <?php
                                        //     if ($row['vaccination_category'] < 1)
                                        //     echo $none;
                                        // if ($row['vaccination_category'] == 1)
                                        //     echo $read;
                                        // if (($row['vaccination_category'] >= 2 && $row['vaccination_category'] <= 3)||$row['vaccination_category'] ==6 )
                                        //     echo $write;
                                        // if ($row['vaccination_category'] >= 4 && $row['vaccination_category'] < 7)
                                        //     echo $delete;
                                        // if ($row['vaccination_category'] == 7)
                                        //     echo $all;
                                        ?>
                            
                                    </td> -->
                            <td>
                                <?php
                                if ($row['visitor_log'] < 1)
                                    echo $none;
                                if ($row['visitor_log'] == 1)
                                    echo $read;
                                if (($row['visitor_log'] >= 2 && $row['visitor_log'] <= 3) || $row['visitor_log'] == 6)
                                    echo $write;
                                if ($row['visitor_log'] >= 4 && $row['visitor_log'] < 7)
                                    echo $delete;
                                if ($row['visitor_log'] == 7)
                                    echo $all;
                                ?>

                            </td>
                            <td>
                            <?php if($_SESSION['emp_id']!=$emp_row['emp_id']){ ?>
                                <a href="../../controllers/role_controller.php?del_roleof_emp=<?php echo $emp_row['emp_id'];; ?>"
                                    class="del_btn">
                                    <span class="material-icons">link_off</span>
                                </a>
                                <?php } ?>
                            </td>
                        <!-- <td>
                            <a href="./roles.php?edit=<?php //echo '%27' ?><?php //echo $row['role_id']; ?><?php //echo '%27' ?>"
                            class="edit_btn"> <i class="bi bi-pencil-square"
                            style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            &nbsp;
                            <a href="../../controllers/role_controller.php?del=<?php //echo '%27' ?><?php //echo $row['role_id']; ?><?php //echo '%27' ?>"
                                class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                        </td> -->
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="table-footer pa4">
        <!-- <div class="fl w-60 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div> -->
        
        <div class="fl w-20 tr">
            <button class="btn btn-light">
                <h4><a href="role_assign.php">Assign Role</a></h4>
            </button>   
        </div>
        <div class="fl w-20 tr">
            <button class="btn btn-light">
                <h4><a href="roles.php">Add Role</a></h4>
            </button>   
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>
</html>