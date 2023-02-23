<?php
include('../../controllers/includes/common.php');
$output = '';
if(isset($_POST["excel"]))
{   
    $sql =$_POST["excel"];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
            <tr>
            <th>Accomodation Code</th>
            <th>Accomodation Name</th>
            <th>Building Status</th>
            <th>Location</th>
            <th>Gender</th>
            <th>Total Capacity</th>
            <th>Number of Rooms</th>
            <th>Warden</th>
            <th>Owner</th>
            <th>Remark</th>
            </tr>
            ';
        while($row=mysqli_fetch_array($result))
        {    
            $employeecode = $row['warden_emp_code'];
            $queryEmployeeName = mysqli_query($conn, "SELECT * FROM employee WHERE emp_code='$employeecode'");
            $EmployeeName_row = mysqli_fetch_assoc($queryEmployeeName);
            $output .= '
                <tr>
                <td>' .$row['acc_code']. '</td>
                <td>' .$row['acc_name']. '</td>
                <td>' .$row['bldg_status']. '</td>
                <td>' .$row['location']. '</td>
                <td>' .$row['gender']. '</td>
                <td>' .$row['tot_capacity']. '</td>
                <td>' .$row['no_of_rooms']. '</td>
                <td>' .$EmployeeName_row['fname']. " " . $EmployeeName_row['lname'].'</td>
                <td>'.$row['owner']. '</td>
                <td>'.$row['remark']. '</td>
                ';
        }
        $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Accomodation.xls");
        echo $output;
    }
    else{
        echo "Table is empty";
    }

}
?>