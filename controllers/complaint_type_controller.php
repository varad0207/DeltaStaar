<?php

    include('includes/common.php');

   
    $type = $description = "";

    if(isset($_POST['submit']))
    {
        $type = $_POST['type'];
        $description = $_POST['description'];

        mysqli_query($conn, "INSERT INTO complaint_type (complaint_type, type_description) VALUES ('$type', '$description')");
        $last_insert_id = mysqli_insert_id($conn);
        $_SESSION['message'] = "Complaint Type Info Added!";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_complaint_type(user,type,type_id,complaint_type,type_description) values ('{$_SESSION['user']}','Insert','$last_insert_id','$type','$description')");

        header("location: ../views/config/complaint_type_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['id'];
        $type = $_POST['type'];
        $description = $_POST['description'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM complaint_type WHERE type_id=$id"));
            mysqli_query($conn,"insert into change_tracking_complaint_type(user,type,type_id,complaint_type,type_description)
            values ('{$_SESSION['user']}','Update','{$row_affected['type_id']}', '{$row_affected['complaint_type']}','{$row_affected['type_description']}')");
        }

        mysqli_query($conn, "UPDATE complaint_type SET complaint_type = '$type', type_description = '$description' WHERE type_id = $id");
        $_SESSION['message'] = "Complaint Type Info Updated!";
        header("location: ../views/config/complaint_type_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];
        
        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM complaint_type WHERE type_id=$id"));
            mysqli_query($conn,"insert into change_tracking_complaint_type(user,type,type_id,complaint_type,type_description)
            values ('{$_SESSION['user']}','Delete','{$row_affected['type_id']}', '{$row_affected['complaint_type']}','{$row_affected['type_description']}')");
        }

        mysqli_query($conn, "DELETE FROM complaint_type WHERE type_id = $id");
        $_SESSION['message'] = "Complaint Type Deleted!";
        header("location: ../views/config/complaint_type_table.php");
    }
?>