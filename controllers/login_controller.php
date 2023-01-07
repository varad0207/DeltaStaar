<?php
require 'includes/common.php';
if (isset($_SESSION["emp_id"])) {
    session_unset();
    session_destroy();
}
date_default_timezone_set('Asia/Calcutta');
if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $emp_code = $_POST['user'];
    $password = $_POST['pass'];
    $safe_pass = md5($password);
    $fetch = "select e.emp_id from employee e join login_credentials c on e.emp_id=c.emp_id where e.emp_code = '$emp_code' and e.role is not null";

    $check = mysqli_query($conn, $fetch) or die(mysqli_error($conn));

    if (mysqli_num_rows($check) == 0) {
        echo '<script>alert("User not found, Please try again");window.location = history.back();</script>';
    } else {

        $fetch1 = "select e.emp_id from employee e join login_credentials c on e.emp_id=c.emp_id where e.emp_code = '$emp_code' && c.pass='$safe_pass'";
        $check1 = mysqli_query($conn, $fetch1) or die(mysqli_error($conn));
        if (mysqli_num_rows($check1) == 0) {
            die('<script>alert("Incorrect Password, Please try again");window.location = history.back();</script>');
            // echo '<script>alert("Incorrect Password, Please try again");//window.location = history.back();</script>';   
        }
        session_start();
        $row = mysqli_fetch_array($check1);
        $emp_id = $row['emp_id'];

        $insert = "insert into login_history(emp_id) values ('{$row['emp_id']}')";
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));

        $last_insert_id = mysqli_insert_id($conn);
        if (!isset($_SESSION['emp_id'])) {
            $superadmin = 0;
            $sql = "select rights.* from employee join roles on employee.role=roles.role_id join rights on roles.rights=rights.id where emp_id='$emp_id'"; //fix this query
            $submit = mysqli_query($conn, $sql) or die(mysqli_error($conn));
            $rights_table = mysqli_fetch_array($submit);
            if (
                $rights_table['accomodation'] == 7 &&
                $rights_table['complaints'] == 7 &&
                $rights_table['employee_details'] == 7 &&
                $rights_table['employee_outing'] == 7 &&
                $rights_table['roles'] == 7 &&
                $rights_table['rooms'] == 7 &&
                $rights_table['tankers'] == 7 &&
                $rights_table['jobs'] == 7 &&
                $rights_table['vaccination'] == 7 &&
                $rights_table['vaccination_category'] == 7 &&
                $rights_table['visitor_log'] == 7
            ) {
                $superadmin = 1;
            }
            $_SESSION['rights_accomodation'] = $rights_table['accomodation'];
            $_SESSION['rights_complaints'] = $rights_table['complaints'];
            $_SESSION['rights_employee_details'] = $rights_table['employee_details'];
            $_SESSION['rights_employee_outing'] = $rights_table['employee_outing'];
            $_SESSION['rights_roles'] = $rights_table['roles'];
            $_SESSION['rights_rooms'] = $rights_table['rooms'];
            $_SESSION['rights_tankers'] = $rights_table['tankers'];
            $_SESSION['rights_jobs'] = $rights_table['jobs'];
            $_SESSION['rights_vaccination'] = $rights_table['vaccination'];
            $_SESSION['rights_vaccination_category'] = $rights_table['vaccination_category'];
            $_SESSION['rights_visitor_log'] = $rights_table['visitor_log'];
            $_SESSION['is_superadmin'] = $superadmin;
            $_SESSION['emp_id'] = $emp_id;
            $_SESSION['emp_code'] = $emp_code;
            $_SESSION['login_history_id'] = $last_insert_id;
            if ($_SESSION['is_superadmin'] == 1)
                header("location:../views/dashboard.php");
            else
                header("location:../views/employee_dashboard.php");
        }
    }
}
?>