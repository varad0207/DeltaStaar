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
        $acc_code = $room_no = $room_cap = $curr_room_cap = $status = "";
    }

    if(isset($_POST['submit']) && !empty($_POST['submit']))
    {
        $acc_code = mysqli_real_escape_string($conn, $_POST['acc']);
        $room_no = mysqli_real_escape_string($conn, $_POST['room_no']);
        $room_cap = mysqli_real_escape_string($conn, $_POST['room_cap']);
        // $curr_room_cap = mysqli_real_escape_string($conn, $_POST['curr_room_cap']);
        // $status = mysqli_real_escape_string($conn, $_POST['room_stat']);

        $insert = "insert into rooms (acc_id, room_no, room_capacity, status) values ('$acc_code', '$room_no', '$room_cap', '')";

        // $results = mysqli_query($conn, "SELECT * FROM rooms");
        // $row = mysqli_fetch_array($results);
        // $acc_id = $row['acc_id'];
        $queryRoom = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = '$acc_code'");
        $EmployeeRoom_row = mysqli_fetch_assoc($queryRoom);
        $roomCap = $EmployeeRoom_row['tot_capacity'];
        $noOfRooms = $EmployeeRoom_row['no_of_rooms'];
        $roomCap = $roomCap + $room_cap;
        $noOfRooms = $noOfRooms + 1;

        $updateAcc = "UPDATE accomodation SET tot_capacity = $roomCap, no_of_rooms = $noOfRooms WHERE acc_id = $acc_code";
        $submitAcc = mysqli_query($conn, $updateAcc) or die(mysqli_error($conn));

        echo mysqli_error($conn);
        $submit = mysqli_query($conn, $insert) or die(mysqli_error($conn));
        $last_insert_id = mysqli_insert_id($conn);

        $_SESSION['message'] = "Room Info Added!";

        //change tracking code
        if($AllowTrackingChanges){
            mysqli_query($conn,"insert into change_tracking_rooms (user,type,acc_id,room_id, room_no, room_capacity) values ('{$_SESSION['user']}','Insert','$acc_code','$last_insert_id', '$room_no', '$room_cap')");
        }

        header("location: ../views/accomodation/room_table.php");
    }

    if(isset($_POST['update']))
    {
        $id=$_POST['id'];
        $acc_code = $_POST['acc'];
        $room_no = $_POST['room_no'];
        $room_cap = $_POST['room_cap'];
        // $curr_room_cap = $_POST['curr_room_cap'];
        // $status = $_POST['room_stat'];

         //change tracking code
         if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM rooms WHERE id=$id"));
            mysqli_query($conn,"insert into change_tracking_rooms (user,type,acc_id, room_id, room_no, room_capacity) 
            values ('{$_SESSION['user']}','Update','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['room_no']}', '{$row_affected['room_capacity']}')");
        }

        $update = "update rooms set acc_id = '$acc_code',room_no='$room_no', room_capacity = '$room_cap' where id=$id";

        mysqli_query($conn, $update);

        $_SESSION['message'] = "Room Info Updated!";
        header("location: ../views/accomodation/room_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM rooms WHERE id=$id"));
            mysqli_query($conn,"insert into change_tracking_rooms (user,type,acc_id, room_id, room_no, room_capacity, status, current_room_occupancy) 
            values ('{$_SESSION['user']}','Delete','{$row_affected['acc_id']}', '{$row_affected['id']}', '{$row_affected['room_no']}', '{$row_affected['room_capacity']}', '{$row_affected['status']}', NULLIF('{$row_affected['current_room_occupancy']}',''))");
        }

        mysqli_query($conn, "delete from rooms where id = $id");
        $_SESSION['message'] = "Room Deleted!";
        header("location: ../views/accomodation/room_table.php");
    }
?>