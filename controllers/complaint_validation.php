<?php 
require 'includes/common.php';
$emp_code = $_REQUEST['emp_code'];
if ($emp_code !== "") {
    $query = mysqli_query($conn, "SELECT room_id FROM employee WHERE emp_code='$emp_code'");
    $row = mysqli_fetch_array($query);
    $room = $row["room_id"];
    if($room!=''){
        $acc=mysqli_fetch_array(mysqli_query($conn,"select acc_code from accomodation join rooms using(acc_id) where rooms.id='$room'"));
        $acc_code=$acc['acc_code'];
    }
}
$result = array("$acc_code");
$myJSON = json_encode($result);
echo $myJSON;
?>