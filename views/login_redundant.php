<?php
require '../controllers/includes/common.php';
if (isset($_SESSION["emp_id"])) {
    session_unset();
    session_destroy();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <link rel="stylesheet" href="../css/logincss.css">
</head>

<body style="background: url(../images/bg-dark.png) center no-repeat;">

    <!-- Navigation Bar -->
    <!-- <nav class="navbar  navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="../images/logo-no-name.png" height="50px" alt="Deltin Logo" class="d-inline-block align-text-top"
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
                            <a class="nav-link active" href="aboutus.html">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Locations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./views/complaint/complaint.php">Complaints+</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active1" href="../index.php">Back</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav> -->

    <!-- <p><a href="register.php">Register</a> | <a href="login.php">Login</a> | <a href="index.html">Home</a> </p> -->


    <!--<form action="../controllers/login_controller.php" method="POST">
        Employee Code: <input type="text" name="user"><br><br>
        Password: <input type="password" name="pass"><br><br>
        <input type="submit" value="Login" name="submit"></input>
    </form>-->
    
    <section class="h-100 gradient-form" >
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">

                <div class="card rounded-3 gradient-custom-2 p-md-5" style="width: 30%; height:90%">

                    <div class="text-center">

                        <img src="../images/logo-no-name.png" style="width: 60%;" alt="logo">

                        <h3 class="mt-1 mb-4 pt-3">Login to your account</h3>
                    </div>

                    <form action="../controllers/login_controller.php" method="POST">
                        <div class="form-outline mb-4">
                            <i class="bi bi-person-circle" style="font-size: 1rem; color: #1b1c1e;"></i>
                            <label class="form-label" for="empcode">Employee Code</label>
                            <input type="text" name="user" id="empcode" class="form-control"
                                placeholder="Enter Employee Code">
                            </input>
                        </div>
                        <div class="form-outline mb-4">
                            <i class="bi bi-key-fill" style="font-size: 1rem; color: #1b1c1e;"></i>
                            <label class="form-label" for="password">Password</label>
                            <input type="password" name="pass" id="password" class="form-control"
                                placeholder="Enter Password" />
                        </div>
                        <div class="text-center pt-1">
                            <button class="btn btn-dark btn-block fa-lg" type="submit" value="Login" name="submit">Log
                                in</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>



    <script type="text/javascript">
        //comment the line below to activate the pop up on dashboard only for the first login 
        localStorage.clear();
</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>