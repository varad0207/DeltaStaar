<?php 
    include('../../controllers/includes/common.php'); 
    include('../../controllers/tanker_controller.php'); 
    if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
    $isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_visitor_log'] > 0) {
        $isPrivilaged = $rights['rights_visitor_log'];
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
    <title>DELTA@STAAR | Visitors</title>
    
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
    <h1 class="tc f1 lh-title spr">Visitor Details</h1>
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

<?php
    $sql="SELECT * FROM visitor_log where 1=1";
    /* ***************** PAGINATION ***************** */
    $limit=10;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $start=($page-1) * $limit;
    $sql .=" LIMIT $start,$limit";
    $result=mysqli_query($conn,$sql);

    $q1="SELECT * FROM vaccination";
    $result1=mysqli_query($conn,$q1);
    $total=mysqli_num_rows($result1);
    $pages=ceil($total/$limit);
    $Previous=$page-1;
    $Next=$page+1;
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
                    <th scope="col">Sr.No</th>
                    <th scope="col">Employee ID</th>
                    <th scope="col">Security ID</th>
                    <th scope="col">Visitor Name</th>
                    <th scope="col">Vehicle No</th>
                    <th scope="col">Type of visitor</th>
                    <th scope="col">Purpose</th>
                    <th scope="col">Phone No</th>
                    <th scope="col">Check-in</th>
                    <th scope="col">Check-out</th>
                    <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($result)) {?>
                    <tr>
                    <th scope="row"><?php echo $row['id']; ?></th>
                        
                        <td>
                            <?php echo $row['emp_id']; ?>
                        </td>
                        <td>
                            <?php echo $row['security_emp_id']; ?>
                        </td>
                        <td>
                            <?php echo $row['visitor_name']; ?>
                        </td>
                        <td>
                            <?php echo $row['vehicle_no']; ?>
                        </td>
                        <td>
                            <?php echo $row['type']; ?>
                        </td>
                        <td>
                            <?php echo $row['purpose']; ?>
                        </td>
                        <td>
                            <?php echo $row['phone_no']; ?>
                        </td>
                        <td>
                            <?php 
                            $timestamp = strtotime($row['check_in']);                            
                            $date = date('d M Y ', $timestamp);
                            echo $date; 
                            $time = date('H:i:s', $timestamp); 
                            echo $time; 
                            ?>
                        </td>
                        
                        <td>
                        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>
                            <a href="../../controllers/visitor_log_controller.php?checkout=<?php echo $row['id']; ?>"
                                class="del_btn"><button type="button" class="btn btn-danger" value="checkout" name="checkout">Checkout</button>
                            </a>
                            <?php } ?>
                        </td>
                        <td>
                        <?php if($isPrivilaged>=4){ ?>
                            <a href="../../controllers/visitor_log_controller.php?del=<?php echo '%27' ?><?php echo $row['id']; ?><?php echo '%27' ?>"
                                class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i>
                            </a>
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
            <li class="page-item"><a class="page-link" href="visitor_log_table.php?page=<?=$Previous;?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for($i=1;$i<=$pages;$i++) :?>
    <li class="page-item"><a class="page-link" href="visitor_log_table.php?page=<?=$i?>">
                <?php echo $i; ?>
            </a></li>
            <?php endfor;?>
            <li class="page-item"><a class="page-link" href="visitor_log_table.php?page=<?=$Next;?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>
    <div class="table-footer pa4">
        <div class="fl w-75 tl">
            <button class="btn btn-warning">
                <h4><i class="bi bi-file-earmark-pdf"> Export</i></h4>
            </button>
        </div>
        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="visitor_log.php">Add Visitor</a></h4>
            </button>   
        </div>
        <?php } ?>
    </div>
    
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
</body>
</html>