<?php

    require 'includes/common.php';

$complaint_id = "";
$technician_id = "";
$warden_emp_code = "";
$raise_timestamp = "";
$description = "";
$status = "";
$tentative_date = "";
$completion_date = "";
$remarks = "";

if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $complaint_id = $_POST['complaint_id'];
    $technician_id = mysqli_real_escape_string($conn, $_POST['technician_id']);
    $warden_emp_code = mysqli_real_escape_string($conn, $_POST['warden_emp_code']);
    $raise_timestamp = date('Y-m-d', time());
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $tentative_date = date('Y-m-d', strtotime($_POST['tentative_date']));
    $completion_date = date('Y-m-d', strtotime($_POST['completion_date']));
    $remarks = mysqli_real_escape_string($conn, $_POST['remarks']);
    echo "<script>console.log('$technician_id')</script>";
    $insert = "insert into jobs(complaint_id, technician_id, warden_emp_code, raise_timestamp, description, tentative_date ,completion_date, remarks) values ('$complaint_id','$technician_id', '$warden_emp_code', '$raise_timestamp', '$description', '$tentative_date', '$completion_date', '$remarks')";
    echo mysqli_error($conn);
    $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
    $last_insert_id = mysqli_insert_id($conn);
    $_SESSION['message'] = "Job Raised!";

         //change tracking code
         if($AllowTrackingChanges)
         mysqli_query($conn,"insert into change_tracking_jobs(user,type,jobs_id,complaint_id, technician_id, warden_emp_code, raise_timestamp, description, completion_date, remarks) values ('{$_SESSION['user']}','Insert','$last_insert_id','$complaint_id','$technician_id', '$warden_emp_code', '$raise_timestamp', '$description', '$completion_date', '$remarks')");
 
        header("location: ../views/complaint/jobs_table.php");
    
}

if (isset($_POST['update'])) {
    $id = $_POST['update'];
    $raise_timestamp = $_POST['raise_timestamp'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $status = $_POST['status'];
    $tech_closure_timestamp = $_POST['tech_closure_timestamp'];
    $sec_closure_timestamp = $_POST['sec_closure_timestamp'];
    $warden_closure_timestamp = $_POST['warden_closure_timestamp'];
    $remarks = $_POST['remarks'];
    $emp_code = $_POST['emp_code'];

    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM jobs WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_jobs (user,type,job_id,complaint_id, technician_id, warden_emp_code, raise_timestamp, description, completion_date, remarks) 
            values ('{$_SESSION['user']}','Update','{$row_affected['id']}', '{$row_affected['complaint_id']}','{$row_affected['technician_id']}','{$row_affected['warden_emp_code']}','{$row_affected['raise_timestamp']}','{$row_affected['description']}','{$row_affected['completion_date']}','{$row_affected['remarks']}')");
    }

    mysqli_query($conn, "UPDATE jobs SET emp_code='$emp_code', category='$category',description='$description' WHERE id='$id'");
    $_SESSION['message'] = "Complaint Info Updated!";
    header('location: ../views/complaint/jobs_table.php');
}

if (isset($_GET['del'])) {
    $id = $_GET['del'];

    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM jobs WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_jobs (user,type,job_id,complaint_id, technician_id, warden_emp_code, raise_timestamp, description, completion_date, remarks) 
            values ('{$_SESSION['user']}','Delete','{$row_affected['id']}', '{$row_affected['complaint_id']}','{$row_affected['technician_id']}','{$row_affected['warden_emp_code']}','{$row_affected['raise_timestamp']}','{$row_affected['description']}','{$row_affected['completion_date']}','{$row_affected['remarks']}')");
    }

    mysqli_query($conn, "DELETE FROM jobs WHERE id = '$id'");
    $_SESSION['message'] = "Job Deleted";
    header('location: ../views/complaint/jobs_table.php');
}
?>