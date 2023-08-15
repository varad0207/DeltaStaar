<?php if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
    include('includes/common.php');
}else{
    include('includes/common.php');
}
?>
<?php

if (!isset($_SESSION)) {
    session_start();
}
// initialize variables
$emp_id="";
$category="";
$dateofadministration="";
$nextdose="";
$location="";

$update = false;

if (isset($_POST['submit'])) {
    
    // $vaccination_id = $_POST['vaccination_id'];
    $emp_id= $_POST['emp_code'];
    $parts = explode(" - ", $emp_id); // Split the string by " - "
    $emp_code = end($parts); 
    $category=$_POST['cat_id'];
    $dateofadministration=date('Y-m-d',strtotime($_POST['doa']));
    // $nextdose=date('Y-m-d',strtotime($_POST['dond']));
    $location=$_POST['loc'];

    $emp_row=mysqli_fetch_array(mysqli_query($conn,"select emp_id from employee where emp_code='$emp_code'"));

    mysqli_query($conn, "INSERT INTO vaccination(emp_id,emp_code,category_id,date_of_administration,location) VALUES ('{$emp_row['emp_id']}','$emp_code','$category','$dateofadministration','$location')");
    $last_insert_id = mysqli_insert_id($conn);
    $_SESSION['message'] = "vaccination details saved";

    //change tracking code
    if($AllowTrackingChanges)
    mysqli_query($conn,"insert into change_tracking_vaccination (user,type,vaccination_id,emp_id,emp_code,category_id,date_of_administration,location) VALUES ('{$_SESSION['user']}','Insert','$last_insert_id','{$emp_row['emp_id']}','$emp_code','$category','$dateofadministration','$location')");

    header('location: ../views/hrm/vaccination_table.php');
}

if (isset($_POST['update'])) {

    $vaccination_id = $_POST['vaccination_id'];
    $emp_id= $_POST['emp_id'];
    $emp_code=$_POST['emp_code'];
    $category=$_POST['cat_id'];
    $dateofadministration=date('Y-m-d',strtotime($_POST['doa']));
    // $nextdose=date('Y-m-d',strtotime($_POST['dond']));
    $location=$_POST['loc'];
    // echo $location;
    mysqli_query($conn, "INSERT INTO vaccination(emp_id,emp_code,category_id,date_of_administration,location) VALUES ('$emp_id','$emp_code','$category','$dateofadministration','$location')")or die(mysqli_error($conn));
    $last_insert_id = mysqli_insert_id($conn);
    $_SESSION['message'] = "Vaccnation Info updated!";

    //change tracking code
    if($AllowTrackingChanges)
    mysqli_query($conn,"insert into change_tracking_vaccination (user,type,vaccination_id,emp_id,emp_code,category_id,date_of_administration,location) VALUES ('{$_SESSION['user']}','Update','$last_insert_id','$emp_id','{$emp_row['emp_code']}','$category','$dateofadministration','$location')");


    header('location: ../views/hrm/vaccination_table.php');
}

if (isset($_GET['del'])) {
    $vaccination_id = $_GET['del'];

    //change tracking code
    // if($AllowTrackingChanges){
    //     $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM vaccination WHERE vaccination_id=$vaccination_id"));
    //     mysqli_query($conn,"insert into change_tracking_vaccination (user,type,vaccination_id,emp_id,emp_code,category_id,date_of_administration,location)
    //         values ('{$_SESSION['user']}','Delete','{$row_affected['vaccination_id']}', '{$row_affected['emp_id']}', '{$row_affected['emp_code']}', '{$row_affected['category_id']}', '{$row_affected['date_of_administration']}', '{$row_affected['location']}', '{$row_affected['date_of_next_dose']}')");
    // }

    /*
to delete entirely, # DELETE FROM vaccination WHERE emp_id=$emp_id #
    */
    mysqli_query($conn, "DELETE FROM vaccination WHERE vaccination_id=$vaccination_id");
    $_SESSION['message'] = "Vaccination deleted!";
    header('location: ../views/hrm/vaccination_table.php');
}