<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/visitor_log_controller.php');
if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
$isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_visitor_log'] > 1) {
        $isPrivilaged = $rights['rights_visitor_log'];
    } else
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    if ($isPrivilaged == 5 || $isPrivilaged == 4)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
  
?>
<?php
	$id = "";
    $cat="";
    $emp_id="";
    $security_emp_id="";
    $visitor_name="";
    $vehicle_no="";
    $purpose="";
    $phone_no="";
    $emptype = "";
    $check_out = "";

	if(isset($_GET['checkout']))
	{
		$id = $_GET['checkout'];
		$update = true;
		$record = mysqli_query($conn, "SELECT * FROM visitor_log WHERE id=$id");

		$n = mysqli_fetch_array($record);

		$cat = $n['type'];
	}
?>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="style.css">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
	<title>Delta@STAAR | Add Visitor</title>
    
	<meta name="description" content="Employee Addition portal for deltin employees">
	<link rel="stylesheet" href="../../css/form.css">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />

</head>

<body class="b ma2">
    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>
	<div class="form-body">
    <div class="row">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h1 class="f2 lh-copy tc" style="color: white;">VISITOR LOG FORM</h1>
                    	<form class="requires-validation f3 lh-copy" novalidate action="../../controllers/visitor_log_controller.php" method="post">
							<div class="col-md-12 pa2">
								<div class="input-group">
								<label class="d-block mb-4" for="inlineFormCustomSelectPref"> <span class="d-block mb-2">Visitor Category :- <span></span>
								<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="cat_id">
								<option name="category_name" selected>Choose...</option>
								<option name="employee" value="emp">Employee</option>
								<option name="non_employee" value="nonemp">Non-Employee</option>
								</select>
								</label>
								</div>
								<div class="invalid-feedback">Please select an option!</div>
								<?php if($update == true): ?>
									<button id="submit" name="checkout" value="checkout" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Checkout</button>
								<?php else: ?>
								<button id="submit" name="empcat" value="empcat" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Go</button>
								<?php endif ?>
                        	</div>
						</form>
					</div>
            	</div>
        	</div>
    	</div>
  	</div>

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>



