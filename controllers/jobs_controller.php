<?php
if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
    include('../controllers/includes/common.php');
}else{
    include('../../controllers/includes/common.php');
}
?>
<?php

    if (!isset($_SESSION)) {
        session_start();
    }

        $complaint_id = "";
        $technician_id = "";
        $warden_emp_code = "";
        $raise_timestamp = "";
        $description = "";
        $status = "";
        $completion_date = "";
        $remarks = "";

    if (isset($_POST['submit']) && !empty($_POST['submit'])) {
        $complaint_id = $_POST['complaint_id'];
        $technician_id = mysqli_real_escape_string($conn, $_POST['technician_id']);
        $warden_emp_code = mysqli_real_escape_string($conn, $_POST['warden_emp_code']);
        $raise_timestamp= date('Y-m-d',time());
        $description = mysqli_real_escape_string($conn, $_POST['description']);
        $completion_date = date('Y-m-d',strtotime($_POST['completion_date']));
        $remarks = mysqli_real_escape_string($conn, $_POST['remarks']);
        echo "<script>console.log('$technician_id')</script>";
        $insert = "insert into jobs(complaint_id, technician_id, warden_emp_code, raise_timestamp, description, completion_date, remarks) values ('$complaint_id','$technician_id', '$warden_emp_code', '$raise_timestamp', '$description', '$completion_date', '$remarks')";
        echo mysqli_error($conn);
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
        $_SESSION['message'] = "Job Raised!";
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

        mysqli_query($conn, "UPDATE jobs SET emp_code='$emp_code', category='$category',description='$description' WHERE id='$id'");
        $_SESSION['message'] = "Complaint Info Updated!";
        header('location: ../views/complaint/jobs_table.php');
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];
        mysqli_query($conn, "DELETE FROM jobs WHERE id = '$id'");
        $_SESSION['message'] = "Job Deleted";
        header('location: ../views/complaint/jobs_table.php');
    }
?>
