<?php
if (isset($_POST['submit']) || isset($_POST['update']) || isset($_GET['del'])) {
    include('includes/common.php');
} else {
    include('includes/common.php');
}
?>

<?php
if (!isset($_SESSION)) {
    session_start();
    $acc_id = $room_no = $room_cap = $curr_room_cap = $status = "";
}

if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    $acc_id = $_POST['acc'];
    $parts = explode(" - ", $acc_id); // Split the string by " - "
    $acc_code = end($parts);
    $room_no = $_POST['room_no'];
    $room_cap = $_POST['room_cap'];
    $sql1 = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_code='$acc_code'");
    $accRow = mysqli_fetch_array($sql1);
    $acc_id = $accRow['acc_id'];

    $roomCount = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(id) AS count_room FROM `rooms` WHERE acc_id='$acc_id' GROUP BY `acc_id`"));
    $room_count = $roomCount['count_room'];
    $capacity = mysqli_fetch_array(mysqli_query($conn, "SELECT SUM(room_capacity) AS Room_Capacity FROM rooms WHERE acc_id='$acc_id' GROUP BY `acc_id`"));
    $tot_cap = $capacity['Room_Capacity'];
    $tot_cap += $room_cap;
    $no_of_rooms=$room_count+1;
    $res=mysqli_query($conn, "INSERT INTO rooms (acc_id, room_no, room_capacity) VALUES ('$acc_id', '$room_no', '$room_cap')");
    $last_insert_id = mysqli_insert_id($conn);
    if($res){
        mysqli_query($conn, "UPDATE accomodation SET no_of_rooms='$no_of_rooms',tot_capacity = '$tot_cap' WHERE acc_id = '$acc_id'");
        $_SESSION['message'] = "Room Info Added!";
    }
    else{
        $_SESSION['message'] = "An error occured,try again!";
        header("location: ../views/accomodation/room_table.php");
    }

    //change tracking code
    if ($AllowTrackingChanges) {
        mysqli_query($conn, "insert into change_tracking_rooms (user,type,acc_id,room_id, room_no, room_capacity) values ('{$_SESSION['user']}','Insert','$acc_id','$last_insert_id', '$room_no', '$room_cap')");
        $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM accomodation WHERE acc_id='$acc_id'"));
        mysqli_query($conn,"insert into change_tracking_accomodation (user,type,acc_id, acc_code, acc_name, bldg_status, gender, no_of_rooms, warden_emp_code, owner, remark) 
            values ('{$_SESSION['user']}','Update','{$row_affected['acc_id']}', '{$row_affected['acc_code']}', '{$row_affected['acc_name']}', '{$row_affected['bldg_status']}', '{$row_affected['gender']}', '{$row_affected['no_of_rooms']}', '{$row_affected['warden_emp_code']}', '{$row_affected['owner']}', '{$row_affected['remark']}')");
    
    }
    header("location: ../views/accomodation/room_table.php");
}

if (isset($_POST['update'])) {
    $tot_cap = 0;
    $id = $_POST['id'];
    $acc_id = $_POST['acc'];
    $room_no = $_POST['room_no'];
    $room_cap = $_POST['room_cap'];
    $sql1 = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id='$acc_id'");
    $accRow = mysqli_fetch_array($sql1);
    $no_of_rooms = $accRow['no_of_rooms'];
    $sql2 = mysqli_query($conn, "SELECT COUNT(id) AS count_room FROM `rooms` WHERE acc_id='$acc_id' GROUP BY `acc_id`");
    $roomCount = mysqli_fetch_array($sql2);
    $room_count = $roomCount['count_room'];


    if ($room_count < $no_of_rooms) {
        mysqli_query($conn, "UPDATE rooms SET acc_id = '$acc_id',room_no='$room_no', room_capacity = '$room_cap' where id=$id");
        $sql3 = mysqli_query($conn, "SELECT SUM(room_capacity) AS Room_Capacity FROM rooms WHERE acc_id='$acc_id' GROUP BY `acc_id`");
        $row3 = mysqli_fetch_array($sql3);
        $tot_cap = $row3['Room_Capacity'];
        // $tot_cap += $room_cap;
        // echo $tot_cap;
        mysqli_query($conn, "UPDATE accomodation SET tot_capacity = '$tot_cap' WHERE acc_id = '$acc_id'");
        $_SESSION['message'] = "Room Info Updated!";
    } else {
        $_SESSION['message'] = "Room Limit Reached!";
    }

    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM rooms WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_rooms (user,type,acc_id, room_id, room_no, room_capacity) 
            values ('{$_SESSION['user']}','Update','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['room_no']}', '{$row_affected['room_capacity']}')");
    }


    header("location: ../views/accomodation/room_table.php");
}

if (isset($_GET['del'])) {
    $tot_cap = 0;
    $id = $_GET['del'];
    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM rooms WHERE id=$id"));
        mysqli_query($conn, "insert into change_tracking_rooms (user,type,acc_id, room_id, room_no, room_capacity, status, current_room_occupancy) 
            values ('{$_SESSION['user']}','Delete','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['room_no']}', '{$row_affected['room_capacity']}', '{$row_affected['status']}', NULLIF('{$row_affected['current_room_occupancy']}',''))");
    }

    $sql1 = mysqli_query($conn, "SELECT * FROM rooms WHERE id = $id");
    $row1 = mysqli_fetch_array($sql1);
    $acc_id = $row1['acc_id'];

    $room_cap = $row1['room_capacity'];
    $sql3 = mysqli_query($conn, "SELECT SUM(room_capacity) AS Room_Capacity FROM rooms WHERE acc_id='$acc_id' GROUP BY `acc_id`");
    $row3 = mysqli_fetch_array($sql3);
    $tot_cap = $row3['Room_Capacity'];
    $tot_cap -= $room_cap;
    mysqli_query($conn, "UPDATE accomodation SET tot_capacity = '$tot_cap' WHERE acc_id = '$acc_id'");
    mysqli_query($conn, "DELETE FROM rooms WHERE id = $id");
    $_SESSION['message'] = "Room Deleted!";
    header("location: ../views/accomodation/room_table.php");
}
?>