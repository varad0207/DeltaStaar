<?php
require 'includes/common.php';
// $dt = new DateTime($_SESSION['login_time']);
// echo $dt->format('Y-m-d H:i:s');
// Remove the active session from the active_sessions table
// $removeSessionQuery = mysqli_query($conn, "DELETE FROM active_sessions WHERE emp_id = '{$_SESSION['emp_id']}'") or die(mysqli_error($conn));

$update = "update login_history set logout_time=current_timestamp where id='{$_SESSION['login_history_id']}'";
$submit = mysqli_query($conn, $update) or die(mysqli_error($conn));
    if(isset($_SESSION["emp_id"]))
    {
        session_unset();
        session_destroy();
    }
header("location: ..");
?>