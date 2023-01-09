<?php  include('includes/common.php'); ?>
<?php 
	
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
	// initialize variables
	$emp_id = "";
	$acc_id = "";
	$update = false;

	if (isset($_POST['submit'])) {
		$emp_id = $_POST['Id'];
		$acc_id = $_POST['acId'];
        mysqli_query($conn, "INSERT INTO security (emp_id,acc_id) VALUES ('$emp_id', '$acc_id')"); 
		$_SESSION['message'] = "employee details saved"; 
		header('location: ../views/config/security_table.php');
	}

    if (isset($_POST['update'])) {
        $emp_id = $_POST['Id'];
		$acc_id = $_POST['acId'];
        mysqli_query($conn, "UPDATE security SET emp_id='$emp_id', acc_id='$acc_id'");
        $_SESSION['message'] = "employee Info updated!"; 
        header('location: ../views/config/security_table.php');
    }

    if (isset($_GET['del'])) {
        $id = $_GET['del'];
        
        mysqli_query($conn, "DELETE FROM security WHERE id=$id");
        $_SESSION['message'] = "security deleted!"; 
        header('location: ../views/config/security_table.php');
    }
?>