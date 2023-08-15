<?php
// // include '../../controllers/includes/common.php';
// require '../../../frontend/phpimport/vendor/autoload.php';
// use PhpOffice\PhpSpreadsheet\Spreadsheet;
// use PhpOffice\PhpSpreadsheet\Writer\Xls;
// use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// // if (isset($_POST['excel'])) {
// //     $ext = "xlsx";
// //     $fileName = "Accommodation-Details" . time();
// //     $query = $_POST['excel'];
// //     $query_run = mysqli_query($conn, $query);

// //     if (mysqli_num_rows($query_run) > 0) {
// //         $spreadsheet = new Spreadsheet();
// //         $sheet = $spreadsheet->getActiveSheet();
// //         $sheet->setCellValue('A1', 'Sr No');
// //         $sheet->setCellValue('B1', 'Accommodation Name');
// //         $sheet->setCellValue('C1', 'Status');
// //         $sheet->setCellValue('D1', 'Capacity');
// //         $sheet->setCellValue('E1', 'Occupied');
// //         $sheet->setCellValue('F1', 'Available');
// //         $sheet->setCellValue('G1', 'Gender');
// //         $sheet->setCellValue('H1', 'Remark');

// //         $rowCount = 2;
// //         $srno = 1;
// //         while ($data = mysqli_fetch_assoc($query_run)) {
// //             $sheet->setCellValue('A' . $rowCount, $srno);
// //             $sheet->setCellValue('B' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['acc_name'])));
// //             $sheet->setCellValue('C' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['bldg_status'])));
// //             $sheet->setCellValue('D' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['tot_capacity'])));
// //             $sheet->setCellValue('E' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['occupied_rooms'])));
// //             $sheet->setCellValue('F' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['available_rooms'])));
// //             $sheet->setCellValue('G' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['gender'])));
// //             $sheet->setCellValue('H' . $rowCount, iconv('UTF-8', 'ISO-8859-1', strip_tags($data['remark'])));
// //             $rowCount++;
// //             $srno++;
// //         }

// //         $writer = new Xls($spreadsheet);
// //         $final_fileName = $fileName . '.xlsx';

// //         header("Content-Type: application/xls");
// //         header("Content-Disposition: attachment; filename=Accomo_log.xls");
// //         $writer->save('php://output');

// //         // header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
// //         // header('Content-Disposition: attachment; filename="' . urlencode($final_fileName) . '"');
        
// //     } else {
// //         echo "Error encountered...";
// //     }
// // }


//     // $spreadsheet = new Spreadsheet();
//     // $sheet = $spreadsheet->getActiveSheet();
//     // $writer = new Xlsx($spreadsheet);
//     // $set_header = 1;
//     // $line_number = 1;
//     // $query = $_POST['excel'];
//     // $query_run = mysqli_query($conn, $query);
//     // while($row = mysqli_fetch_array($query_run))
//     // {
//     //     if($set_header==1)
//     //     {
//     //         $sheet->setCellValue('A'.$line_number,"SR.NO");
//     //         $sheet->setCellValue('B'.$line_number,"Accommodation Name");
//     //         $sheet->setCellValue('C'.$line_number,"Status");
//     //         $sheet->setCellValue('D'.$line_number,"Capacity");
//     //         $sheet->setCellValue('E'.$line_number,"Occupied");
//     //         $sheet->setCellValue('F'.$line_number,"Available");
//     //         $sheet->setCellValue('G'.$line_number,"Gender'");
//     //         $sheet->setCellValue('H'.$line_number,"Remark");
        
//     //     }
//     //     $set_header=0;
//     // }
//     // header("Content-Type: application/xlsx");
//     // header("Content-Disposition: attachment; filename=Accomo_log.xlsx");
//     // $writer->save('php://output');

//     // Example to export an array to CSV

// $query = "";
// $sql = "SELECT \n"

//     . "    e.empcode, \n"

//     . "    e.empname, \n"

//     . "    e.acc_name, \n"

//     . "    COUNT(*) AS common_count\n"

//     . "FROM \n"

//     . "    employee e\n"

//     . "INNER JOIN \n"

//     . "    vaccination v ON e.empcode = v.empcode AND e.empname = v.empname\n"

//     . "GROUP BY \n"

//     . "    e.empcode, e.empname, e.acc_name;";
// $conn=mysqli_connect("localhost","root","","testing db")or die(mysqli_error($conn));
// $query_run = mysqli_query($conn, $sql);
// $accomodation_details = array();
// $i=1;
// $firstrow=array("SR.NO","EMPLOYEE CODE","EMPLOYEE NAME","ACCOMODATION NAME");
// array_push($accomodation_details, $firstrow);
// while($row = mysqli_fetch_array($query_run))
// {
//     $sr_no = $i;
//     // $acc_name = $row['acc_name'];
//     // $building_status = $row['bldg_status'];
//     // $total_capacity = $row['tot_capacity'];
//     // $occupied_rooms = $row['occupied_rooms'];
//     // $available_rooms = $row['available_rooms'];
//     // $gender = $row['gender'];
//     // $remark = $row['remark'];
//     // $detail=array($sr_no, $acc_name,$building_status,$total_capacity,$occupied_rooms,$available_rooms,$gender,$remark);
//     // array_push($accomodation_details, $detail);
//     $empcode = $row['empcode'];
//     $empname = $row['empname'];
//     $acc_name = $row['acc_name'];
//     $detail = array($i,$empcode,$empname,$acc_name);
//     array_push($accomodation_details, $detail);
//     $i++;
// }
// // die();
// // $data = array(
// //     array('Name', 'Age', 'Email'),
// //     array('John Doe', 30, 'john@example.com'),
// //     array('Jane Smith', 25, 'jane@example.com')
// // );

// $fp = fopen('php://output', 'w');
// foreach ($accomodation_details as $row) {
//     fputcsv($fp, $row);
// }
// fclose($fp);

// header('Content-Type: text/csv');
// header('Content-Disposition: attachment; filename="Accomodation_details.csv"');



require '../../../frontend/phpimport/vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$sql = "SELECT \n"

    . "    e.empcode, \n"

    . "    e.empname, \n"

    . "    e.acc_name, \n"

    . "    COUNT(v.empcode) AS vaccination_count\n"

    . "FROM \n"

    . "    employee e\n"

    . "LEFT JOIN \n"

    . "    vaccination v ON e.empcode = v.empcode AND e.empname = v.empname\n"

    . "WHERE \n"

    . "    v.empcode IS NULL\n"

    . "GROUP BY \n"

    . "    e.empcode, e.empname, e.acc_name;";

$conn = mysqli_connect("localhost", "root", "", "testing db") or die(mysqli_error($conn));
$query_run = mysqli_query($conn, $sql);
$accomodation_details = array();
$i = 1;
// $firstrow = array("SR.NO", "EMPLOYEE CODE", "EMPLOYEE NAME", "ACCOMODATION NAME");
// array_push($accomodation_details, $firstrow);

while ($row = mysqli_fetch_array($query_run)) {
    $empcode = $row['empcode'];
    $empname = $row['empname'];
    $acc_name = $row['acc_name'];
    $detail = array($i, $empcode, $empname, $acc_name);
    array_push($accomodation_details, $detail);
    

    echo $i.' '.$empcode.' '.$empname.' '.$acc_name;
    ?>
    <br>
    <?php
    $i++;
}

// $fp = fopen('php://output', 'w');
// foreach ($accomodation_details as $row) {
//     fputcsv($fp, $row);
// }
// fclose($fp);

// header('Content-Type: text/csv');
// header('Content-Disposition: attachment; filename="Accomodation_details.csv"');
?>


