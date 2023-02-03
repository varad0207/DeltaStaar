<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/security_controller.php'); ?>
<!doctype html>
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>DELTA@STAAR | Security</title>
    
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

<body>
    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.html';
    include '../../controllers/includes/navbar.html';
    ?>
    <div class="table-header">
        <h1 class="tc f1 lh-title spr">Security</h1>
        <div class="fl w-75 form-outline srch">
            <input type="search" id="form1" class="form-control" placeholder="Search" aria-label="Search"
                oninput="search()" />
            <h4 id="demo"></h4>
        </div>
        <div class="fl w-25 tr">
            <button class="btn btn-dark">
                <h5><i class="bi bi-filter-circle"> Sort By</i></h5>
            </button>
        </div>
    </div>

    <div class="table-div">
        <?php if (isset($_SESSION['message'])): ?>
                <div class="msg">
                    <?php
                    echo $_SESSION['message'];
                    unset($_SESSION['message']);
                    ?>
                </div>
        <?php endif ?>
        <?php $results = mysqli_query($conn, "SELECT * FROM security"); ?>
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                <tr>
                    <th>Security Name</th>
                    <th>Accomodation Name</th>
                    <th colspan="2">Action</th>
                </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($results)) { ?>
                    <?php 
                    $empid = $row['emp_id'];
                    $queryEmpId = mysqli_query($conn, "SELECT * FROM employee WHERE emp_id = $empid");
                    $empid_row = mysqli_fetch_assoc($queryEmpId); 
                    $accid = $row['acc_id'];
                    $queryAccId = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = $accid");
                    $accid_row = mysqli_fetch_assoc($queryAccId);
                    ?>
                    <tr>
                        <td>
                            <?php echo $empid_row['fname']." ".$empid_row['lname']; ?>
                        </td>
                        <td>
                            <?php echo $accid_row['acc_name']; ?>
                        </td>
                        <td>
                            <a href="security.php?edit=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="edit_btn"><i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i></a>
                        </td>
                        <td>
                            <a href="../../controllers/security_controller.php?del=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i></a>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>

</html>