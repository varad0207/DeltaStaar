<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/security_controller.php'); ?>
<?php
if (isset($_GET['edit'])) {
	$emp_id = $_GET['edit'];
	$update = true;
	$record = mysqli_query($conn, "SELECT * FROM security WHERE emp_id=$emp_id");

	// if (count($record) == 1 ) {
	$n = mysqli_fetch_array($record);

	$emp_id = $n['emp_id'];
	$acc_id = $n['acc_id'];

	// }
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
	<title>Delta@STAAR | Security</title>
	<meta name="description" content="Employee Addition portal for deltin employees">
	<link rel="stylesheet" href="../../css/form.css">
	<link rel="stylesheet" href="../../css/style1.css">

	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="b ma2">
	<nav class="navbar  navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
		<div class="container-fluid">
			<a class="navbar-brand" href="../dashboard.php">
			<img src="../../images/logo-no-name.png" height="50px" alt="Deltin Logo" class="d-inline-block align-text-top"
                    style="border-radius: 50px;">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: #fff;">Delta@STAAR</h5>
					<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="../dashboard.php">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="../aboutus.html" target="_blank">About Us</a>
						</li>

						<li class="nav-item">
							<a class="nav-link active" href="#" target="_blank">Locations</a>
						</li>

						<li class="nav-item">
							<!-- <a class="nav-link active1" id="adminlogin" href="../dashboard.php">Back</a> -->
							<a class="nav-link active1" id="adminlogin" onmouseover="this.style.cursor='pointer'"
								onclick=history.back()>Back</a>

						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
		
	
	<div class="container">
		<!-- <h1 class="tc f1 lh-title">Add New Security</h1> -->
		<div class="row mx-0 justify-content-center">
			<div class="col-md-7 col-lg-5 px-lg-2 col-xl-4 px-xl-0 bg f4 lh-copy">
				<?php if (isset($_SESSION['message'])): ?>
				<div class="msg">
					<?php
	                echo $_SESSION['message'];
	                unset($_SESSION['message']);
                    ?>
				</div>
				<?php endif ?>


				<?php $results = mysqli_query($conn, "SELECT * FROM security"); ?>

				<?php $results = mysqli_query($conn, "SELECT * FROM security"); ?>


				<table>
					<thead>
						<tr>

						<!-- <th>emp-id </th>
						<th>acc_id </th> -->
						<th>Employee code </th>
						<th>Accommodation name </th>
					</thead>
					<tbody>
						<tr>
						<!-- <td><?php echo $EmployeeCode_row['emp_code']; ?></td> -->
			 			<!-- <td><?php echo $AccomodationName_row['acc_name']; ?></td>   -->
						<td><?php 
							while ($row = mysqli_fetch_array($results)) 
							{ ?>
								<?php $employeeid = $row['emp_id'];
	    						$queryEmployeeCode = mysqli_query($conn, "SELECT * FROM employee where emp_id=$employeeid");
	    						$EmployeeCode_row = mysqli_fetch_assoc($queryEmployeeCode);
								$accomodationid = $row['acc_id'];
	    						$queryAccomodationName = mysqli_query($conn, "SELECT * FROM accomodation where acc_id=$accomodationid");
	    						$AccomodationName_row = mysqli_fetch_assoc($queryAccomodationName);
        						?>
								<?php
								$accomodationid = $row['acc_id'];
                    			$queryAccomodationName = mysqli_query($conn, "SELECT * FROM accomodation where acc_id=$accomodationid");
                    			$AccomodationName_row = mysqli_fetch_assoc($queryAccomodationName);
								?>
							
							
							<td><?php echo $EmployeeCode_row['emp_code']; ?></td>
							<td><?php echo $AccomodationName_row['acc_name']; ?></td>
						</tr>
						<td>


							<a href="security.php?edit=<?php echo '%27' ?><?php echo $row['emp_id']; ?><?php echo '%27' ?>"
								class="edit_btn">Edit</a>
						</td>
						<td>
							<a href="../../controllers/security_controller.php?del=<?php echo '%27' ?><?php echo $row['emp_id']; ?><?php echo '%27' ?>"
								class="del_btn">Delete</a>
						</td>
					</tr>
					<?php } ?>
				</table>

				<form method="post" class="w-100 rounded p-4 border bg-white" action="../../controllers/security_controller.php">

					<h1 class="f2 lh-copy tc" style="color: black;">Define Security</h1>
					<input type="hidden" name="emp_id" value="<?php echo $emp_id; ?>">
					<!-- <div class="input-group">
						<label class="d-block mb-4"> <span class="d-block mb-2">Employee Code
						<?php if ($update == true): ?>
						<input class="form-control" disabled type="text" name="emp_code" value="<?php echo $emp_code; ?>">
						<?php else: ?>
						<input class="form-control" type="text" name="emp_code" value="<?php echo $emp_code; ?>">
						<?php endif ?>
					</div> -->
					</label>
					<div class="input-group">
						<label class="d-block mb-4"> <span class="d-block mb-2">Employee Code <span></span>

								<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="Id">
									<option name="employee_code" selected>Choose...</option>

									<?php
                            $emp_det = mysqli_query($conn, "SELECT * FROM employee");

                            foreach ($emp_det as $row) { ?>
									<option name="employee_code" value="<?= $row["emp_id"] ?>"><?= $row["emp_code"]; ?>
									</option>
									<?php
                            }

                                ?>
								</select>
					</div>
					</label>
					<div class="input-group">
						<label class="d-block mb-4"> <span class="d-block mb-2">Accomodation Name <span>

									<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref"
										name="acId">
										<option name="employee_code" selected>Choose...</option>

										<?php
                            $emp_det = mysqli_query($conn, "SELECT * FROM accomodation");

                            foreach ($emp_det as $row) { ?>
										<option name="employee_code" value="<?= $row["acc_id"] ?>"><?= $row["acc_name"]; ?></option>
										<?php
                            }

                                ?>
									</select>
					</div>
					</label>

					</label>

					</label>
					<div class="mb-3 tc">
						<?php if ($update == true): ?>
						<button class="btnn" type="submit" name="update" value="update"
							style="background: #556B2F;">update</button>
						<?php else: ?>
						<button class="btn btn-dark px-3" class="btnn" type="submit" name="save"
							value="save">Save</button>
						<?php endif ?>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

</html>