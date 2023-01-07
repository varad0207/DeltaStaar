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

    if(isset($_POST['submit']) && !empty($_POST['submit']))
    {
        $designation = mysqli_real_escape_string($conn, $_POST['designation']);

        $insert = "insert into employee_designation (id, designation) values ('', '$designation')";

        echo mysqli_error($conn);
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
        $_SESSION['message'] = "Employee Designation Info Added!";
        header("location: ../views/config/emp_desig_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['update'];
        $designation = $_POST['designation'];

        mysqli_query($conn, "UPDATE employee_designation SET designation = '$designation' WHERE id = '$id'");
        $_SESSION['message'] = "Employee Designationr Info Updated!";
        header("location: ../views/config/emp_desig_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        mysqli_query($conn, "DELETE FROM employee_designation WHERE id = $id");
        $_SESSION['message'] = "Employee Designationr Info Deleted!";
        header("location: ../views/config/emp_desig_table.php");
    }
?>