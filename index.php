<?php
// require '/Applications/XAMPP/xamppfiles/htdocs/deltinconnect/controllers/includes/common.php'; //for chinmay only

require './controllers/includes/common.php'; // for others

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
	<title>Delta@STAAR | HOME</title>
	<link rel="stylesheet" href="./css/style.css">
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<!-- Tachyons -->
	<link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="bgcolor">
	<!-- Navigation Bar -->
	<nav class="navbar  navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				<img src="images/logo-no-name.png" height="50px" alt="Deltin Logo" class="d-inline-block align-text-top"
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
						<!-- <li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">Home</a>
					</li> -->
						<li class="nav-item">
							<a class="nav-link active" href="./views/aboutus.html">About Us</a>
						</li>
						<!-- <li class="nav-item">
						<a class="nav-link active" href="#" >Rooms</a>
					</li> -->
						<li class="nav-item">
							<a class="nav-link active" href="#">Locations</a>
						</li>
						<!-- <li class="nav-item">
						<a class="nav-link active" href="#" >Tankers</a>
					</li> -->
						<li class="nav-item">
							<a class="nav-link active" href="./views/complaint/complaint.php">Complaints+</a>
						</li>
						<!-- <li class="nav-item pr5">
						<a class="nav-link active" href="#" >Contact Us</a>
					</li> -->
						<li class="nav-item">
							<a class="nav-link active1" href="./views/login.php">LogIn</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- Main Container -->
	<div class="container mt6 pb5">
		<div class="child1 f3 lh-copy tc">
			<h1>Welcome to <span class="txtgold">Delta@STAAR</span></h1>
			<a type="button" class="btn btn-secondary btn-lg" href="./views/login.php">Start / Login</a>
		</div>
		<div class="child2">
			<img src="./images/image1.jpg" alt="Advertising Image">
		</div>
	</div>

	<!-- Footer -->
	<footer class="tc f3 lh-copy mt5">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>

</html>