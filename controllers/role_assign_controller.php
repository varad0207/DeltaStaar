<?php
    include('includes/common.php');

if (isset($_POST['submit'])) {
    $role_id = $_POST['role_id'];

    $emp_id = $_POST['emp_code'];
    $parts = explode(" - ", $emp_id); // Split the string by " - "
    $emp_code = end($parts); 
    mysqli_query($conn, "UPDATE employee SET role='$role_id' where emp_code='$emp_code'");
    $emp_row=mysqli_fetch_array(mysqli_query($conn,"select emp_id from employee where emp_code='$emp_code'"));

    $_SESSION['message'] = "Role Assigned";
// give login credentials
// default credentials -> password="password"

mysqli_query($conn, "insert into login_credentials(emp_id) values('{$emp_row['emp_id']}')");



    header('location: ../views/hrm/roles_assigned_table.php');
}

// if (isset($_GET['del'])) {
//     $role_id = $_GET['del'];
//     mysqli_query($conn, "DELETE FROM roles WHERE role_id=$role_id");
//     $_SESSION['message'] = "Role Deleted!";
//     header('location: ../views/hrm/roles_table.php');
// }