<?php
$conn = mysqli_connect('localhost', 'root', '', 'deltastaar');
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
            $emp_code = $row['0'];
            $fname = $row['1'];
            $mname = $row['2'];
            $lname = $row['3'];
            $designation = $row['4'];
            $dob = $row['5'];
            $contact = $row['6'];
            $address = $row['7'];
            $state = $row['8'];
            $country = $row['9'];
            $pincode = $row['10'];
            $email = $row['11'];
            $department = $row['12'];
            $blood_group = $row['13'];
            $joining_date = $row['14'];
            $aadhar_number = $row['15'];
            $salary = $row['16'];
            // insertion code
            mysqli_query($conn, "INSERT INTO `employee`(`emp_code`, `fname`, `mname`, `lname`, `designation`, `dob`, `contact`, `address`, `state`, `country`, `pincode`, `email`, `department`, `blood_group`, `joining_date`, `aadhaar_number`, `salary`) VALUES ('$emp_code','$fname','$mname','$lname','$designation','$dob','$contact','$address','$state','$country','$pincode','$email','$department','$blood_group','$joining_date','$aadhar_number','$salary')");
            $msg = true;
        }
        if (isset($msg)) {
            $_SESSION['message'] = "Succesfully Imported";
            header('Location:excel_import.php');
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
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

        foreach ($data as $row) 
        {
            $acc_code=$row['0'];
            $acc_name=$row['1'];
            $bldg_status=$row['2'];
            $location=$row['3'];
            $gender=$row['4'];
            $tot_capacity=$row['5'];
            $no_of_rooms=$row['6'];
            $owner=$row['7'];
            
            mysqli_query($conn,"INSERT INTO `accomodation`(`acc_code`, `acc_name`, `bldg_status`, `location`, `gender`, `tot_capacity`, `no_of_rooms`,`owner`) VALUES ('$acc_code','$acc_name','$bldg_status','$location','$gender','$tot_capacity','$no_of_rooms','$owner')");
            // insertion code
            $msg = true;
        }
        if (isset($msg)) {
            // $_SESSION['message'] = "Succesfully Imported";
            // header('Location:excel_import.php');
            // exit(0);
        } else {
            // $_SESSION['message'] = " ! Succesfully Imported";
            // header('Location:excel_import.php');
            // exit(0);
        }
    } else {
        // $_SESSION['message'] = "Invalid File";
        // header('Location:excel_import.php');
    }
}

//VACCINATION IMPORT
if (isset($_POST['vaccination'])) {
    $fileName = $_FILES['vaccination_import']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

    $allowed_ext = ['xls', 'csv', 'xlsx'];
    if (in_array($file_ext, $allowed_ext)) {
        $inputFileName = $_FILES['vaccination_import']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
        $data = $spreadsheet->getActiveSheet()->toArray();

        foreach ($data as $row) 
        {
            $emp_id=$row[0];
            $emp_code=$row[1];
            $category_id=$row[2];
            $date_of_administration=$row[3];
            $location=$row[4];

            echo $emp_id;
            echo $emp_code;
            echo $category_id;
            echo $date_of_administration;
            echo $location;

            mysqli_query($conn,"INSERT INTO `vaccination`(`emp_id`, `emp_code`, `category_id`, `date_of_administration`, `location`) VALUES ('$emp_id','$emp_code','$category_id','$date_of_administration','$location')");
        }
        if (isset($msg)) {
            $_SESSION['message'] = "Succesfully Imported";

            echo $_SESSION['message'];
            header('Location:excel_import.php');
            exit(0);
        } else {
            $_SESSION['message'] = " ! Succesfully Imported";
            header('Location:excel_import.php');
            exit(0);
        }
    } else {
        $_SESSION['message'] = "Invalid File";
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

        foreach ($data as $row) 
        {
            $acc_id=$row['0'];
            $room_no=$row['1'];
            $room_capacity=$row['2'];
            
            
            // Insert Query
            mysqli_query($conn,"INSERT INTO `rooms`(`acc_id`,`room_no`,`room_capacity`) VALUES ('$acc_id','$room_no','$room_capacity')");
            $msg = true;
        }
        if (isset($msg)) {
            // $_SESSION['message'] = "Succesfully Imported";
            // header('Location:excel_import.php');
            // exit(0);
        } else {
            // $_SESSION['message'] = " ! Succesfully Imported";
            // header('Location:excel_import.php');
            // exit(0);
        }
    } else {
        // $_SESSION['message'] = "Invalid File";
        // header('Location:excel_import.php');
    }
}
