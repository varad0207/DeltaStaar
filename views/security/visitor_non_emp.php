<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/visitor_log_controller.php');
if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
?>
<?php
    $emptype='nonemp';

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
                            <div class="input-group">
						        <!-- <label class="d-block mb-4"> <span class="d-block mb-2">Security Code :-<span> -->
							    <input class="form-control" type="hidden" name="security_emp_id" value="<?php echo $_SESSION['emp_id']; ?>">
                                </label>
                            </div>
					            
					        <div class="">
						        <label class="d-block mb-4"> <span class="d-block mb-2">Visitor Name:-<span>
								<input class="form-control" type="text" name="visitor_name" value="<?php echo $visitor_name; ?>">
					            </label>
                                </div>
					
					        <div class="input-group">
						        <label class="d-block mb-4"> <span class="d-block mb-2">Vehicle No:- <span>
								<input class="form-control" type="text" name="vehicle_no" value="<?php echo $vehicle_no; ?>">
                                </label>
                            </div>
					

                            <div class="">
						        <label class="d-block mb-4"> <span class="d-block mb-2">Purpose of visit:- <span>
								<input class="form-control" type="text" name="purpose" value="<?php echo $purpose; ?>">
                                </label>
                            </div>
					

                            <div class="input-group">
						        <label class="d-block mb-4"> <span class="d-block mb-2">Phone number:-<span>
								<input class="form-control" type="text" name="phone_no" value="<?php echo $phone_no; ?>">
					            </label>
                            </div>
					

					        <div class="mb-3 tc">
						        <button class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submitnonemp" value="submitnonemp">Submit</button>
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



