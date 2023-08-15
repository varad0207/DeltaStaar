<?php
require '../controllers/includes/common.php';
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Settings;
// if(isset($_POST['excel'])) 
// {
//     $fileName=$_FILES['excel_import']['name'];
//     $file_ext=pathinfo($fileName,PATHINFO_EXTENSION);

//     $allowed_ext=['xls','csv','xlsx'];
//     if(in_array($file_ext,$allowed_ext))
//     {
//         $inputFileName = $_FILES['excel_import']['tmp_name'];
//         $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
//         $data=$spreadsheet->getActiveSheet()->toArray();

//         foreach($data as $row)
//         {
//             $emp_id=$row['0'];
//             $role=$row['1'];

//             $tech_query="INSERT INTO technician (emp_id,role) VALUES ('$emp_id','$role')";
//             $result=mysqli_query($conn,$tech_query);
//             $msg=true;
//         }
//         if(isset($msg))
//         {
//              $_SESSION['message']="Succesfully Imported";
//             header('Location:index.php');
//             exit(0);
//         }
//         else{
//              $_SESSION['message']=" ! Succesfully Imported";
//             header('Location:index.php');
//             exit(0);
//         }

//     }
//     else
//     {
//         $_SESSION['message']="Invalid File";
//         header('Location:index.php');
//     }
// }

//EMPLOYEE IMPORT
if (isset($_POST['employee'])) {

    $fileName = $_FILES['employee_import']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);
    echo "Hello";
    $allowed_ext = ['xls', 'csv', 'xlsx'];
    if (in_array($file_ext, $allowed_ext)) {
        $inputFileName = $_FILES['employee_import']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
        $data = $spreadsheet->getActiveSheet()->toArray();

        foreach ($data as $row) {
            $emp_id = $row['0'];
            $emp_code = $row['1'];
            $fname = $row['2'];
            $mname = $row['3'];
            $lname = $row['4'];
            $designation = $row['5'];
            $dob = $row['6'];
            $contact = $row['7'];
            $address = $row['8'];
            $state = $row['9'];
            $country = $row['10'];
            $pincode = $row['11'];
            $email = $row['12'];
            $department = $row['13'];
            $blood_group = $row['14'];
            $joining_date = $row['15'];
            $aadhar_number = $row['16'];
            $salary = $row['17'];
            $room_id = $row['18'];
           
            // FINDING DEPARTMENT ID FROM DEPARTMENT NAME
            $dept_id_fetch = mysqli_query($conn,"SELECT `dept_id` FROM `employee_dept` WHERE `dept_name`='$department'") or die(mysqli_error($conn));
            $r = mysqli_fetch_assoc($dept_id_fetch);
            $dept_id = $r['dept_id'];
            echo $dept_id;
            // FINDING DESIGNATION ID FROM DESIGNATION NAME
            $desig_id_fetch = mysqli_query($conn, "SELECT `id` FROM `employee_designation` WHERE `designation`='$designation';");
            $r = mysqli_fetch_assoc($desig_id_fetch);
            $desig_id = $r['id'];
            echo $desig_id;

            // insertion code
            mysqli_query($conn, "INSERT INTO `employee`(`emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`,`room_id`) VALUES ('$emp_code','$fname','$mname','$lname','$desig_id','$dob','$contact','$address','$state','$country','$pincode','$email','$dept_id','$blood_group','$joining_date','$aadhar_number','$salary','$room_id')") or die(mysqli_error($conn));
            $msg = true;

            echo $emp_id . '      ' . $emp_code . '        ' . $dept_id . '      ' . $desig_id;
        }
        die;
        if (isset($msg)) {
            $_SESSION['message'] = "Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        }
    } else {
        $_SESSION['message'] = "Invalid File";
        header('Location:excel_import.php');
    }
}

