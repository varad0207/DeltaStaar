<?php if (isset($_POST['save'])|| isset($_POST['update'])||isset($_GET['del'])) {
    include('includes/common.php');
}else{
    include('includes/common.php');
}
?>
<?php
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
        mysqli_query($conn, "INSERT INTO visitor_log(security_emp_id,visitor_name,vehicle_no,type,check_in,check_out,purpose,phone_no) VALUES ('$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");
        $_SESSION['message'] = "vaccination details saved";
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
        $visitor_name=$name;
        $vehicle_no=$_POST['vehicle_no'];
        $type='Employee';
        $check_in=date('Y-m-d H:i:s');
        $purpose=$_POST['purpose'];

        $temp=mysqli_query($conn, "SELECT contact FROM employee where emp_id='$emp_id'");
        $row = $temp->fetch_assoc();
        $phone_no=$row['contact'];
        mysqli_query($conn, "INSERT INTO visitor_log(emp_id,security_emp_id,visitor_name,vehicle_no,type,check_in,check_out,purpose,phone_no) VALUES ('$emp_id','$security_emp_id','$visitor_name','$vehicle_no','$type','$check_in','','$purpose','$phone_no')");
        $_SESSION['message'] = "visitor details saved";
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
        mysqli_query($conn, "DELETE FROM visitor_log WHERE id = $id");
        $_SESSION['message'] = "visitor details deleted";
        header('location: ../views/security/visitor_log_table.php');
    }
?>