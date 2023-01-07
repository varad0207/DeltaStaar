<?php
    include('includes/common.php');

// if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
//     include('includes/common.php');

// }else{
//     include('includes/common.php');
// }
?>
<?php
    if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
    // if(!isset($_SESSION))
    // {
    //     session_start();
    //     $emp_code = $start_date = $arrival_date = $purpose = "";

    // }

    if(isset($_POST['submit']))
    {
        $emp_code = $_POST['emp_code'];
        $start_date = $_POST['start_date'];
        $arrival_date = $_POST['arrival_date'];
        $purpose = $_POST['purpose'];
        $emp_id = mysqli_query($conn, "SELECT emp_id FROM employee WHERE emp_code = '{$emp_code}'");
        mysqli_query($conn, "INSERT INTO employee_outing(emp_id, outing_date, arrival_date, category) VALUES('$emp_id', '$start_date', '$arrival_date', '$purpose')");

        $_SESSION['message'] = "Employee Outing Info Added!";
        header("location: ../views/employee_outing_table.php");
    }

    if(isset($_POST['update']))
    {
        $emp_code = $_POST['emp_code'];
        $start_date = $_POST['start_date'];
        $arrival_date = $_POST['arrival_date'];
        $purpose = $_POST['purpose'];
        $emp_id = mysqli_query($conn, "SELECT emp_id FROM employee WHERE emp_code = '{$emp_code}'");
        mysqli_query($conn, "UPDATE employee_outing SET outing_date = '$start_date', arrival_date = '$arrival_date', category = '$purpose' WHERE emp_id = '$emp_id'");

        $_SESSION['message'] = "Employee Outing Info Updated!";
        header("location: ../views/employee_outing_table.php");
    }

    if(isset($_GET['del']))
    {
        $emp_id = $_GET['del'];
        mysqli_query($conn, "DELETE FROM employee_outing WHERE emp_id = $emp_id");
        $_SESSION['message'] = "Employee Outing Info Deleted!";
        header("location: ../views/employee_outing_table.php");
    }
?>