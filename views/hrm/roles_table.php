<?php 
    include('../../controllers/includes/common.php'); 
    include('../../controllers/role_controller.php');
    if (!isset($_SESSION["emp_id"]))
        header("location:../../views/login.php");

    //only superadmin can view and assign roles
    if ($_SESSION['is_superadmin'] == 0)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

    // check rights
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark f3 lh-copy fw5">
        <div class="container-fluid">
        <a class="navbar-brand" href="#">
                <img src="../../images/logo-no-name.png" height="50px" alt="Deltin Logo" class="d-inline-block align-text-top"
                    style="border-radius: 50px;">
            </a>
            <ul class="navbar-nav justify-content-end">    
                <li class="nav-item">
                    <a class="nav-link active" id="adminlogin" onmouseover="this.style.cursor='pointer'" onclick = "history.back()" >Back</a>
                </li>
            </ul>    
        </div>
    </nav>

    
    <div class="table-header">
    <h1 class="tc f1 lh-title spr">All Roles</h1>
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
        
        <?php $results = mysqli_query($conn, "SELECT * FROM roles JOIN rights ON rights = id"); ?>

        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                    <th scope="col" rowspan="2">Role Name</th>
                    <th scope="col" colspan="12">Rights</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th></th>
                        <th>Accommodation</th>
                        <th>Complaints</th>
                        <th>Employee</th>
                        <th>Employee Outing</th>
                        <th>Roles</th>
                        <th>Tankers</th>
                        <th>Jobs</th>
                        <th>Vaccination</th>
                        <th>Vaccination Category</th>
                        <th>Visitor Log</th>
                        <th colspan="2">Action</th>
                    </tr>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>
                    <tr>
                        <td>
                            <?php echo $row['role_name']; ?>
                        </td>
                        <td>
                            <?php echo $row['accomodation']; ?>
                        </td>
                        <td>
                            <?php echo $row['complaints']; ?>
                        </td>
                        <td>
                            <?php echo $row['employee_details']; ?>
                        </td>
                        <td>
                            <?php echo $row['employee_outing']; ?>
                        </td>
                        <td>
                            <?php echo $row['roles']; ?>
                        </td>
                        <td>
                            <?php echo $row['tankers']; ?>
                        </td>
                        <td>
                            <?php echo $row['jobs']; ?>
                        </td>
                        <td>
                            <?php echo $row['vaccination']; ?>
                        </td>
                        <td>
                            <?php echo $row['vaccination_category']; ?>
                        </td>
                        <td>
                        <?php echo $row['visitor_log']; ?>
                        </td>
                        
                        <td>
                            <a href="./roles.php?edit=<?php echo '%27' ?><?php echo $row['role_id']; ?><?php echo '%27' ?>"
                            class="edit_btn"> <i class="bi bi-pencil-square"
                            style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            &nbsp;
                            <a href="../../controllers/role_controller.php?del=<?php echo '%27' ?><?php echo $row['role_id']; ?><?php echo '%27' ?>"
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
        <div class="fl w-25 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="roles_assigned_table.php">View Assigned Roles</a></h4>
            </button>   
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="role_assign.php">Assign Role</a></h4>
            </button>   
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="roles.php">Add Role</a></h4>
            </button>   
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>
</html>