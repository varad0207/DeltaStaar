<?php
include('includes/common.php');

// if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
//     include('includes/common.php');

// }else{
//     include('includes/common.php');
// }

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
// if(!isset($_SESSION))
// {
//     session_start();
//     $emp_code = $start_date = $arrival_date = $purpose = "";

// }
$start_date='';
$arrival_date='NULL';

if (isset($_POST['submit'])) {
    $emp_code = $_POST['emp_code'];
    $start_date = $_POST['start_date'];
    $arrival_date = $_POST['arrival_date'];
    $purpose = $_POST['purpose'];
    // $emp_id = mysqli_query($conn, "SELECT emp_id FROM employee WHERE emp_code = '{$emp_code}'");
    // $emp_code_query = mysqli_query($conn, "SELECT emp_id FROM employee WHERE emp_code = '{$emp_code}'");
    // $emp_code_result = mysqli_fetch_assoc($emp_code_query);
    // $emp_id = $emp_code_result['emp_id'];
    // mysqli_query($conn, "INSERT INTO employee_outing(emp_id, outing_date, arrival_date, category) VALUES('$emp_id', '$start_date', '$arrival_date', '$purpose')");
    $query = "INSERT INTO employee_outing (emp_code, outing_date, arrival_date, category) VALUES ('$emp_code', '$start_date', NULLIF('$arrival_date',''), '$purpose')";

    $result = mysqli_query($conn, $query);
    // $last_insert_id = mysqli_insert_id($conn);

    if (!$result) {
        die("Query failed: " . mysqli_error($conn));
    } else {
        $_SESSION['message'] = "Employee Outing Info Added!";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_employee_outing(user,type,emp_code, outing_date, arrival_date, category) values ('{$_SESSION['user']}','Insert','$emp_code', '$start_date', NULLIF('$arrival_date',''), '$purpose')");

        header("location: ../views/security/employee_outing_table.php");
    }

}

if (isset($_POST['update'])) {
    $emp_code = $_POST['emp_code'];
    $start_date = $_POST['start_date'];
    if(isset($_POST['arrival_date']))$arrival_date = $_POST['arrival_date'];
    $purpose = $_POST['purpose'];
    // $emp_id = mysqli_query($conn, "SELECT emp_id FROM employee WHERE emp_code = '{$emp_code}'");

    //change tracking code
    if($AllowTrackingChanges){
        $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_outing WHERE emp_code = '$emp_code'"));
        mysqli_query($conn,"insert into change_tracking_employee_outing(user,type,emp_code, outing_date, arrival_date, category)
        values ('{$_SESSION['user']}','Update','{$row_affected['emp_code']}', '{$row_affected['outing_date']}',NULLIF('{$row_affected['arrival_date']}',''),'{$row_affected['category']}')");
    }

    mysqli_query($conn, "UPDATE employee_outing SET outing_date = '$start_date', arrival_date = NULLIF('$arrival_date',''), category = '$purpose' WHERE emp_code = '$emp_code'");

    $_SESSION['message'] = "Employee Outing Info Updated!";
    header("location: ../views/security/employee_outing_table.php");
}

if (isset($_GET['del'])) {
    $emp_code = $_GET['del'];

     //change tracking code
     if($AllowTrackingChanges){
        $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee_outing WHERE emp_code = $emp_code"));
        mysqli_query($conn,"insert into change_tracking_employee_outing(user,type,emp_code, outing_date, arrival_date, category)
        values ('{$_SESSION['user']}','Delete','{$row_affected['emp_code']}', '{$row_affected['outing_date']}',NULLIF('{$row_affected['arrival_date']}',''),'{$row_affected['category']}')");
    }

    mysqli_query($conn, "DELETE FROM employee_outing WHERE emp_code = $emp_code");
    $_SESSION['message'] = "Employee Outing Info Deleted!";
    header("location: ../views/security/employee_outing_table.php");
}
?>