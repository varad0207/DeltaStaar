<?php
include('../../controllers/includes/common.php');
include('../../controllers/employee_outing_controller.php');
if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
$isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_vaccination'] > 1) {
        $isPrivilaged = $rights['rights_vaccination'];
    } else
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    if ($isPrivilaged == 5 || $isPrivilaged == 4)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
  
  
  if(isset($_GET['edit'])){ 
    $emp_code=$_GET['edit'];
    $details=mysqli_fetch_array(mysqli_query($conn,"select * from employee_outing where emp_code=$emp_code"));
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
  
  <link rel="stylesheet" href="../../css/form.css">
  <link rel="stylesheet" href="../../css/style1.css">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
    
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
                    <form class="requires-validation f3 lh-copy" novalidate action="../../controllers/employee_outing_controller.php" method="post">
                    

                    <div class="col-md-12 pa2">
                        <label for="empcode">Employee Code</label>
                        <?php if(isset($_GET['edit'])){ ?>
                          <input type="text" name="emp_code"value=<?php echo $emp_code ?> readonly>

                          <?php } 
                          else {
                            ?>
                            <select class="form-select mt-3" name="emp_code" required>
                                <option selected disabled value="" name="employee_code">Select Employee Code</option>
                                <?php
                                  $emp_code=mysqli_query($conn, "SELECT * FROM employee");
                                  
                                  foreach ($emp_code as $row){ ?>
                                  <option name="employee_code" value="<?= $row["emp_code"]?>"><?= $row["emp_code"];?></option>	
                                  <?php } ?>
                           </select>
                            
                            <div class="invalid-feedback">Please select an option!</div>
                            <?php } ?>
                        </div>


                      <div class="col-md-12 pa2">
                        <label for="quantity">Outing Start Date</label>
                          <input class="form-control" type="date" name="start_date" required>
                      </div>

                      <div class="col-md-12 pa2">
                        <label for="quantity">Arrival Date (Optional)</label>
                          <input class="form-control" type="date" name="arrival_date">
                      </div>

                      <div class="col-md-12 pa2">
                        <label for="description">Purpose</label>
                        <textarea name="purpose"  placeholder="Enter the purpose of outing" cols="30" rows="10" value="<?php $details['category'] ?>"></textarea>
                       </div>
                        <div class="form-button mt-3 tc">
                        <div class="form-button mt-3 tc">
                        <?php if(!isset($_GET['edit'])){ ?>

                            <button id="submit" name="submit" value="sumbit" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
                        <?php } else{ ?>
                          <button id="submit" name="update" value="update" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>

                        <?php } ?> 
                          </div>
                        </div>
                    </form>
                </div>
            </div>
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
  </script>
  
</body>
</html>