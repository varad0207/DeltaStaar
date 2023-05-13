<?php
require "../controllers/includes/common.php";
if (!isset($_SESSION["emp_id"]))
    header("location:../index.php");
    
$emp = mysqli_query($conn, "select * from employee where emp_id='{$_SESSION['emp_id']}'");
$emp_details = mysqli_fetch_array($emp);
$check_technician = mysqli_query($conn, "select * from employee join technician using(emp_id) where emp_id='{$_SESSION['emp_id']}' and employee.role is not null");
$check_security = mysqli_query($conn, "select * from employee join security using(emp_id) where emp_id='{$_SESSION['emp_id']}' and role is not null");
$isSecurity = 0;
$isSuperadmin = 0;
$isTechnician = 0;

if ($_SESSION['is_superadmin']) {
    $isSuperadmin = 1;
} else {
    if (mysqli_num_rows($check_technician) > 0 && mysqli_num_rows($check_security) > 0) {
        //security is also technician
    } else if (mysqli_num_rows($check_technician) > 0) {
        $isTechnician = 1;
    } else if (mysqli_num_rows($check_security) > 0) {
        $isSecurity = 1;
    }
}
// echo "<script>alert('1');</script>";
// if (isset($_COOKIE['new_user'])) {
//     // User has logged in before
//     setcookie('new_user', '', time() - 3600); // delete the cookie
//   } else {
    // User is logging in for the first time
    //setcookie('new_user', 'true', time() + (86400 * 30), '/'); // set the cookie to expire in 30 days
    //echo "<script>alert('Welcome to DELTASTAAR!');</script>";
//   }
?>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />

    <link rel="stylesheet" href="../css/sidebar.css">
    <link rel="stylesheet" href="../css/technician.css">
    <link rel="stylesheet" href="../css/securityDashboard.css">
    <link rel="stylesheet" href="../css/employeeDashboard.css">
    <link rel="stylesheet" href="../css/style1.css">
    <link rel="stylesheet" href="../css/overlay.css">

    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../images/logo-no-name-circle.png">

    <title>Dashboard</title>

</head>

<body class="bgcolor">
    <!-- Sidebar-->
    <?php
    include '../controllers/includes/sidebar.php';
    ?>


    <!--Start of Main content-->

    <div id="main">

        <!-- Navigation Bar -->
        <?php
        include '../controllers/includes/navbar.php';
        ?>

        <div class="tc f1 lh-title txt7">
            Welcome back, 
            <span class="spr">
                <?php echo $emp_details['fname']; ?>
            </span>!
        </div>
        <?php
        if ($isSuperadmin)
            include '../controllers/includes/superadmin.php';
        else if ($isTechnician)
            include '../controllers/includes/technician.php';
        else if ($isSecurity)
            include '../controllers/includes/security.php';
        else
            include '../controllers/includes/employee.php';
        ?>
        <!-- Footer -->
        <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
    </div>
    
    <!-- overlay code start -->
    <div class="overlay" id="overlay"> 
        <div class="overlay-window">
            <div class="overlay-window-titlebar">
                <span class="overlay-title">Welcome <span class=name><?php echo $emp_details['fname']; ?></span></span>
                <button class="close material-icons" onclick="document.getElementById('overlay').style.display='none'">close</button>
            </div>
            <div class="overlay-content" style="color:black">
                    Welcome to DELTASTAAR!<br><br>
                    To change password <a href="../views/config/reset_password.php">Click Here</a>
            </div>
        </div>
    </div>
    <!-- overlay end -->
    

    <!--End of Main content-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/md5.js"></script>

    <script>
        window.onload = function() {
        // console.log(localStorage.getItem('visited'));
        if (!localStorage.getItem('visited')) {
            var xmlhttp = new XMLHttpRequest();

            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var myObj = JSON.parse(this.responseText);
                    console.log(myObj[0]);
                    if(CryptoJS.MD5("password").toString()==myObj[0]){
                        document.getElementById('overlay').style.display = "flex";
                        localStorage.setItem('visited', true);
                    }
                    else{
                        localStorage.setItem('visited', false);
                        document.getElementById('overlay').style.display = "none";
                    }
                }
            };

            xmlhttp.open("GET", "../controllers/validation.php?id=" + <?php echo $_SESSION['emp_id']; ?>, true);
            xmlhttp.send(); 
        }
        else
            document.getElementById('overlay').style.display = "none";
        };
    </script>

    <script src="../js/Sidebar/sidebar.js"></script>

    <!--Scripts for Navbar (as in dashboard.php)-->
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <!--Scripts required for Bootstrap and Sidebar-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>