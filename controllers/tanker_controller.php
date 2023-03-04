<?php

    include('includes/common.php');

    
        $acc_id = $emp_sec_id = $ven_id = $quality = $qty = $bill_no = $timestamp = "";
    

    if(isset($_POST['submit']))
    {
        $acc_id = $_POST['acc'];
        $emp_sec_id = $_POST['sec'];
        $ven_id = $_POST['ven'];
        $quality = $_POST['quality'];
        $qty = $_POST['qty'];
        $bill_no = $_POST['billno'];
        $timestamp = date('Y-m-d H:i:s');

        mysqli_query($conn, "INSERT INTO tankers (id, acc_id, security_emp_id, quality_check, qty, bill_no, vendor_id, timestamp) VALUES ('', '$acc_id', '$emp_sec_id', '$quality', '$qty', '$bill_no', '$ven_id', '$timestamp')");
        $last_insert_id = mysqli_insert_id($conn);

        $_SESSION['message'] = "Tanker Info Added!";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_tankers (user,type,acc_id, tanker_id, security_emp_id, quality_check, qty, bill_no,vendor_id,tanker_timestamp) values ('{$_SESSION['user']}','Insert','$acc_id','$last_insert_id', '$emp_sec_id', '$quality', '$qty', '$bill_no', '$ven_id', '$timestamp')");


        header("location: ../views/security/tanker_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['id'];
        $acc_id = $_POST['acc'];
        $emp_sec_id = $_POST['sec'];
        $ven_id = $_POST['ven'];
        $quality = $_POST['quality'];
        $qty = $_POST['qty'];
        $bill_no = $_POST['billno'];
        $timestamp = date('Y-m-d H:i:s');

         //change tracking code
         if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM tankers WHERE id=$id"));
            mysqli_query($conn,"insert into change_tracking_tankers (user,type,acc_id, tanker_id, security_emp_id, quality_check, qty, bill_no,vendor_id,tanker_timestamp) 
                values ('{$_SESSION['user']}','Update','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['security_emp_id']}', '{$row_affected['quality_check']}', '{$row_affected['qty']}', '{$row_affected['bill_no']}', '{$row_affected['vendor_id']}', '{$row_affected['tanker_timestamp']}')");
        }

        mysqli_query($conn, "UPDATE tankers SET acc_id = '$acc_id', security_emp_id = '$emp_sec_id', quality_check = '$quality', qty = '$qty', bill_no = '$bill_no', vendor_id = '$ven_id', timestamp = '$timestamp' WHERE id = '$id'");

        $_SESSION['message'] = "Tanker Info Updated!";
        header("location: ../views/security/tanker_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM tankers WHERE id=$id"));
            mysqli_query($conn,"insert into change_tracking_tankers (user,type,acc_id, tanker_id, security_emp_id, quality_check, qty, bill_no,vendor_id,tanker_timestamp) 
                values ('{$_SESSION['user']}','Delete','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['security_emp_id']}', '{$row_affected['quality_check']}', '{$row_affected['qty']}', '{$row_affected['bill_no']}', '{$row_affected['vendor_id']}', '{$row_affected['tanker_timestamp']}')");
        }

        mysqli_query($conn, "DELETE FROM tankers WHERE id=$id");

        $_SESSION['message'] = "Tanker Info Deleted!";
        header("location: ../views/security/tanker_table.php");
    }
?>