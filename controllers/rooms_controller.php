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
        $curr_room_cap = mysqli_real_escape_string($conn, $_POST['curr_room_cap']);
        $status = mysqli_real_escape_string($conn, $_POST['room_stat']);

        $insert = "insert into rooms (acc_id, id, room_no, room_capacity, status, current_room_occupancy) values ('$acc_code', '', '$room_no', '$room_cap', '', '$curr_room_cap')";

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
        $_SESSION['message'] = "Room Info Added!";
        header("location: ../views/accomodation/room_table.php");
    }

    if(isset($_POST['update']))
    {
        $acc_code = $_POST['acc'];
        $room_no = $_POST['room_no'];
        $room_cap = $_POST['room_cap'];
        $curr_room_cap = $_POST['curr_room_cap'];
        $status = $_POST['room_stat'];

        $update = "update rooms set acc_id = '$acc_code', room_capacity = '$room_cap', status = '$status', current_room_occupancy = '$curr_room_cap' where room_no=$room_no";

        mysqli_query($conn, $update);

        $_SESSION['message'] = "Room Info Updated!";
        header("location: ../views/accomodation/room_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];
        mysqli_query($conn, "delete from rooms where id = $id");

        $_SESSION['message'] = "Room Deleted!";
        header("location: ../views/accomodation/room_table.php");
    }
?>