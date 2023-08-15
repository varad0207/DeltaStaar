<?php
require "includes/common.php";
include('includes/common.php');
date_default_timezone_set('Asia/Kolkata');

// initialize variables
$emp_code = $fname = $designation = $dob = $address = $state = $country = $pincode = $contact = $email = $blood_group = $department = $joining_date = $aadhaar_number = $salary = $room_id = $curr_room_occ = "";

$update = false;
$updateAcc = $updateRoom = "";
if (isset($_POST['submit'])) {
    $emp_code = $_POST['emp_code'];

    $fname = $_POST['fname'];
    // $mname = $_POST['mname'];
    // $lname = $_POST['lname'];
    $designation = $_POST['designation'];
    $dob = date('Y-m-d', strtotime($_POST['dob']));
    $address = $_POST['address'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $pincode = $_POST['pincode'];

    $contact = $_POST['contact1'];
    $email = $_POST['email'];
    $blood_group = $_POST['blood_group'];
    $department = $_POST['department'];
    $joining_date = date('Y-m-d', strtotime($_POST['joining_date']));
    $aadhaar_number = $_POST['aadhaar_number'];
    $salary = $_POST['salary'];
    $room_id = NULL;

    if (isset($_POST['room_id'])) {
        $room_id = $_POST['room_id'];
        $sql1 = mysqli_query($conn, "SELECT * FROM rooms WHERE id='$room_id'");
        $row1 = mysqli_fetch_array($sql1);
        $curr_room_occ = $row1['current_room_occupancy'];
        $stat = $row1['status'];
        $room_cap = $row1['room_capacity'];
        $acc_id = $row1['acc_id'];
        $sql2 = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id='$acc_id'");
        $row2 = mysqli_fetch_array($sql2);
        if ($curr_room_occ < $room_cap) {
            $curr_room_occ += 1;
            if ($curr_room_occ == $room_cap) {
                $stat = "Occupied";

                $occ_rooms = $row2['occupied_rooms'];
                $tot_rooms = $row2['no_of_rooms'];
                $new_occ_rooms = $occ_rooms + 1;
                $new_avail_rooms = $tot_rooms - $new_occ_rooms;

                mysqli_query($conn, "UPDATE rooms SET status = '$stat' WHERE id='$room_id'");
                mysqli_query($conn, "UPDATE accomodation SET occupied_rooms = '$new_occ_rooms', available_rooms = '$new_avail_rooms' WHERE acc_id='$acc_id'");
            }
            mysqli_query($conn, "UPDATE rooms SET current_room_occupancy = '$curr_room_occ' WHERE id='$room_id'");
            mysqli_query($conn, "INSERT INTO employee (emp_code, fname, designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname', '$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhaar_number','$salary',nullif('$room_id',' '))");
            $last_insert_id = mysqli_insert_id($conn);
            $_SESSION['message'] = "Employee Details Saved";
            // add this employee to histroy table
            $newObject = array('accomodation' => $row2['acc_name'], 'room' => $row1['room_no'], 'start_date' => date("d-m-Y"));
            $arrayOfObjects[] = $newObject;
            $jsonArray = json_encode($arrayOfObjects);
            mysqli_query($conn, "INSERT INTO change_tracking_living_history (emp_code, history) VALUES ('$emp_code', '$jsonArray')");
        } else {
            $_SESSION['message'] = "Room Limit Reached";
        }
    } else {
        mysqli_query($conn, "INSERT INTO employee (emp_code, fname,designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id) VALUES ('$emp_code', '$fname', '$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhaar_number','$salary',nullif('$room_id',' '))");
        $last_insert_id = mysqli_insert_id($conn);
    }


    // if ($AllowTrackingChanges)
    //     mysqli_query($conn, "insert into change_tracking_employee(user,type,emp_id,emp_code, fname, designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id) values ('{$_SESSION['user']}','Insert','$last_insert_id','$emp_code', '$fname', '$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhaar_number','$salary','$room_id')");

    header('location: ../views/hrm/employee_table.php');
}

if (isset($_POST['update'])) {
    $empcode_edit = $emp_code;
    $emp_code = $_POST['emp_code'];
    $emp_id = $_POST['emp_id'];
    $fname = $_POST['fname'];
    // $mname = $_POST['mname'];
    // $lname = $_POST['lname'];
    $designation = $_POST['designation'];
    $dob = date('Y-m-d', strtotime($_POST['dob']));
    $address = $_POST['address'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $pincode = $_POST['pincode'];

    $contact = $_POST['contact1'];
    $email = $_POST['email'];
    $blood_group = $_POST['blood_group'];
    $department = $_POST['department'];
    $joining_date = date('Y-m-d', strtotime($_POST['joining_date']));
    $aadhaar_number = $_POST['aadhaar_number'];
    $salary = $_POST['salary'];
    $room_id = NULL;

    if (isset($_POST['room_id'])) {
        $room_id = $_POST['room_id'];
        $sql1 = mysqli_query($conn, "SELECT * FROM rooms WHERE id='$room_id'");
        $row1 = mysqli_fetch_array($sql1);
        $curr_room_occ = $row1['current_room_occupancy'];
        $stat = $row1['status'];
        $room_cap = $row1['room_capacity'];
        $acc_id = $row1['acc_id'];

        $sql4 = mysqli_query($conn, "SELECT * FROM employee WHERE emp_code='$emp_code'");
        $row4 = mysqli_fetch_assoc($sql4);
        $sql5 = mysqli_query($conn, "SELECT * FROM rooms WHERE id='{$row4['room_id']}'");
        $row5 = mysqli_fetch_assoc($sql5);
        $old_curr_occ = $row5['current_room_occupancy'];
        $old_room_id = $row5['id'];

        if ($old_room_id != $room_id && $curr_room_occ < $room_cap) {
            $curr_room_occ += 1;
            $old_curr_occ -= 1;
            mysqli_query($conn, "UPDATE rooms set current_room_occupancy='$old_curr_occ' WHERE id='$old_room_id'");

            // if ($old_room_id != $room_id) {
            //     $old_curr_occ -= 1;
            //     mysqli_query($conn, "UPDATE rooms set current_room_occupancy='$old_curr_occ' WHERE id='$old_room_id'");
            // }
            $sql2 = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id='$acc_id'");
            $row2 = mysqli_fetch_array($sql2);
            if ($curr_room_occ == $room_cap) {
                $stat = "Occupied";

                $occ_rooms = $row2['occupied_rooms'];
                $tot_rooms = $row2['no_of_rooms'];
                $new_occ_rooms = $occ_rooms + 1;
                $new_avail_rooms = $tot_rooms - $new_occ_rooms;

                mysqli_query($conn, "UPDATE rooms SET status = '$stat' WHERE id='$room_id'");
                mysqli_query($conn, "UPDATE accomodation SET occupied_rooms = '$new_occ_rooms', available_rooms = '$new_avail_rooms' WHERE acc_id='$acc_id'");
            }
            mysqli_query($conn, "UPDATE rooms SET current_room_occupancy = '$curr_room_occ' WHERE id='$room_id'");

            mysqli_query($conn, "UPDATE employee SET emp_code='$emp_code',fname='$fname',designation='$designation',dob='$dob',contact='$contact',address='$address',state='$state',country='$country',pincode='$pincode',email='$email',department='$department',blood_group='$blood_group',joining_date='$joining_date',aadhaar_number='$aadhaar_number',salary='$salary',room_id=nullif('$room_id',' ') where emp_code='$emp_code'");
            // $last_insert_id = mysqli_insert_id($conn);

            $sqlh = mysqli_query($conn, "SELECT history FROM change_tracking_living_history where emp_code='$emp_code'");
            if (mysqli_num_rows($sqlh) > 0) {
                $res = mysqli_fetch_array($sqlh);
                $jsonArray = $res['history'];
                $arrayOfObjects = json_decode($jsonArray, true);
                $newObject = array('accomodation' => $row2['acc_name'], 'room' => $row1['room_no'], 'start_date' => date("d-m-Y"));
                $arrayOfObjects[] = $newObject;
                $jsonArray = json_encode($arrayOfObjects);
                mysqli_query($conn, "UPDATE change_tracking_living_history SET history='$jsonArray' where emp_code='$emp_code'");
            } else {
                $newObject = array('accomodation' => $row2['acc_name'], 'room' => $row1['room_no'], 'start_date' => date("d-m-Y"));
                $arrayOfObjects[] = $newObject;
                $jsonArray = json_encode($arrayOfObjects);
                mysqli_query($conn, "INSERT INTO change_tracking_living_history (emp_code, history) VALUES ('$emp_code', '$jsonArray')");
            }
            $_SESSION['message'] = "Employee Details Saved";
        } else {
            $_SESSION['message'] = "Room Limit Reached";
        }
    }

    //change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM employee WHERE emp_code='$emp_code'"));

        mysqli_query($conn, "insert into change_tracking_employee(
            user,type,emp_id,emp_code, fname, designation,dob,
            contact,address,state,country,pincode,email,department,blood_group,
            joining_date,aadhaar_number,salary,room_id,role
            )
        values (
            '{$_SESSION['user']}','Update','{$row_affected['emp_id']}', 
            '{$row_affected['emp_code']}','{$row_affected['fname']}',
            
            '{$row_affected['designation']}','{$row_affected['dob']}',
            '{$row_affected['contact']}','{$row_affected['address']}',
            '{$row_affected['state']}','{$row_affected['country']}',
            '{$row_affected['pincode']}','{$row_affected['email']}',
            '{$row_affected['department']}','{$row_affected['blood_group']}',
            '{$row_affected['joining_date']}','{$row_affected['aadhaar_number']}',
            '{$row_affected['salary']}','nullif({$row_affected['room_id']},' ')','{$row_affected['role']}')");
    }

    mysqli_query($conn, "UPDATE employee SET fname='$fname', designation='$designation',dob='$dob',contact='$contact',address='$address',
                                            state='$state',country='$country',pincode='$pincode',email='$email',blood_group='$blood_group',
                                            department='$department',joining_date='$joining_date',aadhaar_number='$aadhaar_number',salary='$salary' WHERE emp_code='$emp_code'");

    // $_SESSION['message'] = "Employee Info Updated!";
    header('location: ../views/hrm/employee_table.php');
}

if (isset($_GET['del'])) {
    $emp_code = $_GET['del'];
    echo $emp_code;
    // change tracking code
    if ($AllowTrackingChanges) {
        $row_affected = mysqli_fetch_array(mysqli_query($conn, "select * FROM employee WHERE emp_code='$emp_code'"));
        mysqli_query($conn, "insert into change_tracking_employee(user,type,emp_id,emp_code, fname, designation,dob,contact,address,state,country,pincode,email,department,blood_group,joining_date,aadhaar_number,salary,room_id,role)
        values ('{$_SESSION['user']}','Delete','{$row_affected['emp_id']}', '{$row_affected['emp_code']}','{$row_affected['fname']}','{$row_affected['designation']}',
        '{$row_affected['dob']}','{$row_affected['contact']}','{$row_affected['address']}','{$row_affected['state']}','{$row_affected['country']}','{$row_affected['pincode']}','{$row_affected['email']}','{$row_affected['department']}','{$row_affected['blood_group']}',
        nullif({$row_affected['joining_date']},''),'{$row_affected['aadhaar_number']}','{$row_affected['salary']}','{$row_affected['room_id']}','{$row_affected['role']}')");

        // $outing_record = mysqli_query($conn, "select * FROM employee_outing WHERE emp_code='$emp_code'");
        // if (mysqli_num_rows($outing_record) > 0) {
        //     while ($record = mysqli_fetch_array($outing_record)) {
        //         mysqli_query($conn, "insert into change_tracking_employee_outing(user,type,emp_code, approval,outing_date,arrival_date,category)
        //         values ('{$_SESSION['user']}','Delete','{$record['emp_code']}', '{$record['approval']}','{$record['outing_date']}','{$record['arrival_date']}','{$record['category']}')");
        //     }
        //     mysqli_query($conn, "DELETE FROM employee_outing WHERE emp_code='$emp_code'");
        // }

        // $vaccination_record = mysqli_query($conn, "select * FROM vaccination WHERE emp_code='$emp_code'");
        // if (mysqli_num_rows($vaccination_record) > 0) {
        //     while ($record = mysqli_fetch_array($vaccination_record)) {
        //         mysqli_query($conn, "insert into change_tracking_vaccination (user,type,vaccination_id,emp_id,emp_code,category_id,date_of_administration,location)
        //         values ('{$_SESSION['user']}','Delete','{$record['vaccination_id']}', '{$record['emp_id']}', '{$record['emp_code']}', '{$record['category_id']}', '{$record['date_of_administration']}', '{$record['location']}')");
        //     }
        //     mysqli_query($conn, "DELETE FROM vaccination WHERE emp_code='$emp_code'");
        // }

        // $visitor_record=mysqli_query($conn,"SELECT * FROM visitor_log join employee on employee.emp_id=visitor.security_emp_id WHERE employee.emp_code='$emp_code'");
        // if (mysqli_num_rows($vaccination_record) > 0) {
        //     while ($record = mysqli_fetch_array($visitor_record)) {
        //         mysqli_query($conn, "insert into change_tracking_visitor_log(user,type,log_id,acc_code,emp_id,security_emp_id,visitor_name,vehicle_no,visit_type,check_in,check_out,purpose,phone_no)
        //         values ('{$_SESSION['user']}','Delete','{$record['id']}', '{$record['acc_code']}','{$record['emp_id']}','{$record['security_emp_id']}','{$record['visitor_name']}','{$record['vehicle_no']}',
        //         '{$record['type']}','{$record['check_in']}','{$record['check_out']}','{$record['purpose']}','{$record['phone_no']}')");
        //         mysqli_query($conn, "DELETE FROM visitor_log WHERE security_emp_id={$record['security_emp_id']}");
        //     }
        // }
    }
    $new_room_occ = 0;
    // echo $new_room_occ;
    $sql1 = mysqli_query($conn, "SELECT * FROM rooms JOIN employee ON rooms.id = employee.room_id WHERE employee.emp_code='$emp_code'");
    $row1 = mysqli_fetch_array($sql1);
    $curr_room_occ = $row1['current_room_occupancy'];
    $room_id = $row1['id'];
    // echo $curr_room_occ;
    $new_room_occ = $curr_room_occ - 1;
    // echo $new_room_occ;
    mysqli_query($conn, "UPDATE rooms SET current_room_occupancy='$new_room_occ' WHERE id='$room_id'");
    mysqli_query($conn, "DELETE FROM employee WHERE emp_code='$emp_code'");
    mysqli_query($conn, "UPDATE rooms SET status = '' WHERE id='$room_id'");
    $_SESSION['message'] = "Employee Deleted!";
    header('location: ../views/hrm/employee_table.php');
}
