<?php
require '../../controllers/includes/common.php';
require '../../controllers/complaint_controller.php';

if(isset($_SESSION['emp_id']) && isset($_GET['edit'])){
    $acc = mysqli_fetch_array(mysqli_query($conn, 
        "SELECT acc_code 
        FROM employee 
        join rooms on rooms.id=employee.room_id
        join accomodation on accomodation.acc_id=rooms.acc_id
        WHERE emp_id='{$_SESSION['emp_id']}'"));
    $acc_code=$acc['acc_code'];
}

$update = "";
$acc_code='';
if (isset($_GET['edit'])) {
	$id = $_GET['edit'];
	$update = true;
	$record = mysqli_query($conn, "SELECT * FROM complaints WHERE id=$id");

	$n = mysqli_fetch_array($record);

	$raise_timestamp = $n['raise_timestamp'];
	$category = $n['category'];
	$description = $n['description'];
	$status = $n['status'];
	$tech_closure_timestamp = $n['tech_closure_timestamp'];
	$sec_closure_timestamp = $n['sec_closure_timestamp'];
	$warden_closure_timestamp = $n['warden_closure_timestamp'];
	$remarks = $n['remarks'];
	$emp_code = $n['emp_code'];
    $acc_code=$n['acc_code'];

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Raise Complaint</title>
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
   if (isset($_SESSION['emp_id'])) {
       include '../../controllers/includes/sidebar.php';
       include '../../controllers/includes/navbar.php';
   }
    ?>
    <div class="form-body">
    <div class="row">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h1 class="f2 lh-copy tc" style="color: white;">Raise a Complaint</h1>
                    <?php if (isset($_SESSION['message'])): ?>
				<div class="msg">
					<?php
	                echo $_SESSION['message'];
	                unset($_SESSION['message']);
                    ?>
				</div>
				<?php endif ?>
                    <form class="requires-validation f3 lh-copy" novalidate action="../../controllers/complaint_controller.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $id; ?>">
                        <input type="hidden" name="acc_code" value="<?php echo $acc_code; ?>">

                            <div class="col-md-12 pa2">
                                <label for="empcode">Employee Code</label>
                                <?php if (isset($_SESSION['emp_id']) && !$update) { ?>
                                <input class="form-control" id="empcode" style="pointer-events: none;"  type="text" name="emp_code" value="<?php echo $_SESSION['emp_code']; ?>">
                                <?php } else {?>
                                <input class="form-control" id="empcode" value="" type="text" name="emp_code" placeholder="eg.HV1234" required onkeyup="GetDetail(this.value)">
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                                <?php } ?>
                            </div>

                            <div class="col-md-12 pa2">
                                <label for="accCode">Accomodation Code</label>
                                <input class="form-control" value="<?php echo $acc_code; ?>" type="text" id="acccode" name="acc_code" placeholder="eg.ACC1234" required>
                                <div class="valid-feedback">field is valid!</div>
                                <div class="invalid-feedback">field cannot be blank!</div>
                            </div>
                        
                        <!-- <div class="col-md-12 pa2">
                            <label for="category">Category</label>
                                <select class="form-select mt-3" name="category" value="<?php //echo $category; ?>" required>
                                    <option selected disabled value="">Select a category of complaint</option>
                                    <option value="1">Electrical</option>
                                    <option value="2">Plumbing</option>
                                    <option value="3">Carpentary</option>
                                    <option value="Others">Others</option>
                                </select>
                                <div class="valid-feedback">You selected an option!</div>
                                <div class="invalid-feedback">Please select an option!</div>
                        </div> -->

                        <div class="col-md-12 pa2">
                                <label for="type">Complaint Type</label>
                                <select class="form-select mt-3" name="category" required>
                                <option selected disabled value="">Select a category of complaint</option>
                                    <?php
                                    $comp_type = mysqli_query($conn, "SELECT * FROM complaint_type");

                                    foreach ($comp_type as $row) { ?>
                                        <option name="category" value="<?= $row["type_id"] ?>">
                                            <?= $row["complaint_type"]; ?>
                                        </option>
                                    <?php
                                    }

                                    ?>
                                </select>
                                <div class="invalid-feedback">Please select an option!</div>
                            </div>



                        <div class="col-md-12 pa2">
                            <label for="description">Complaint Description</label>
                            <textarea name="description" placeholder="Please describe your problem" cols="30" rows="10" value="<?php echo $description; ?>"></textarea>
                        </div>
                        

                            <div class="form-button mt-3 tc">
                                
                                <?php if ($update == true): ?>
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="update" value="update"
                                style="background: #556B2F;">update</button>
                            <?php else: ?>
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit"
                                value="submit">Submit</button>
                            <?php endif ?>
                            </div>
                    </form>
                 </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <script>
  function GetDetail(str) {
    if (str.length == 0) {
        document.getElementById("acccode").value = "";
        return;
    }
    else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var myObj = JSON.parse(this.responseText);
                document.getElementById("acccode").value = myObj[0];
            }
        };
        xmlhttp.open("GET", "../../controllers/complaint_validation.php?emp_code=" + str, true);
        xmlhttp.send();
    }
  }
</script>

    <script src="../../js/form.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
