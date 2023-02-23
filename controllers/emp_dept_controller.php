<?php 
if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
    include('includes/common.php');
}else{
    include('includes/common.php');
}
?>
<?php 
	
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 

	$id = $dept = "";


	if (isset($_POST['submit'])) 
    {
	    $dept =  $_POST['dept'];
    
		mysqli_query($conn, "INSERT INTO employee_dept(dept_name) values ('$dept')"); 
        $last_insert_id = mysqli_insert_id($conn);

		$_SESSION['message'] = "Employee Department details saved"; 

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_employee_dept(user,type,dept_id, dept_name) values ('{$_SESSION['user']}','Insert','$last_insert_id','$dept')");

		header('location: ../views/config/emp_dept_table.php');
	}

    if (isset($_POST['update'])) 
    {
        $id = $_POST['id'];
        $dept =  $_POST['dept'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_dept WHERE dept_id = $id"));
            mysqli_query($conn,"insert into change_tracking_employee_dept(user,type,dept_id, dept_name)
            values ('{$_SESSION['user']}','Update','{$row_affected['dept_id']}', '{$row_affected['dept_name']}')");
        }
        
        mysqli_query($conn, "UPDATE employee_dept SET dept_name = '$dept' WHERE dept_id = $id");
        $_SESSION['message'] = "Employee Department Info updated!"; 
        header('location: ../views/config/emp_dept_table.php');
    }

    if (isset($_GET['del'])) {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_dept WHERE dept_id = $id"));
            mysqli_query($conn,"insert into change_tracking_employee_dept(user,type,dept_id, dept_name)
            values ('{$_SESSION['user']}','Delete','{$row_affected['dept_id']}', '{$row_affected['dept_name']}')");
        }

        mysqli_query($conn, "DELETE FROM employee_dept WHERE dept_id=$id");
        $_SESSION['message'] = "Employee Department deleted!"; 
        header('location: ../views/config/emp_dept_table.php');
    }
?>