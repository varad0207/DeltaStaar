<?php
    include('includes/common.php');

if (isset($_POST['submit'])) {
    $role_id = $_POST['role_id'];

    $emp_id = $_POST['emp_code'];
    mysqli_query($conn, "UPDATE employee SET role='$role_id' where emp_id='$emp_id'");

    $_SESSION['message'] = "Role Assigned";
// give login credentials
// default credentials -> password="password"

mysqli_query($conn, "insert into login_credentials(emp_id) values('$emp_id')");



    header('location: ../views/hrm/roles_assigned_table.php');
}

// if (isset($_GET['del'])) {
//     $role_id = $_GET['del'];
//     mysqli_query($conn, "DELETE FROM roles WHERE role_id=$role_id");
//     $_SESSION['message'] = "Role Deleted!";
//     header('location: ../views/hrm/roles_table.php');
// }