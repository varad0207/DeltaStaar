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
    $room_id = NULL;
    // $desig_id = $_POST['desig_id'];
    // !empty($room_id)?mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,blood_group,department,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$blood_group','$department','$joining_date','$aadhaar_number','$salary','$room_id')"):mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,blood_group,department,joining_date,aadhaar_number,salary) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$blood_group','$department','$joining_date','$aadhaar_number','$salary')");
    if(isset($_POST['room_id'])){
        $room_id = $_POST['room_id'];
        $queryRoomOcc = mysqli_query($conn, "SELECT * FROM rooms WHERE id = '$room_id'");
        $EmployeeRoom_row = mysqli_fetch_assoc($queryRoomOcc);
        $accID = $EmployeeRoom_row['acc_id'];
        $roomCap = $EmployeeRoom_row['room_capacity'];
        $roomOcc = $EmployeeRoom_row['current_room_occupancy'];
        $roomStatus = $EmployeeRoom_row['status'];
        if($roomOcc < $roomCap)
        {
            $roomOcc = $roomOcc + 1;
            if($roomOcc == $roomCap){
                $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
            }
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Available' WHERE id = $room_id";
        }
        elseif($roomOcc == $roomCap){
            echo "Room Occupied!";
            $updateRoom = "UPDATE rooms SET current_room_occupancy = $roomOcc, status = 'Occupied' WHERE id = $room_id";
        }
        
        $submitRoom = mysqli_query($conn, $updateRoom) or die(mysqli_error($conn));

        // $queryAcc = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = $accID");
        // $EmployeeAcc_row = mysqli_fetch_assoc($queryAcc);
        // $totRooms = $EmployeeAcc_row['no_of_rooms'];
        // if($roomStatus == "Occupied")
        // {
        //     $occRooms = $occRooms + 1;
        //     $avaRooms = $totRooms - $occRooms;
        //     $updateAcc = "UPDATE accomodation SET occupied_rooms = $occRooms, available_rooms = $avaRooms WHERE acc_id = %accID";
        // }

        // $submitAcc = mysqli_query($conn, $updateAcc) or die(mysqli_error($conn));
    }
    mysqli_query($conn, "INSERT INTO employee (emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhaar_number','$salary','$room_id')");
    $last_insert_id = mysqli_insert_id($conn);

    // mysqli_query($conn, "INSERT INTO contact (emp_id, primary_contact,secondary_contact) VALUES ('$last_insert_id', '$contact1','$contact2')");
    // $last_insert_id = mysqli_insert_id($conn);
    // mysqli_query($conn, "UPDATE employee SET contact='$last_insert_id' WHERE emp_code='$emp_code'");
    // $_SESSION['message'] = "Employee Details Saved";

    //change tracking code
    if($AllowTrackingChanges)
    mysqli_query($conn,"insert into change_tracking_employee(user,type,emp_id,emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id) values ('{$_SESSION['user']}','Insert','$last_insert_id','$emp_code', '$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhaar_number','$salary','$room_id')");

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
    $room_id=NULL;
    // $desig_id = $_POST['desig_id'];
    // mysqli_query($conn, "UPDATE contact SET primary_contact='$contact1',secondary_contact='$contact2' where emp_id='$emp_id'");
    if(isset($_POST['room_id'])){
        $room_id = $_POST['room_id'];
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
        $submitRoom = mysqli_query($conn, $updateRoom) or die(mysqli_error($conn));


        // $queryAcc = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = $accID");
        // $EmployeeAcc_row = mysqli_fetch_assoc($queryAcc);
        // $totRooms = $EmployeeAcc_row['no_of_rooms'];
        // if($roomStatus == "Occupied")
        // {
        //     $occRooms = $occRooms + 1;
        //     $avaRooms = $totRooms - $occRooms;
        //     $updateAcc = "UPDATE accomodation SET occupied_rooms = $occRooms, available_rooms = $avaRooms WHERE acc_id = %accID";
        // }

        // $submitAcc = mysqli_query($conn, $updateAcc) or die(mysqli_error($conn));
    }

    //change tracking code
    if($AllowTrackingChanges){
        $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee WHERE emp_code='$emp_code'"));
        mysqli_query($conn,"insert into change_tracking_employee(user,type,emp_id,emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id,role)
        values ('{$_SESSION['user']}','Update','{$row_affected['emp_id']}', '{$row_affected['emp_code']}','{$row_affected['fname']}','{$row_affected['mname']}','{$row_affected['lname']}','{$row_affected['designation']}',
        '{$row_affected['dob']}','{$row_affected['contact']}','{$row_affected['address']}','{$row_affected['state']}','{$row_affected['country']}','{$row_affected['pincode']}','{$row_affected['email']}','{$row_affected['department']}','{$row_affected['blood_group']}',
        '{$row_affected['joining_date']}','{$row_affected['aadhaar_number']}','{$row_affected['salary']}','{$row_affected['room_id']}','{$row_affected['role']}')");
    }

    mysqli_query($conn, "UPDATE employee SET fname='$fname', mname='$mname',lname='$lname',designation='$designation',dob='$dob',contact='$contact',address='$address',
                                            state='$state',country='$country',pincode='$pincode',email='$email',blood_group='$blood_group',
                                            department='$department',joining_date='$joining_date',aadhaar_number='$aadhaar_number',salary='$salary',
                                            room_id='$room_id' WHERE emp_code='$emp_code'");

    $_SESSION['message'] = "Employee Info Updated!";
    header('location: ../views/hrm/employee_table.php');
}

if (isset($_GET['del'])) {
    $emp_code = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
        $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM employee WHERE emp_code='$emp_code'"));
        mysqli_query($conn,"insert into change_tracking_employee(user,type,emp_id,emp_code, fname,mname,lname,designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id,role)
        values ('{$_SESSION['user']}','Delete','{$row_affected['emp_id']}', '{$row_affected['emp_code']}','{$row_affected['fname']}','{$row_affected['mname']}','{$row_affected['lname']}','{$row_affected['designation']}',
        '{$row_affected['dob']}','{$row_affected['contact']}','{$row_affected['address']}','{$row_affected['state']}','{$row_affected['country']}','{$row_affected['pincode']}','{$row_affected['email']}','{$row_affected['department']}','{$row_affected['blood_group']}',
        '{$row_affected['joining_date']}','{$row_affected['aadhaar_number']}','{$row_affected['salary']}','{$row_affected['room_id']}','{$row_affected['role']}')");
        
        $outing_record=mysqli_query($conn,"select * FROM employee_outing WHERE emp_code='$emp_code'");
        if(mysqli_num_rows($outing_record)>0){
            while($record=mysqli_fetch_array($outing_record)){
                mysqli_query($conn,"insert into change_tracking_employee_outing(user,type,emp_code, approval,outing_date,arrival_date,category)
                values ('{$_SESSION['user']}','Delete','{$record['emp_code']}', '{$record['approval']}','{$record['outing_date']}','{$record['arrival_date']}','{$record['category']}')");
            }
            mysqli_query($conn, "DELETE FROM employee_outing WHERE emp_code='$emp_code'");
        }

        $vaccination_record=mysqli_query($conn,"select * FROM vaccination WHERE emp_code='$emp_code'");
        if(mysqli_num_rows($vaccination_record)>0){
            while($record=mysqli_fetch_array($vaccination_record)){
                mysqli_query($conn,"insert into change_tracking_vaccination (user,type,vaccination_id,emp_id,emp_code,category_id,date_of_administration,location,date_of_next_dose)
                values ('{$_SESSION['user']}','Delete','{$record['vaccination_id']}', '{$record['emp_id']}', '{$record['emp_code']}', '{$record['category_id']}', '{$record['date_of_administration']}', '{$record['location']}', '{$record['date_of_next_dose']}')");
            }
            mysqli_query($conn, "DELETE FROM vaccination WHERE security_emp_id='$emp_code'");
        }

        $visitor_record=mysqli_query($conn,"select * FROM visitor_log join employee on employee.emp_id=visitor.security_emp_id WHERE employee.emp_code='$emp_code'");
        if(mysqli_num_rows($vaccination_record)>0){
            while($record=mysqli_fetch_array($visito_record)){            
                mysqli_query($conn,"insert into change_tracking_visitor_log(user,type,log_id,acc_code,emp_id,security_emp_id,visitor_name,vehicle_no,visit_type,check_in,check_out,purpose,phone_no)
                values ('{$_SESSION['user']}','Delete','{$record['id']}', '{$record['acc_code']}','{$record['emp_id']}','{$record['security_emp_id']}','{$record['visitor_name']}','{$record['vehicle_no']}',
                '{$record['type']}','{$record['check_in']}','{$record['check_out']}','{$record['purpose']}','{$record['phone_no']}')");
                mysqli_query($conn, "DELETE FROM visitor_log WHERE security_emp_id={$record['security_emp_id']}");
            }
        }
    }

    mysqli_query($conn, "DELETE FROM employee WHERE emp_code='$emp_code'");
    $_SESSION['message'] = "Employee Deleted!";
    header('location: ../views/hrm/employee_table.php');
}