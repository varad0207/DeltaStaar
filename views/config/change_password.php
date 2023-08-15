<?php
include('../../controllers/includes/common.php');
if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");
if ($_SESSION['is_superadmin'] == 0)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$n = mysqli_fetch_array(mysqli_query($conn, "SELECT fname,emp_code,emp_id FROM employee WHERE emp_code='{$_SESSION['emp_code']}'"));
$emp_id = $n['emp_id'];
$emp_code = $n['emp_code'];
$name = $n['fname'];

if (isset($_POST['submit'])) {   //Fetching employee code
    $emp_code = $_POST['emp_code'];
    if ($emp_code == $_SESSION["emp_code"]) {
        die('<script>if (window.confirm("You can change password to your account by clicking yes"))
            {
                document.location = "../../views/config/reset_password.php";
            }
            else
            {
                window.location = history.back();
            }
            </script>');
    }
    //Fetching the employee id 
    $emp_id_qry = mysqli_query($conn, "SELECT `emp_id` FROM `employee` WHERE `emp_code`='$emp_code'");
    if ($emp_id_qry) {
        if (mysqli_num_rows($emp_id_qry) > 0) {
            $row = mysqli_fetch_assoc($emp_id_qry);
            $emp_id = $row['emp_id'];
            if (mysqli_num_rows(mysqli_query($conn, "SELECT `emp_id` FROM `login_credentials` WHERE `emp_id`='$emp_id'")) < 1) {
                die('<script>alert("The selected employee does not have access to the portal");window.location = history.back();</script>');
            }
            //Go to login credentials & reset password for that employee
            mysqli_query($conn, "UPDATE `login_credentials` SET `pass`='5f4dcc3b5aa765d61d8327deb882cf99' WHERE `emp_id`='$emp_id'");
?><script>
                alert("Password Reset Successful");
            </script>
        <?php
        } else {
        ?>
            <script>
                alert("Invalid Employee Code. Try again!");
            </script>
<?php
        }
    }
}


?>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Reset Password</title>
    <meta name="description" content="Reset password">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <style>
        #oldpassword {
            font-weight: bold;
        }
    </style>
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
                        <h1 class="f2 lh-copy tc" style="color: white;">Reset Password</h1>
                        <form class="requires-validation f3 lh-copy" novalidate action="" method="POST">
                            <div class="col-md-12 pa2">
                                <label class="d-block mb-4">Employee Code</label>
                                <input type="text" name="emp_code" placeholder="Enter the Employee Code">
                            </div>
                            <div class="form-button mt-3 tc">
                                <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="../../js/form.js"></script>
    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>