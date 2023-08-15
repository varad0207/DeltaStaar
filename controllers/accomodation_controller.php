<?php
if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
    include('includes/common.php');
}else{
    include('includes/common.php');
}
?>

<?php 
    if(!isset($_SESSION)) 
    { 
        session_start(); 
        // initialize variables
        $acc_id = "";
        $acc_code = "";
        $acc_name = "";
        $bldg_status =  "";
        // $location = "";
        $gender = "";
        $tot_capacity = "";
        $no_of_rooms = "";
        $warden_emp_code = "";
        $occupied_rooms = "";
        $available_rooms = "";
        $owner = "";
        $remark = "";
        $room_cap = "";
    } 

    if (isset($_POST['submit']) && !empty($_POST['submit']))
    {
        $acc_code = mysqli_real_escape_string($conn, $_POST['code']);
        $acc_name = mysqli_real_escape_string($conn, $_POST['name']);
        $bldg_status = mysqli_real_escape_string($conn, $_POST['bldg']);
        // $location = mysqli_real_escape_string($conn, $_POST['loc']);
        $gender = mysqli_real_escape_string($conn, $_POST['gender']);
        $no_of_rooms = mysqli_real_escape_string($conn, $_POST['rooms']);
        $warden_emp_code = mysqli_real_escape_string($conn, $_POST['warden_emp_code']);
        $owner = mysqli_real_escape_string($conn, $_POST['owner']);
        $remark = mysqli_real_escape_string($conn, $_POST['remark']);

        $insert = "insert into accomodation (acc_code, acc_name, bldg_status, gender, no_of_rooms, warden_emp_code, owner, remark) values ('$acc_code', '$acc_name', '$bldg_status', '$gender', '$no_of_rooms', '$warden_emp_code', '$owner', '$remark')";

        echo mysqli_error($conn);
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
        $last_insert_id = mysqli_insert_id($conn);
        $_SESSION['message'] = "Accomodation Info Added!";

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"insert into change_tracking_accomodation (user,type,acc_id, acc_code, acc_name, bldg_status, gender, no_of_rooms, warden_emp_code, owner, remark) values ('{$_SESSION['user']}','Insert','$last_insert_id', '$acc_code', '$acc_name', '$bldg_status', '$gender', '$no_of_rooms', '$warden_emp_code', '$owner', '$remark')");

        header("location: ../views/accomodation/accomodation_table.php");
    }
	$update = false;

    if (isset($_POST['update'])) {
        
        $acc_code =  $_POST['code'];
        $acc_name = $_POST['name'];
        $bldg_status = $_POST['bldg'];
        // $location =  $_POST['loc'];
        $gender = $_POST['gender'];
        $no_of_rooms = $_POST['rooms'];
        $warden_emp_code = $_POST['warden_emp_code'];
        $owner = $_POST['owner'];
        $remark = $_POST['remark'];
    
        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM accomodation WHERE acc_code='$acc_code'"));
            mysqli_query($conn,"insert into change_tracking_accomodation (user,type,acc_id, acc_code, acc_name, bldg_status, gender, no_of_rooms, warden_emp_code, owner, remark) 
                values ('{$_SESSION['user']}','Update','{$row_affected['acc_id']}', '{$row_affected['acc_code']}', '{$row_affected['acc_name']}', '{$row_affected['bldg_status']}', '{$row_affected['gender']}', '{$row_affected['no_of_rooms']}', '{$row_affected['warden_emp_code']}', '{$row_affected['owner']}', '{$row_affected['remark']}')");
        }

        mysqli_query($conn, "UPDATE accomodation SET acc_name='$acc_name',bldg_status='$bldg_status',gender='$gender', no_of_rooms='$no_of_rooms', warden_emp_code='$warden_emp_code',owner='$owner',remark='$remark' WHERE acc_code='$acc_code'");
        $_SESSION['message'] = "Accomodation Info updated!";    
        header('location: ../views/accomodation/accomodation_table.php');
    }

    if (isset($_GET['del'])) {
        $acc_code = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM accomodation WHERE acc_code='$acc_code'"));
            mysqli_query($conn,"insert into change_tracking_accomodation (user,type,acc_id, acc_code, acc_name, bldg_status, gender, no_of_rooms, warden_emp_code, owner, remark) 
            values ('{$_SESSION['user']}','Delete','{$row_affected['acc_id']}', '{$row_affected['acc_code']}', '{$row_affected['acc_name']}', '{$row_affected['bldg_status']}', '{$row_affected['gender']}', '{$row_affected['no_of_rooms']}', '{$row_affected['warden_emp_code']}', '{$row_affected['owner']}', '{$row_affected['remark']}')");
            
            $rooms_affected=mysqli_query($conn,"SELECT * FROM rooms join accomodation using (acc_id) WHERE acc_code='$acc_code'");
            if(mysqli_num_rows($rooms_affected)>0){
                foreach($rooms_affected as $record){
                    mysqli_query($conn,"insert into change_tracking_rooms (user,type,acc_id, room_id, room_no, room_capacity, status, current_room_occupancy) 
                    values ('{$_SESSION['user']}','Delete','{$record['acc_id']}', '{$record['id']}', '{$record['room_no']}', '{$record['room_capacity']}', '{$record['status']}', NULLIF('{$record['current_room_occupancy']}',''))");
                    mysqli_query($conn, "DELETE FROM rooms WHERE acc_id='{$record['acc_id']}'");
                }
            }

            $tankers_affected=mysqli_query($conn,"SELECT * FROM tankers join accomodation using (acc_id) WHERE acc_code='$acc_code'");
            if(mysqli_num_rows($tankers_affected)>0){
                while($record=mysqli_fetch_array($tankers_affected)){
                    mysqli_query($conn,"insert into change_tracking_tankers (user,type,acc_id, tanker_id, security_emp_id, quality_check, qty, bill_no,vendor_id,tanker_timestamp) 
                    values ('{$_SESSION['user']}','Delete','{$record['acc_id']}', '{$record['id']}', '{$record['security_emp_id']}', '{$record['quality_check']}', '{$record['qty']}', '{$record['bill_no']}','{$record['vendor_id']}','{$record['vendor_id']}')");
                    mysqli_query($conn, "DELETE FROM tankers WHERE acc_id='{$record['acc_id']}'");
                }
            }
        }

        mysqli_query($conn, "DELETE FROM accomodation WHERE acc_code='$acc_code'");
        $_SESSION['message'] = "Accomodation deleted!"; 
        header('location: ../views/accomodation/accomodation_table.php');
    }

?>