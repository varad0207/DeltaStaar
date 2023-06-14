<?php

require 'includes/common.php';

$raise_timestamp = "";
$category = "";
$description = "";
$status = "";
$tech_pending_timestamp = "";
$tech_closure_timestamp = "";
$sec_closure_timestamp = "";
$warden_closure_timestamp = "";
$remarks = "";



if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $emp_code = mysqli_real_escape_string($conn, $_POST['emp_code']);
    $empcode_array = explode(" - ", $emp_code);
    $emp_code = preg_replace("/[^a-zA-Z0-9]+/", "", $empcode_array[1]);
    // $row_emp = mysqli_fetch_array(mysqli_query($conn, "select acc_id FROM employee join rooms on employee.room_id=rooms.id join accomodation using(acc_id) WHERE emp_code='$emp_code'"));
    $category = mysqli_real_escape_string($conn, $_POST['category']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $acc_code=mysqli_real_escape_string($conn, $_POST['acc']);
    $acccode_array = explode(" - ", $acc_code);
    $acc_code = preg_replace("/[^a-zA-Z0-9]+/", "", $acccode_array[1]);
    echo $acc_code;
    $acc_id=mysqli_fetch_array(mysqli_query($conn, "select acc_id FROM accomodation WHERE acc_code='$acc_code'"));
    $insert = "insert into complaints(emp_code, type, description,acc_id,acc_code) values ('$emp_code','$category','$description','{$acc_id['acc_id']}','$acc_code')";
    echo mysqli_error($conn);
    $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
    $last_insert_id = mysqli_insert_id($conn);
    $_SESSION['message'] = "Complaint Info Added!";

    //change tracking code
    if ($AllowTrackingChanges && isset($_SESSION['emp_id'])){
       mysqli_query($conn, "insert into change_tracking_complaints(user,type,emp_code,complaint_id,complaint_type, description,acc_id,acc_code) values ('{$_SESSION['user']}','Insert','$emp_code','$last_insert_id','$category','$description',NULLIF('{$row_emp['acc_id']}',''),'$acc_code')");
    }
    if(isset($_SESSION['emp_id']) ){
        $rights = unserialize($_SESSION['rights']);
        if ($rights['rights_complaints'] > 0)header("location: ../views/complaint/complaint_table.php");
    }
    else 
    header("location: ../index.php");
}

if (isset($_POST['update'])) {
    $id = $_POST['update'];
    $raise_timestamp = $_POST['raise_timestamp'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $status = $_POST['status'];
    $tech_pending_timestamp = $_POST['tech_pending_timestamp'];
    $tech_closure_timestamp = $_POST['tech_closure_timestamp'];
    $sec_closure_timestamp = $_POST['sec_closure_timestamp'];
    $warden_closure_timestamp = $_POST['warden_closure_timestamp'];
    $remarks = $_POST['remarks'];
    $emp_code = $_POST['emp_code'];
    $acc_code=mysqli_real_escape_string($conn, $_POST['acc_code']);


    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM complaints WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_complaints (user,type,complaint_id,complaint_type, description,emp_code,acc_code) 
            values ('{$_SESSION['user']}','Update','{$row_affected['id']}', '{$row_affected['type']}','{$row_affected['description']}','{$row_affected['emp_code']}')");
    }

    mysqli_query($conn, "UPDATE complaints SET emp_code='$emp_code', type='$category',description='$description' ,acc_code='$acc_code' WHERE id='$id'");
    $_SESSION['message'] = "Complaint Info Updated!";
    header('location: ../views/complaint/complaint_table.php');
}

if (isset($_GET['del'])) {
    $id = $_GET['del'];

    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM complaints WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_complaints 
            (user,                  type,    complaint_id,           complaint_type,            description,                    emp_code,                      tech_pending_timestamp,                     tech_closure_timestamp,                     sec_closure_timestamp,                     warden_closure_timestamp,                     remarks , acc_code)values 
            ('{$_SESSION['user']}','Delete','{$row_affected['id']}','{$row_affected['type']}','{$row_affected['description']}','{$row_affected['emp_code']}','{$row_affected['tech_pending_timestamp']}','{$row_affected['tech_closure_timestamp']}','{$row_affected['sec_closure_timestamp']}','{$row_affected['warden_closure_timestamp']}','{$row_affected['remarks']}','$acc_code')");
    }

    mysqli_query($conn, "DELETE FROM complaints WHERE id = $id");
    mysqli_query($conn, "DELETE FROM jobs WHERE complaint_id = $id");
    $_SESSION['message'] = "Complaint Deleted";
    header('location: ../views/complaint/complaint_table.php');
}

if (isset($_GET['tech_pending'])) {

    mysqli_query($conn, "UPDATE complaints SET tech_pending_timestamp=now() WHERE id={$_GET['tech_pending']}");
    $_SESSION['message'] = "Complaint Info Updated!";
    header('location: ../views/complaint/tech_jobs.php');
}

if (isset($_GET['tech'])) {
    $id = $_GET['tech'];
    mysqli_query($conn, "UPDATE complaints SET tech_closure_timestamp=now() WHERE id=$id");
    $_SESSION['message'] = "Complaint Info Updated!";
    if($_SESSION['is_superadmin'])header('location: ../views/complaint/jobs_table.php');
    else header('location: ../views/complaint/tech_jobs.php');
}

if (isset($_GET['sec'])) {
    $id = $_GET['sec'];
    mysqli_query($conn, "UPDATE complaints SET sec_closure_timestamp=now() WHERE id=$id");
    $_SESSION['message'] = "Complaint Info Updated!";
    if($_SESSION['is_superadmin'])header('location: ../views/complaint/jobs_table.php');
    else header('location: ../views/complaint/security_jobs.php');
}

if (isset($_GET['warden'])) {
    $id = $_GET['warden'];
    mysqli_query($conn, "UPDATE complaints SET warden_closure_timestamp=now() WHERE id=$id");
    $_SESSION['message'] = "Complaint Info Updated!";
    header('location: ../views/complaint/jobs_table.php');
}
