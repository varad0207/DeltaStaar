<?php
$conn = mysqli_connect("localhost","root","","deltastaar-final") or die($conn);
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// EMPLOYEE EXPORT
if(isset($_POST['emp_export']))
{
    // $sql = "SELECT * from employee JOIN employee_designation on employee_designation.id = employee.designation join employee_dept on employee.department=employee_dept.dept_id where 1=1 ";
    $sql = $_POST['emp_export'];
    echo $sql;
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','EMPLOYEE CODE');
    $sheet->setCellValue('B1','EMPLOYEE NAME');
    $sheet->setCellValue('C1','EMPLOYEE DATE OF BIRTH');
    $sheet->setCellValue('D1','EMPLOYEE CONTACT');
    $sheet->setCellValue('E1','EMPLOYEE ADDRESS');
    $sheet->setCellValue('F1','EMPLOYEE STATE');
    $sheet->setCellValue('G1','EMPLOYEE COUNTRY');
    $sheet->setCellValue('H1','EMPLOYEE EMAIL');
    $sheet->setCellValue('I1','EMPLOYEE DEPARTMENT');
    $sheet->setCellValue('J1','EMPLOYEE DESIGNATION');
    $sheet->setCellValue('K1','EMPLOYEE BLOOD GROUP');
    $sheet->setCellValue('L1','EMPLOYEE JOINING DATE');
    $sheet->setCellValue('M1','EMPLOYEE AADHAR NUMBER');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount,$row['emp_code']);
        $sheet->setCellValue('B'.$rowcount,$row['fname']);
        $sheet->setCellValue('C'.$rowcount,$row['dob']);
        $sheet->setCellValue('D'.$rowcount,$row['contact']);
        $sheet->setCellValue('E'.$rowcount,$row['address']);
        $sheet->setCellValue('F'.$rowcount,$row['state']);
        $sheet->setCellValue('G'.$rowcount,$row['country']);
        $sheet->setCellValue('H'.$rowcount,$row['email']);
        $sheet->setCellValue('I'.$rowcount,$row['dept_name']);
        $sheet->setCellValue('J'.$rowcount,$row['designation']);
        $sheet->setCellValue('K'.$rowcount,$row['blood_group']);
        $sheet->setCellValue('L'.$rowcount,$row['joining_date']);
        $sheet->setCellValue('M'.$rowcount,$row['aadhaar_number']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Employee_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

// VACCINATION EXPORT
if(isset($_POST['vaccination_export']))
{
    echo "VACCINATION EXPORT";
    $sql = "select last_dose.emp_id emp_id, employee.emp_code emp_code,vaccination_category.category_name category_name,last_dose.date_of_administration date_of_administration,last_dose.category_id category_id,last_dose.vaccination_id vaccination_id,last_dose.location location,last_dose.date_of_next_dose date_of_next_dose from employee join last_dose on employee.emp_id=last_dose.emp_id join vaccination_category on vaccination_category.category_id=last_dose.category_id where 1=1";
    $sql = $_POST['vaccination_export'];
    echo $sql;
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','EMPLOYEE CODE');
    $sheet->setCellValue('B1','CATEGORY NAME');
    $sheet->setCellValue('C1','DATE OF ADMINISTRATION');
    $sheet->setCellValue('D1','LOCATION');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount,$row['emp_code']);
        $sheet->setCellValue('B'.$rowcount,$row['category_name']);
        $sheet->setCellValue('C'.$rowcount,$row['date_of_administration']);
        $sheet->setCellValue('D'.$rowcount,$row['location']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Vaccination_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
    
}

// ACCOMODATION EXPORT
if(isset($_POST['acc_export']))
{
    echo "ACCOMODATION EXPORT";
    $sql = "SELECT * FROM accomodation t1 JOIN employee t3 ON t1.warden_emp_code=t3.emp_code WHERE 1=1";
    echo $sql;
    $sql = $_POST['acc_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','ACCOMODATION CODE');
    $sheet->setCellValue('B1','ACCOMODATION NAME');
    $sheet->setCellValue('C1','ACCOMODATION STATUS');
    $sheet->setCellValue('D1','ACCOMODATION GENDER');
    $sheet->setCellValue('E1','TOTAL CAPACITY');
    $sheet->setCellValue('F1','NUMBER OF ROOMS');
    $sheet->setCellValue('G1','OCCUPIED ROOMS');
    $sheet->setCellValue('H1','AVAILABLE ROOMS');
    $sheet->setCellValue('I1','WARDEN EMP CODE');
    $sheet->setCellValue('J1','OWNER');
    $sheet->setCellValue('K1','REMARKS');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount,$row['acc_code']);
        $sheet->setCellValue('B'.$rowcount,$row['acc_name']);
        $sheet->setCellValue('C'.$rowcount,$row['bldg_status']);
        $sheet->setCellValue('D'.$rowcount,$row['gender']);
        $sheet->setCellValue('E'.$rowcount,$row['tot_capacity']);
        $sheet->setCellValue('F'.$rowcount,$row['no_of_rooms']);
        $sheet->setCellValue('G'.$rowcount,$row['occupied_rooms']);
        $sheet->setCellValue('H'.$rowcount,$row['available_rooms']);
        $sheet->setCellValue('I'.$rowcount,$row['warden_emp_code']);
        $sheet->setCellValue('J'.$rowcount,$row['owner']);
        $sheet->setCellValue('K'.$rowcount,$row['remark']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Accomodation_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

// ROOM EXPORT
if(isset($_POST['room_export']))
{
    echo "ROOM EXPORT";
    $sql = "SELECT * FROM rooms JOIN accomodation ON rooms.acc_id = accomodation.acc_id where 1=1";
    echo $sql;
    $sql = $_POST['room_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','ROOM NUMBER');
    $sheet->setCellValue('B1','ROOM CAPACITY');
    $sheet->setCellValue('C1','ROOM STATUS');
    $sheet->setCellValue('D1','ROOM OCCUPANCY');
    $sheet->setCellValue('E1','ACCOMODATION NAME');
    $sheet->setCellValue('F1','GENDER');

    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount,$row['room_no']);
        $sheet->setCellValue('B'.$rowcount,$row['room_capacity']);
        $sheet->setCellValue('C'.$rowcount,$row['status']);
        $sheet->setCellValue('D'.$rowcount,$row['current_room_occupancy']);
        $sheet->setCellValue('E'.$rowcount,$row['acc_name']);
        $sheet->setCellValue('F'.$rowcount,$row['gender']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Rooms_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

// COMPLAINT EXPORT
if(isset($_POST['complaint_export']))
{
    echo "COMPLAINT EXPORT";
    $sql = "SELECT * FROM complaint_type join complaints ON type=type_id join accomodation USING(acc_code) where accomodation.warden_emp_code=$empc and 1=1 ";
    echo $sql;
    $sql = $_POST['complaint_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','COMPLAINT ID ');
    $sheet->setCellValue('B1','RAISED BY');
    $sheet->setCellValue('C1','ACCOMODATION NAME');
    $sheet->setCellValue('D1','RAISE TIME STAMP');
    $sheet->setCellValue('E1','COMPLAINT TYPE');
    $sheet->setCellValue('F1','EMPLOYEE DESCRIPTION');
    
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount,$row['id']);
        $sheet->setCellValue('B'.$rowcount,$row['raise_timestamp']);
        $sheet->setCellValue('C'.$rowcount,$row['acc_name']);
        $sheet->setCellValue('D'.$rowcount,$row['raise_timestamp']);
        $sheet->setCellValue('E'.$rowcount,$row['complaint_type']);
        $sheet->setCellValue('F'.$rowcount,$row['description']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Complaints_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

// OUTING EXPORT
if(isset($_POST['outing_export']))
{
    $sql = $_POST['outing_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','EMPLOYEE NAME');
    $sheet->setCellValue('B1','OUTING DATE');
    $sheet->setCellValue('C1','ARRIVAL DATE');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount, $row['fname']);
        $sheet->setCellValue('B'.$rowcount, $row['outing_date']);
        $sheet->setCellValue('C'.$rowcount, $row['arrival_date']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Outing_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

//TANKERS EXPORT
if(isset($_POST['tanker_export']))
{
    $sql = $_POST['tanker_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','VENDOR NAME');
    $sheet->setCellValue('B1','COMPANY NAME');
    $sheet->setCellValue('C1','NUMBER');
    $sheet->setCellValue('D1','ADDRESS');
    $sheet->setCellValue('E1','PRICE');
    $sheet->setCellValue('F1','BILL NUMBER');
    $sheet->setCellValue('G1','AMOUNT');
    $sheet->setCellValue('H1','DATE');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount, $row['vname']);
        $sheet->setCellValue('B'.$rowcount, $row['company_name']);
        $sheet->setCellValue('C'.$rowcount, $row['number']);
        $sheet->setCellValue('D'.$rowcount, $row['address']);
        $sheet->setCellValue('E'.$rowcount, $row['price']);
        $sheet->setCellValue('F'.$rowcount, $row['bill_no']);
        $sheet->setCellValue('G'.$rowcount, $row['amount']);
        $sheet->setCellValue('H'.$rowcount, $row['timestamp']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Tanker_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
}

//VISITOR LOG EXPORT
if(isset($_POST['visitor_log_export']))
{
    $sql = $_POST['visitor_log_export'];
    $result = mysqli_query($conn,$sql);
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A1','ACCOMODATION CODE');
    $sheet->setCellValue('B1','VISITOR NAME');
    $sheet->setCellValue('C1','VEHICLE NUMBER');
    $sheet->setCellValue('D1','TYPE OF VISITOR');
    $sheet->setCellValue('E1','CHECK-IN TIME');
    $sheet->setCellValue('F1','CHECK-OUT TIME');
    $sheet->setCellValue('G1','PURPOSE OF VISIT');
    $sheet->setCellValue('H1','CONTACT');
    $rowcount=2;
    foreach($result as $row)
    {
        $sheet->setCellValue('A'.$rowcount, $row['acc_code']);
        $sheet->setCellValue('B'.$rowcount, $row['visitor_name']);
        $sheet->setCellValue('C'.$rowcount, $row['vechicle_no']);
        $sheet->setCellValue('D'.$rowcount, $row['type']);
        $sheet->setCellValue('E'.$rowcount, $row['check_in']);
        $sheet->setCellValue('F'.$rowcount, $row['check_out']);
        $sheet->setCellValue('G'.$rowcount, $row['purpose']);
        $sheet->setCellValue('H'.$rowcount, $row['phone_no']);
        $rowcount++;
    }
    $writer = new Xlsx($spreadsheet);
    $filename = "temp/Visitor_log_table";
    $filename .=date("Y-m-d").'.xlsx';
    $tempFilePath = $filename;
    mysqli_query($conn,"INSERT INTO `tmp_files`(`file_path`) VALUES ('$filename')");
    $writer->save($tempFilePath);
    header("location:$filename");
    
}
?>