//ACCOMODATION IMPORT
if (isset($_POST['accomodation'])) {
    $fileName = $_FILES['accomodation_import']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

    $allowed_ext = ['xls', 'csv', 'xlsx'];
    if (in_array($file_ext, $allowed_ext)) {
        $inputFileName = $_FILES['accomodation_import']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
        $data = $spreadsheet->getActiveSheet()->toArray();
        // Before the loop
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        // Prepare the INSERT statement
        // $insert_stmt = mysqli_prepare($conn, "INSERT INTO `accomodation`(`acc_code`, `acc_name`, `bldg_status`, `location`, `gender`, `tot_capacity`, `no_of_rooms`, `owner`, `remark`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

        // if (!$insert_stmt) {
        //     die("Error in preparing the INSERT statement: " . mysqli_error($conn));
        // }
        foreach ($data as $row) {
            $acc_code = $row['0'];
            $acc_name = $row['1'];
            $bldg_status = $row['2'];
            $location = $row['3'];
            // $gender = $row['4'];
            $gender = ucfirst(strtolower($row['4']));
            $tot_capacity = $row['5'];
            $no_of_rooms = $row['6'];
            $owner = $row['7'];
            $remark = $row['8'];

            $res = mysqli_query($conn, "SELECT `loc_id` FROM `acc_locations` WHERE `location`='$location'");
            $r = mysqli_fetch_assoc($res);
            $location_id = (int)$r['loc_id'];


            $submit = mysqli_query($conn, "insert into accomodation (`acc_code`, `acc_name`, `bldg_status`, `location`, `gender`, `tot_capacity`, `no_of_rooms`, `owner`, `remark`) VALUES ('$acc_code', '$acc_name', '$bldg_status', '$location_id', '$gender', '$tot_capacity', '$no_of_rooms', '$owner', '$remark')");

            // $insert_stmt = mysqli_prepare($conn, "INSERT INTO `accomodation`(`acc_code`, `acc_name`, `bldg_status`, `location`, `gender`, `tot_capacity`, `no_of_rooms`, `owner`, `remark`) VALUES ('$acc_code', '$acc_name', '$bldg_status', '$location', '$gender', '$tot_capacity', '$no_of_rooms', '$owner', '$remark'");


            // Bind the parameters to the prepared statement
            // mysqli_stmt_bind_param($insert_stmt, "sssisiiis", $acc_code, $acc_name, $bldg_status, $location_id, $gender, $tot_capacity, $no_of_rooms, $owner, $remark);

            // Execute the prepared statement
            // $insert_result = mysqli_stmt_execute($insert_stmt);

            if (!$submit) {
                die("Error in insertion: " . mysqli_error($conn));
            } else
                $msg = true;
        }
        // Close the prepared statement
        // mysqli_stmt_close($insert_stmt);

        if (isset($msg)) {
            $_SESSION['message'] = "Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        }
    } else {
        $_SESSION['message'] = "Invalid File";
        unset( $_SESSION['message']);
        header('Location:excel_import.php');
    }
}

//VACCINATION IMPORT
if (isset($_POST['vaccination'])) {
    $fileName = $_FILES['vaccination_import']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

    $allowed_ext = ['xls', 'csv', 'xlsx'];
    if (in_array($file_ext, $allowed_ext)) 
    {
        $inputFileName = $_FILES['vaccination_import']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
        $data = $spreadsheet->getActiveSheet()->toArray();

        foreach ($data as $row) {
            $v_id = $row['0'];
            $emp_id = $row['1'];
            $emp_code = $row['2'];
            $category_id = $row['3'];
            $date_of_administration = $row['4'];
            $location = $row['5'];

            echo $v_id.' ';
            echo $emp_id.' ';
            echo $emp_code.' ';
            echo $category_id.' ';
            echo $date_of_administration.' ';
            echo $location.' ';

            ?>
            <br>
            <?php
            mysqli_query($conn, "INSERT INTO `vaccination`(`vaccination_id`,`emp_id`, `emp_code`, `category_id`, `date_of_administration`, `location`) VALUES ('$v_id','$emp_id','$emp_code','$category_id','$date_of_administration','$location')") or die(mysqli_error($conn));
            $msg=true;
        }
        
        if (isset($msg)) 
        {
            $_SESSION['message'] = "Succesfully Imported";
            echo $_SESSION['message'];
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            exit(0);
        }
    } 
    else {
        $_SESSION['message'] = "Invalid File";
        unset( $_SESSION['message']);
        header('Location:excel_import.php');
    }
}


//ROOMS IMPORT
if (isset($_POST['rooms'])) {
    $fileName = $_FILES['rooms_import']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

    $allowed_ext = ['xls', 'csv', 'xlsx'];
    if (in_array($file_ext, $allowed_ext)) {
        $inputFileName = $_FILES['rooms_import']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
        $data = $spreadsheet->getActiveSheet()->toArray();

        foreach ($data as $row) {
            $acc_id = $row['0'];
            $room_no = $row['1'];
            $room_capacity = $row['2'];


            // Insert Query
            mysqli_query($conn, "INSERT INTO `rooms`(`acc_id`,`room_no`,`room_capacity`) VALUES ('$acc_id','$room_no','$room_capacity')");
            $msg = true;
        }
        if (isset($msg)) {
            $_SESSION['message'] = "Succesfully Imported";
            unset( $_SESSION['message']);
            header('Location:excel_import.php');
            // unset( $_SESSION['message']);
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
            header('Location:excel_import.php');
            // unset( $_SESSION['message']);
            exit(0);
        }
    } else {
        $_SESSION['message'] = "Invalid File";
        unset( $_SESSION['message']);
        header('Location:excel_import.php');
    }
}
