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
    $designation = $id = "";

    if(isset($_POST['submit']))
    {
        $designation = $_POST['designation'];

        $insert = "INSERT INTO employee_designation (designation) VALUES ('$designation')";

        echo mysqli_error($conn);
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
        $last_insert_id = mysqli_insert_id($conn);

        $_SESSION['message'] = "Employee Designation Info Added!";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_employee_designation(user,type,desig_id, designation) values ('{$_SESSION['user']}','Insert','$last_insert_id','$designation')");

        header("location: ../views/config/emp_desig_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['id'];
        $designation = $_POST['designation'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_designation WHERE id = $id"));
            mysqli_query($conn,"insert into change_tracking_employee_designation(user,type,desig_id, designation)
            values ('{$_SESSION['user']}','Update','{$row_affected['id']}', '{$row_affected['designation']}')");
        }

        mysqli_query($conn, "UPDATE employee_designation SET designation = '$designation' WHERE id = $id");
        $_SESSION['message'] = "Employee Designation Info Updated!";
        header("location: ../views/config/emp_desig_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_designation WHERE id = $id"));
            mysqli_query($conn,"insert into change_tracking_employee_designation(user,type,desig_id, designation)
            values ('{$_SESSION['user']}','Delete','{$row_affected['id']}', '{$row_affected['designation']}')");
        }

        mysqli_query($conn, "DELETE FROM employee_designation WHERE id = $id");
        $_SESSION['message'] = "Employee Designationr Info Deleted!";
        header("location: ../views/config/emp_desig_table.php");
    }
?>