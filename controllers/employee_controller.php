<?php
    require "includes/common.php";
// initialize variables
$emp_code = $fname = $mname = $lname = $designation = $dob = $address = $state = $country = $pincode = $contact = $email = $blood_group = $department = $joining_date = $aadhaar_number = $salary = $room_id = "";

$update = false;
$updateAcc = $updateRoom = "";
if (isset($_POST['submit'])) {
    $emp_code = $_POST['emp_code'];
    // $emp_id = $_POST['emp_id'];
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $designation = $_POST['designation'];
    $dob = date('Y-m-d',strtotime($_POST['dob']));
    $address = $_POST['address'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $pincode = $_POST['pincode'];
    // $contacts_id = $_POST['contacts_id'];
    // $contact1 = mysqli_real_escape_string($conn,$_POST['contact1']);
    // $contact2 = mysqli_real_escape_string($conn,$_POST['contact2']);
    $contact = $_POST['contact1'];
    $email = $_POST['email'];
    $blood_group = $_POST['blood_group'];
    $department = $_POST['department'];
    $joining_date = date('Y-m-d',strtotime($_POST['joining_date']));
    $aadhaar_number = $_POST['aadhaar_number'];
    $salary = $_POST['salary'];
    $room_id = $_POST['room_id'];
    // $desig_id = $_POST['desig_id'];
    // !empty($room_id)?mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,blood_group,department,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$blood_group','$department','$joining_date','$aadhaar_number','$salary','$room_id')"):mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,blood_group,department,joining_date,aadhaar_number,salary) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$blood_group','$department','$joining_date','$aadhaar_number','$salary')");

    $queryRoomOcc = mysqli_query($conn, "SELECT * FROM rooms WHERE id = '$room_id'");
    $EmployeeRoom_row = mysqli_fetch_assoc($queryRoomOcc);
    $roomCap = $EmployeeRoom_row['room_capacity'];
    $roomOcc = $EmployeeRoom_row['current_room_occupancy'];
    $accID = $EmployeeRoom_row['acc_id'];
    $roomStatus = $EmployeeRoom_row['status'];
    if($roomOcc < $roomCap)
    {
        $roomOcc = $roomOcc + 1;
        if($roomOcc == $roomCap){
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
        }
        else{
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Available' WHERE id = $room_id";
        }
    }
    else{
        echo "Room Occupied!";
        $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
    }
    

    $queryAcc = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = $accID");
    $EmployeeAcc_row = mysqli_fetch_assoc($queryAcc);
    $totRooms = $EmployeeAcc_row['no_of_rooms'];
    if($roomStatus == "Occupied")
    {
        $occRooms = $occRooms + 1;
        $avaRooms = $totRooms - $occRooms;
        $updateAcc = "UPDATE accomodation SET occupied_rooms = '$occRooms', available_rooms = '$avaRooms' WHERE acc_id = $accID";
        $submitAcc = mysqli_query($conn, $updateAcc) or die(mysqli_error($conn));
    }

    $submitRoom = mysqli_query($conn, $updateRoom) or die(mysqli_error($conn));
    
    mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,blood_group,department,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$blood_group','$department','$joining_date','$aadhaar_number','$salary','$room_id')");

    // $last_insert_id = mysqli_insert_id($conn);
    // mysqli_query($conn, "INSERT INTO contact (emp_id, primary_contact,secondary_contact) VALUES ('$last_insert_id', '$contact1','$contact2')");
    // $last_insert_id = mysqli_insert_id($conn);
    // mysqli_query($conn, "UPDATE employee SET contact='$last_insert_id' WHERE emp_code='$emp_code'");
    // $_SESSION['message'] = "Employee Details Saved";
    header('location: ../views/hrm/employee_table.php');
}

if (isset($_POST['update'])) {
    $emp_code = $_POST['emp_code'];
    $emp_id = $_POST['emp_id'];
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $designation = $_POST['designation'];
    $dob = date('Y-m-d',strtotime($_POST['dob']));
    $address = $_POST['address'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $pincode = $_POST['pincode'];
    // $contacts_id = $_POST['contacts_id'];
    // $contact1 = $_POST['contact1'];
    // $contact2 = $_POST['contact2'];
    $contact = $_POST['contact1'];
    $email = $_POST['email'];
    $blood_group = $_POST['blood_group'];
    $department = $_POST['department'];
    $joining_date = date('Y-m-d',strtotime($_POST['joining_date']));
    $aadhaar_number = $_POST['aadhaar_number'];
    $salary = $_POST['salary'];
    $room_id = $_POST['room_id'];
    // $desig_id = $_POST['desig_id'];
    // mysqli_query($conn, "UPDATE contact SET primary_contact='$contact1',secondary_contact='$contact2' where emp_id='$emp_id'");

    $queryRoomOcc = mysqli_query($conn, "SELECT * FROM rooms WHERE id = '$room_id'");
    $EmployeeRoom_row = mysqli_fetch_assoc($queryRoomOcc);
    $roomCap = $EmployeeRoom_row['room_capacity'];
    $roomOcc = $EmployeeRoom_row['current_room_occupancy'];
    $accID = $EmployeeRoom_row['acc_id'];
    $roomStatus = $EmployeeRoom_row['status'];
    if($roomOcc < $roomCap)
    {
        $roomOcc = $roomOcc + 1;
        if($roomOcc == $roomCap){
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
        }
        else{
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Available' WHERE id = $room_id";
        }
    }
    else{
        echo "Room Occupied!";
        $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
    }
    

    $queryAcc = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = $accID");
    $EmployeeAcc_row = mysqli_fetch_assoc($queryAcc);
    $totRooms = $EmployeeAcc_row['no_of_rooms'];
    if($roomStatus == "Occupied")
    {
        $occRooms = $occRooms + 1;
        $avaRooms = $totRooms - $occRooms;
        $updateAcc = "UPDATE accomodation SET occupied_rooms = '$occRooms', available_rooms = '$avaRooms' WHERE acc_id = $accID";
        $submitAcc = mysqli_query($conn, $updateAcc) or die(mysqli_error($conn));
    }

    $submitRoom = mysqli_query($conn, $updateRoom) or die(mysqli_error($conn));

    mysqli_query($conn, "UPDATE employee SET fname='$fname', mname='$mname',lname='$lname',designation='$designation',dob='$dob',contact='$contact',address='$address',
                                            state='$state',country='$country',pincode='$pincode',email='$email',blood_group='$blood_group',
                                            department='$department',joining_date='$joining_date',aadhaar_number='$aadhaar_number',salary='$salary',
                                            room_id='$room_id' WHERE emp_code='$emp_code'");

    $_SESSION['message'] = "Employee Info Updated!";
    header('location: ../views/hrm/employee_table.php');
}

if (isset($_GET['del'])) {
    $emp_code = $_GET['del'];
    mysqli_query($conn, "DELETE FROM employee WHERE emp_code=$emp_code");
    $_SESSION['message'] = "Employee Deleted!";
    header('location: ../views/hrm/employee_table.php');
}