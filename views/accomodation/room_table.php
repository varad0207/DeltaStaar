<?php 
    include('../../controllers/includes/common.php'); 
    include('../../controllers/rooms_controller.php'); 
    if (!isset($_SESSION["emp_id"]))    header("location:../../index.php");

   // check rights
   $isPrivilaged = 0;
   $rights = unserialize($_SESSION['rights']);
   if ($rights['rights_rooms'] > 0) {
       $isPrivilaged = $rights['rights_rooms'];
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

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../../css/overlay.css">
    
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
    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>

    
    <div class="table-header">
    <h1 class="tc f1 lh-title spr">Room Details</h1>
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
                    <th>Accomodation Name : </th>
                    <th>Sort By :</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <?php
                            $fetch_accomo = "SELECT * FROM accomodation";
                            $fetch_accomo_run = mysqli_query($conn, $fetch_accomo);
                            if (mysqli_num_rows($fetch_accomo_run) > 0) 
                            {
                                foreach ($fetch_accomo_run as $accomo) 
                                {
                                    $checked1 = [];
                                    if (isset($_GET['accomodation'])) {
                                        $checked1 = $_GET['accomodation'];
                                    }
                            ?>
                                    <div>
                                        <input type="checkbox" name="accomodation[]" value="<?= $accomo['acc_id']; ?>" <?php if (in_array($accomo['acc_id'], $checked1)) 
                                        {
                               echo "checked";
                           }?>>
                                        <label><?= $accomo['acc_name']; ?></label>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "No designation availabe";
                            }
                            ?>
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
    if (isset($_GET['sort_alpha'])) {
        if ($_GET['sort_alpha'] == "a-z") {
            $sort_condition = "ASC";
        } else if ($_GET['sort_alpha'] == "z-a") {
            $sort_condition = "DESC";
        }
    }

    $sql="SELECT * FROM rooms JOIN accomodation ON rooms.acc_id = accomodation.acc_id where 1=1";
    if(isset($_GET['accomodation'])){
        $accomodation_checked = [];
        $accomodation_checked = $_GET['accomodation'];
        $sql.=" and ( ";
        foreach ($accomodation_checked as $row_acc) {
            $sql .= " accomodation.acc_id=$row_acc or";
        }
        $sql=substr($sql,0,strripos($sql,"or"));  
        $sql.=" ) ";
        // echo $sql;
    }
   if($sort_condition=="")
   {    $sort_condition="ASC";
        $sql.=" ORDER BY acc_name $sort_condition";
   }
   else
   {
        $sql .=" ORDER BY acc_name $sort_condition";
   }
   $room_qry=$sql;
?>
    <?php
    /* ***************** PAGINATION ***************** */
    if (!isset($_GET['page'])) {
        $_SESSION['query'] = $sql;
    }
    $limit = 20;
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
    $result = mysqli_query($conn, $sql);
    /* ************************************************ */
    ?>
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
                    <?php while ($row = mysqli_fetch_array($result)) { ?>
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
                        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>

                            <a href="rooms.php?edit=<?php echo $row['id']; ?>"
                                class="edit_btn"> <i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            <?php } ?>
                            &nbsp;
                            <?php if ($isPrivilaged >= 4) { ?>
                            <a class="del_btn" onclick="myfunc('<?php echo $row['id']; ?>')"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i></a>
                            <form id="del_response" action="../../controllers/rooms_controller.php" method="get">
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
            <li class="page-item"><a class="page-link" href="room_table.php?page=<?=$Previous;?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for($i=1;$i<=$pages;$i++) :?>
    <li class="page-item"><a class="page-link" href="room_table.php?page=<?=$i?>">
                <?php echo $i; ?>
            </a></li>
            <?php endfor;?>
            <li class="page-item"><a class="page-link" href="room_table.php?page=<?=$Next;?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>
    <div class="table-footer pa4">
        <div class="fl w-75 tl">
        <form action="../../Phpspreadsheet/export.php" method="post">
                <button class="btn btn-warning" name="room_export" value="<?php echo $room_qry;?>"><h4><i class="bi bi-file-earmark-pdf"> Export</i></h4></button>
            </form>
        </div>
        <?php if ($isPrivilaged > 1 && $isPrivilaged != 5 && $isPrivilaged != 4) { ?>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="rooms.php">Add Room</a></h4>
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
    <!-- Script Files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    
    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
</body>
</html>