<?php 
require 'includes/common.php';
if(isset($_REQUEST['emp_code'])){
    $emp_code = $_REQUEST['emp_code'];
    if ($emp_code != "") {
        $query = mysqli_query($conn, "SELECT room_id FROM employee WHERE emp_code='$emp_code'");
        $row = mysqli_fetch_array($query);
        $room = $row["room_id"];
        if($room!=''){
            $acc=mysqli_fetch_array(mysqli_query($conn,"select acc_id from accomodation join rooms using(acc_id) where rooms.id='$room'"));
            $acc_id=$acc['acc_id'];
        }
    }
    $result = array("$acc_id");
    $myJSON = json_encode($result);
    echo $myJSON;
}
if(isset($_REQUEST['y'])){
    $emps=mysqli_query($conn,"select concat(fname,' ',mname,' ',lname,' - ',emp_code) as name from employee");
    $employees=array();
     while($result =mysqli_fetch_array($emps)){
                array_push($employees,$result['name']);

     }
    $myJSON = json_encode($result);
    echo $myJSON;
}
if(isset($_REQUEST['acc'])){
    $acc = $_REQUEST['acc'];
    $rooms=array();
    $query = mysqli_query($conn, "SELECT id,room_no FROM rooms WHERE acc_id='$acc'");
    while($row = mysqli_fetch_array($query)){
        // array_push($rooms,$row['room_no']);
        $rooms[$row['id']] = $row['room_no'];
    }        
    // $result = array($rooms);
    $myJSON = json_encode($rooms);
    echo $myJSON;
}
if(isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    $row = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM login_credentials WHERE emp_id='$id'"));
    $result = array($row['pass']);
    $myJSON = json_encode($result);
    echo $myJSON;
}
if(isset($_REQUEST['emp_code_room_check'])){
    $id = $_REQUEST['emp_code_room_check'];
    $row = mysqli_fetch_array(mysqli_query($conn, "SELECT room_id FROM employee WHERE emp_code='$id'"));
    $row1 = mysqli_query($conn, "SELECT concat(accomodation.acc_name,' - ',accomodation.acc_code) as acc FROM rooms join accomodation WHERE rooms.id='{$row['room_id']}'");
    if(mysqli_num_rows($row1)>0){
        $row12 = mysqli_fetch_array($row1);
        echo $row12['acc'];
    }
    else echo"!";
}
?>