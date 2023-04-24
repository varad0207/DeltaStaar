<?php 
    include('includes/common.php');

    $vemp;
    if (!isset($_SESSION)) {
        session_start();
    }
// initialize variables
    $id = "";
    $cat="";
    $emp_id="";
    $security_emp_id="";
    $visitor_name="";
    $vehicle_no="";
    $purpose="";
    $phone_no="";
    $emptype = "";
    $check_out = "";
    $update = false;

    if (isset($_POST['empcat'])) 
    {
        $cat=$_POST['cat_id'];
        $vinitial=false;
        if($cat=='emp')
        {  
            $vemp=true; 
            header('location: ../views/security/visitor_emp.php');
        }
        else
        {  
            $vemp=false; 
            header('location: ../views/security/visitor_non_emp.php');
        } 
    }

    if (isset($_POST['submitnonemp'])) 
    {
    
        echo "<script>alert('non emp')</script>";
        $security_emp_id=$_POST['security_emp_id'];
        $visitor_name=$_POST['visitor_name'];
        $vehicle_no=$_POST['vehicle_no'];
        $type='Non-Employee';
        $check_in=date('Y-m-d H:i:s');
        $purpose=$_POST['purpose'];
        $phone_no=$_POST['phone_no'];
        $row_acc=mysqli_fetch_array(mysqli_query($conn,"select acc_code from security join accomodation using(acc_id) where emp_id='$security_emp_id'"));
        mysqli_query($conn, "INSERT INTO visitor_log(acc_code,security_emp_id,visitor_name,vehicle_no,type,check_in,check_out,purpose,phone_no) VALUES ('{$row_acc['acc_code']}','$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");
        $last_insert_id = mysqli_insert_id($conn);
        $_SESSION['message'] = "visitor details saved";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_visitor_log(user,timestamp,type,log_id,security_emp_id,acc_code,visitor_name,vehicle_no,visit_type,check_in,check_out,purpose,phone_no) values ('{$_SESSION['user']}','Insert','$last_insert_id','{$row_acc['acc_code']}','$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");

        header('location: ../views/security/visitor_log_table.php');
    }
    if(isset($_POST['submitemp']))
    {   
        echo "<script>alert('emp')</script>";
        $emp_id=$_POST['emp_id'];
        $temp=mysqli_query($conn, "SELECT fname,mname,lname FROM employee where emp_id='$emp_id'");
        $row = $temp->fetch_assoc();
        $fname=$row["fname"];
        $mname=$row["mname"];
        $lname=$row["lname"];
        $name=$fname." ".$mname." ".$lname;
        $security_emp_id=$_POST['security_emp_id'];
        $row_acc=mysqli_fetch_array(mysqli_query($conn,"select acc_code from security join accomodation using(acc_id) where emp_id='$security_emp_id'"));
        $visitor_name=$name;
        $vehicle_no=$_POST['vehicle_no'];
        $type='Employee';
        $check_in=date('Y-m-d H:i:s');
        $purpose=$_POST['purpose'];

        $temp=mysqli_query($conn, "SELECT contact FROM employee where emp_id='$emp_id'");
        $row = $temp->fetch_assoc();
        $phone_no=$row['contact'];
        mysqli_query($conn, "INSERT INTO visitor_log(acc_code,emp_id,security_emp_id,visitor_name,vehicle_no,type,check_in,check_out,purpose,phone_no) VALUES ('{$row_acc['acc_code']}','$emp_id','$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");
        $last_insert_id = mysqli_insert_id($conn);
        $_SESSION['message'] = "visitor details saved";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_visitor_log(user,type,log_id,acc_code,emp_id,security_emp_id,visitor_name,vehicle_no,visit_type,check_in,check_out,purpose,phone_no) values ('{$_SESSION['user']}','Insert','$last_insert_id','{$row_acc['acc_code']}','$emp_id','$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");

        header('location: ../views/security/visitor_log_table.php');
    }

    if(isset($_GET['checkout']))
    {
        $check_out=date('Y-m-d H:i:s');
        $id = $_GET['id'];
        mysqli_query($conn, "UPDATE visitor_log SET check_out = '$check_out' WHERE id = '$id'");
        $_SESSION['message'] = "visitor details updated";
        header('location: ../views/security/visitor_log_table.php');
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM visitor_log WHERE id = '$id'"));
            mysqli_query($conn,"insert into change_tracking_visitor_log(user,type,log_id,acc_code,emp_id,security_emp_id,visitor_name,vehicle_no,visit_type,check_in,check_out,purpose,phone_no)
            values ('{$_SESSION['user']}','Delete','{$row_affected['id']}', '{$row_affected['acc_code']}','{$row_affected['emp_id']}','{$row_affected['security_emp_id']}','{$row_affected['visitor_name']}','{$row_affected['vehicle_no']}',
            '{$row_affected['type']}','{$row_affected['check_in']}','{$row_affected['check_out']}','{$row_affected['purpose']}','{$row_affected['phone_no']}')");
        }

        mysqli_query($conn, "DELETE FROM visitor_log WHERE id = '$id'");
        $_SESSION['message'] = "visitor details deleted";
        header('location: ../views/security/visitor_log_table.php');
    }
?>