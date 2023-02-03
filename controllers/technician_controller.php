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

	if (isset($_POST['submit'])) {
		$emp_id = $_POST['emp_id'];
		$role = $_POST['role'];
        echo "<script>console.log('$emp_id')</script>";
        echo "<script>console.log('1')</script>";
        mysqli_query($conn, "INSERT INTO `technician` (`id`, `emp_id`, `role`) VALUES ('', '$emp_id', '$role')");
		$_SESSION['message'] = "Technician Info Added!"; 
		header('location: ../views/config/technician_table.php');
	}

    if (isset($_POST['update'])) {
        $id = $_POST['id'];
        $emp_id= $_POST['emp_id'];
		$role = $_POST['role'];
        echo "<script>console.log('$id')</script>";
        mysqli_query($conn, "UPDATE technician SET emp_id='$emp_id', role='$role' WHERE id=$id");
        $_SESSION['message'] = "Technician Info Updated!"; 
        header('location: ../views/config/technician_table.php');
    }

    if (isset($_GET['del'])) {
        $id = $_GET['del'];
        mysqli_query($conn, "DELETE FROM `technician` WHERE `id`=$id");
        $_SESSION['message'] = "Technician Deleted!"; 
        header('location: ../views/config/technician_table.php');
    } 