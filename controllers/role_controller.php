<?php
if (isset($_POST['submit']) || isset($_POST['update']) || isset($_GET['del'])) {
    include('includes/common.php');
} else {
    include('includes/common.php');
}
?>
<?php

if (!isset($_SESSION)) {
    session_start();
}


// initialize variables
$role_name = "";
$role_id = "";
$rights = "";
$accomodation = "";
$employee_details = "";
$complaints = "";
$employee_outing = "";
$roles = "";
$rooms = "";
$tankers = "";
$jobs = "";
$vaccination = "";
$vaccination_category = "";
$visitor_log = "";

$update = false;

if (isset($_POST['submit'])) {
    $role_name = $_POST['role_name'];

    $role_id = $_POST['role_id'];
    $rights = $_POST['rights'];
    $accomodation = $_POST['rights_acc'];
    $employee_details = $_POST['rights_employee_details'];
    $complaints = $_POST['rights_complaints'];
    $employee_outing = $_POST['rights_employee_outing'];
    // $roles = $_POST[''];
    $rooms = $_POST['rights_room'];
    $tankers = $_POST['rights_tankers'];
    $jobs = $_POST['rights_jobs'];
    $vaccination = $_POST['rights_vaccination_details'];
    // $vaccination_category = $_POST[''];
    $visitor_log = $_POST['rights_visitors'];
    $acc_rights_sum=0;$comp_rights_sum=0;
    $emp_rights_sum=0;
    $emp_outing_rights_sum=0;
    $rooms_rights_sum=0;
    $tankers_rights_sum=0;
    $jobs_rights_sum=0;
    $vaccination_rights_sum=0;
    $visitors_rights_sum=0;


    foreach ($accomodation as $acc_rights) $acc_rights_sum += intval($acc_rights); 
    foreach ($employee_details as $emp_rights) $emp_rights_sum += intval($emp_rights); 
    foreach ($complaints as $comp_rights) $comp_rights_sum += intval($comp_rights); 
    foreach ($employee_outing as $emp_outing_rights) $emp_outing_rights_sum += intval($emp_outing_rights); 
    foreach ($rooms as $rooms_rights) $rooms_rights_sum += intval($rooms_rights); 
    foreach ($tankers as $tankers_rights) $tankers_rights_sum += intval($tankers_rights);
    foreach ($jobs as $jobs_rights) $jobs_rights_sum += intval($jobs_rights);
    foreach ($vaccination as $vaccination_rights) $vaccination_rights_sum += intval($vaccination_rights);
    foreach ($visitor_log as $visitors_rights) $visitors_rights_sum += intval($visitors_rights);
    // echo $emp_rights_sum;
    mysqli_query($conn,"INSERT INTO rights (accomodation, complaints,employee_details,employee_outing,rooms,tankers,jobs,vaccination,visitor_log) VALUES 
                                            ('$acc_rights_sum', '$comp_rights_sum','$emp_rights_sum','$emp_outing_rights_sum','$rooms_rights_sum','$tankers_rights_sum','$jobs_rights_sum','$vaccination_rights_sum','$visitors_rights_sum')");
    $last_insert_id = mysqli_insert_id($conn);

    mysqli_query($conn, "INSERT INTO roles (role_name, rights) VALUES ('$role_name', '$last_insert_id')");

    $_SESSION['message'] = "Role Saved";
    header('location: ../views/hrm/roles_table.php');
}

if (isset($_POST['update'])) {
    $role_name = $_POST['role_name'];

    $role_id = $_POST['role_id'];
    $rights = $_POST['rights'];
    // echo  $rights;
    $accomodation = $_POST['rights_acc'];
    $employee_details = $_POST['rights_employee_details'];
    $complaints = $_POST['rights_complaints'];
    $employee_outing = $_POST['rights_employee_outing'];
    // $roles = $_POST[''];
    $rooms = $_POST['rights_room'];
    $tankers = $_POST['rights_tankers'];
    $jobs = $_POST['rights_jobs'];
    $vaccination = $_POST['rights_vaccination_details'];
    // $vaccination_category = $_POST[''];
    $visitor_log = $_POST['rights_visitors'];
    $acc_rights_sum=0;$comp_rights_sum=0;
    $emp_rights_sum=0;
    $emp_outing_rights_sum=0;
    $rooms_rights_sum=0;
    $tankers_rights_sum=0;
    $jobs_rights_sum=0;
    $vaccination_rights_sum=0;
    $visitors_rights_sum=0;


    foreach ($accomodation as $acc_rights) $acc_rights_sum += intval($acc_rights); 
    foreach ($employee_details as $emp_rights) $emp_rights_sum += intval($emp_rights); 
    foreach ($complaints as $comp_rights) $comp_rights_sum += intval($comp_rights); 
    foreach ($employee_outing as $emp_outing_rights) $emp_outing_rights_sum += intval($emp_outing_rights); 
    foreach ($rooms as $rooms_rights) $rooms_rights_sum += intval($rooms_rights); 
    foreach ($tankers as $tankers_rights) $tankers_rights_sum += intval($tankers_rights);
    foreach ($jobs as $jobs_rights) $jobs_rights_sum += intval($jobs_rights);
    foreach ($vaccination as $vaccination_rights) $vaccination_rights_sum += intval($vaccination_rights);
    foreach ($visitor_log as $visitors_rights) $visitors_rights_sum += intval($visitors_rights);
    mysqli_query($conn, "UPDATE roles SET role_name='$role_name' where role_id='$role_id' and rights='$rights'");
    mysqli_query($conn, "UPDATE rights SET accomodation='$acc_rights_sum ' , complaints='$comp_rights_sum ' ,employee_details='$emp_rights_sum ' ,employee_outing='$emp_outing_rights_sum ',rooms='$rooms_rights_sum ' ,tankers='$tankers_rights_sum ' ,jobs='$jobs_rights_sum ' ,vaccination='$vaccination_rights_sum ',visitor_log='$visitors_rights_sum ' where id='$rights'");
    $_SESSION['message'] = "Role Info Updated!";
    header('location: ../views/hrm/roles_table.php');
}

if (isset($_GET['del'])) 
{
    $role_id = $_GET['del'];
    mysqli_query($conn, "DELETE FROM roles WHERE role_id=$role_id");
    $_SESSION['message'] = "Role Deleted!";
    header('location: ../views/hrm/roles_table.php');
}

if(isset($_GET['del_roleof_emp'])){
    $employee_id = $_GET['del_roleof_emp'];
    mysqli_query($conn, "UPDATE employee set role=null where emp_id=$employee_id");
    mysqli_query($conn, "DELETE from login_credentials where emp_id=$employee_id");
    header('location: ../views/hrm/roles_assigned_table.php');
}