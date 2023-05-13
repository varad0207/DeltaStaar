<?php
require './controllers/includes/common.php';
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
	<link rel="icon" type="image/x-icon" href="images/logo-no-name-circle.png">
	<title>Delta@STAAR | HOME</title>

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
	<!--Custom CSS-->
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/logincss.css">

</head>

<body class="bgcolor">
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark f4 lh-copy pa3 fw4">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				<img src="./images/logo-no-name.png" height="50px" alt="Deltin Logo"
					class="d-inline-block align-text-top" style="border-radius: 50px;">
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
					<ul class="navbar-nav justify-content-end flex-grow-1">
						<li class="nav-item">
							<a class="nav-link active" href="./views/aboutus.html">About Us</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="./views/complaint/complaint.php">Complaints+</a>
						</li>
						<!-- <li class="nav-item">
							<a class="nav-link active1" href="./views/login.php">Login</a>
						</li> -->
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- Main Container -->
	<div class="wrapper-class">

		<div class="child1">

			<h1 class="text-center">Welcome to <span class="txtgold">Delta@STAAR</span></h1>
			<img class="rounded-4" src="./images/image1.jpg" alt="Advertising Image">
		</div>

		<div class="child2">
			<!--<h1>Welcome to <span class="txtgold">Delta@STAAR</span></h1>-->
			<!--<a type="button" class="btn btn-secondary btn-lg" href="./views/login.php">Start / Login</a>-->

			<div class="card rounded-4 gradient-custom-2">

				<div class="text-center form-head">
					<img src="./images/logo-no-name.png" style="width: 60%;" alt="logo">
					<h3 class="mt-1 mb-4 pt-3">Login to your account</h3>
				</div>

				<form action="./controllers/login_controller.php" method="POST">
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
						<button class="btn btn-dark btn-block fa-lg" type="submit" value="Login" name="submit">
							Log in
						</button>
					</div>
				</form>
			</div>
		</div>

	</div>

	<!-- Footer -->
	<footer class="tc f3 lh-copy mt5 mb-2">
		Copyright &copy; 2022 Delta@STAAR. All Rights Reserved
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>

</html>