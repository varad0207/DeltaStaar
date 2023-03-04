<?php
require 'includes/common.php';
if (isset($_SESSION["emp_id"])) {
    session_unset();
    session_destroy();
    header("location:../index.php");
}
date_default_timezone_set('Asia/Calcutta');
if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $emp_code = $_POST['user'];
    $password = md5($_POST['pass']);

    $check = mysqli_query($conn, "select e.emp_id,concat(e.fname,' ',e.lname) as user from employee e join login_credentials c using(emp_id) where e.emp_code = '$emp_code' and e.role is not null") or die(mysqli_error($conn));

    if (mysqli_num_rows($check) == 0) {
        echo '<script>alert("User not found, Please try again");window.location = history.back();</script>';
    } else {
        $check = mysqli_query($conn, "select e.emp_id,concat(e.fname,' ',e.lname) as user from employee e join login_credentials c using(emp_id) where e.emp_code = '$emp_code' && c.pass='$password'") or die(mysqli_error($conn));
        if (mysqli_num_rows($check) == 0) {
            die('<script>alert("Incorrect Password, Please try again");window.location = history.back();</script>');
            // echo '<script>alert("Incorrect Password, Please try again");//window.location = history.back();</script>';   
        }
        session_start();
        $row = mysqli_fetch_array($check);
        $emp_id = $row['emp_id'];
        $user=$row['user'];

        $insert = "insert into login_history(emp_id,user) values ('{$row['emp_id']}','{$row['user']}')";
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));

        $last_insert_id = mysqli_insert_id($conn);
        if (!isset($_SESSION['emp_id'])) {
            $superadmin = 0;
            $submit = mysqli_query($conn, "select rights.* from employee join roles on employee.role=roles.role_id join rights on roles.rights=rights.id where emp_id='$emp_id'") or die(mysqli_error($conn));
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
            ) $superadmin = 1;
            $rights = array('rights_accomodation'=>$rights_table['accomodation'],
                            'rights_complaints'=>$rights_table['complaints'],
                            'rights_employee_details'=>$rights_table['employee_details'],
                            'rights_employee_outing'=> $rights_table['employee_outing'],
                            'rights_roles'=>$rights_table['roles'],
                            'rights_rooms'=>$rights_table['rooms'],
                            'rights_tankers'=>$rights_table['tankers'],
                            'rights_jobs'=>$rights_table['jobs'],
                            'rights_vaccination'=>$rights_table['vaccination'],
                            'rights_vaccination_category'=>$rights_table['vaccination_category'],
                            'rights_visitor_log'=>$rights_table['visitor_log']);
            $_SESSION['rights'] = serialize($rights);
            $_SESSION['is_superadmin'] = $superadmin;
            $_SESSION['emp_id'] = $emp_id;
            $_SESSION['emp_code'] = $emp_code;
            $_SESSION['user']=$user;
            $_SESSION['login_history_id'] = $last_insert_id;
            // if (!isset($_COOKIE['new_user'])) {
            //     setcookie('new_user', 'true', time() + (86400 * 30), '/'); // set the cookie to expire in 30 days
            // }
            header("location:../views/dashboard.php");
        }
    }
}
?>