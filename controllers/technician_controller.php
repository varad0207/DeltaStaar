<?php  include('includes/common.php'); ?>
<?php 
	
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    // initialize variables
	$emp_id = "";
	$role = "";
    $update = false;

	if (isset($_POST['save'])) {
		$emp_id = $_POST['eId'];
		$role = $_POST['role'];
        mysqli_query($conn, "INSERT INTO technician (emp_id,role) VALUES ('$emp_id', '$role')"); 
		$_SESSION['message'] = "technician details saved"; 
		header('location: ../views/config/technician.php');
	}

    if (isset($_POST['update'])) {
        $emp_id= $_POST['eId'];
		$role = $_POST['role'];
        mysqli_query($conn, "UPDATE technician SET emp_id='$emp_id', role='$role'");
        $_SESSION['message'] = "employee Info updated!"; 
        header('location: ../views/config/technician.php');
    }

    if (isset($_GET['del'])) {
        $id = $_GET['del'];
        mysqli_query($conn, "DELETE FROM `technician` WHERE `id`=$id");
        $_SESSION['message'] = "technician deleted!"; 
        header('location: ../views/config/technician.php');
    } 