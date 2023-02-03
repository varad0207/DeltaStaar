<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/security_controller.php'); ?>
<?php
if (isset($_GET['edit'])) {
	$id = $_GET['edit'];
	$update = true;
	$record = mysqli_query($conn, "SELECT * FROM security WHERE id = $id");

	$n = mysqli_fetch_array($record);

	$emp_id = $n['emp_id'];
	$acc_id = $n['acc_id'];

}
?>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Security</title>
    <meta name="description" content="Complaint submission portal for deltin employees">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
</head>
<body class="b ma2">
    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.html';
    include '../../controllers/includes/navbar.html';
    ?>
	
	<div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Add Security</h1>
                        <form class="requires-validation f3 lh-copy" novalidate
                            action="../../controllers/security_controller.php" method="post">
                            <input type="hidden" name="emp_id" value="<?php echo $emp_id; ?>">
                            <div class="col-md-12 pa2">
                                <<label class="d-block mb-4">Employee Code</label>
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
								
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>

							<input type="hidden" name="acc_id" value="<?php echo $acc_id; ?>">
                            <div class="col-md-12 pa2">
								<label class="d-block mb-4">Accomodation Name</label>
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
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>
                            

                            <div class="form-button mt-3 tc">
                                <?php if ($update == true): ?>
                                <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;"
                                    type="submit" name="update" value="update"
                                    style="background: #556B2F;">update</button>
                                <?php else: ?>
                                <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;"
                                    type="submit" name="submit" value="submit">Submit</button>
                                <?php endif ?>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../js/form.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>