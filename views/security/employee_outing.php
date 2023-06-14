<?php
include('../../controllers/includes/common.php');
include('../../controllers/employee_outing_controller.php');

if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);

if ($rights['rights_employee_outing'] > 1) {
  $isPrivilaged = $rights['rights_employee_outing'];
} else
  die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

if ($isPrivilaged == 5 || $isPrivilaged == 4)
  die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

// if($_SESSION['is_superadmin'] == 1){
//     die('<script>alert("You dont have access to this page, Please contact security");window.location = history.back();</script>');
// }

if (isset($_GET['edit'])) {
  $emp_code = $_GET['edit'];
  $details = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM employee_outing WHERE emp_code=$emp_code"));

  $outing_date = $details['outing_date'];
  $arrival_date = $details['arrival_date'];
  $purpose = $details['category'];
  $type = $details['type'];
}

?>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!--Favicon link-->
  <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
  <title>Delta@STAAR | Employee Outing</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <link rel="stylesheet" href="../../css/form.css">
  <link rel="stylesheet" href="../../css/style1.css">
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <!-- Tachyons -->
  <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
  <!-- CSS files -->
  <link rel="stylesheet" href="../../css/table.css">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
            <h1 class="f2 lh-copy tc" style="color: white;">Employee Outing Details</h1>
            <form class="requires-validation f3 lh-copy" novalidate
              action="../../controllers/employee_outing_controller.php" method="post">
              <div class="col-md-12 pa2">
                <label for="empcode">Employee Code</label>
                <?php if (isset($_GET['edit'])) { ?>
                  <input type="text" name="emp_code" value=<?php echo $emp_code ?> readonly>
                  <?php
                } else { ?>
                  <select class="form-select mt-3" name="emp_code" id="empcode" required onchange="freq()">
                    <option selected disabled value="" name="employee_code">Select Employee Code</option>
                    <?php
                    $emp_code = mysqli_query($conn, "SELECT * FROM employee");
                    foreach ($emp_code as $row) { ?>
                      <option name="employee_code" value="<?= $row["emp_code"] ?>"><?= $row["emp_code"]; ?></option>
                    <?php } ?>
                  </select>
                  <div class="invalid-feedback">Please select an option!</div>
                <?php } ?>
              </div>
              <div class="col-md-12 pa2">
                <label for="quantity">Outing Start Date</label>
                <input class="form-control" type="date" name="start_date" value="<?= $outing_date ?>" min="<?= date('Y-m-d'); ?>" required>
              </div>
              <div class="col-md-12 pa2">
                <label for="quantity">Arrival Date (Optional)</label>
                <input class="form-control" type="date" name="arrival_date" value="<?= $arrival_date ?>" min="<?= date('Y-m-d'); ?>">
              </div>
              <div class="col-md-12 pa2">
                <label for="type">Type of Outing</label>
                <select class="form-select mt-3" name="type" required>
                  <option selected disabled value="" name="outing_type">Select Outing Type</option>
                  <?php
                  $sql1 = mysqli_query($conn, "SELECT * FROM outing_type");
                  foreach ($sql1 as $row1) { ?>
                    <option name="outing_type" value="<?= $row1["type_id"] ?>"><?= $row1["type_name"]; ?></option>
                  <?php } ?>
                </select>
                <div class="invalid-feedback">Please select an option!</div>
              </div>
              <div class="col-md-12 pa2">
                <label for="description">Description (Optional)</label>
                <textarea name="purpose" cols="30" rows="10" value="<?php $purpose ?>"></textarea>
              </div>
              <div class="form-button mt-3 tc">
                <div class="form-button mt-3 tc">
                  <?php if (!isset($_GET['edit'])) { ?>
                    <button id="submit" name="submit" value="sumbit" type="submit" class="btn btn-warning f3 lh-copy"
                      style="color: white;">Submit</button>
                  <?php } else { ?>
                    <button id="submit" name="update" value="update" type="submit" class="btn btn-warning f3 lh-copy"
                      style="color: white;">Update</button>
                  <?php } ?>
                </div>
              </div>
            </form>
          </div>


        </div>
        <div id="outing-freq"> </div>
      </div>
    </div>
  </div>

  <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
  <script src="../../js/emp.js"></script>
  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
      'use strict';
      window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();

    document.querySelector("#empcode").onclick = (event) => {
      var selectedValue = document.getElementById("empcode").value;

      if (selectedValue) {
        freq();

      }

    }

    function freq() {
      var selectedValue = document.getElementById("empcode").value;
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          var myObj = this.responseText;
          console.log(myObj)
          if (myObj) {
            const freq_div = document.querySelector('#outing-freq');
            freq_div.innerHTML = myObj;
            document.getElementById('outing-freq').style.display = 'flex';
          }
        }
      };
      xmlhttp.open("GET", "../../controllers/overlays/outingFrequency.php?employeecode=" + selectedValue, true);
      xmlhttp.send();

    }
  </script>

</body>

</html>