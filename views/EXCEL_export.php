<?php
//EXMPLOYEE TABLE EXPORT
include('../controllers/includes/common.php');
$output = '';
if(isset($_POST["emp_export"]))
{   
    $sql =$_POST["emp_export"];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
            <tr>
            <th>Employee Code</th>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Designation</th>
            <th>Date of birth</th>
            <th>Conatct</th>
            <th>Address</th>
            <th>State</th>
            <th>Country</th>
            <th>Pincode</th>
            <th>Email</th>
            <th>Department</th>
            <th>Blood group</th>
            <th>Joining Date</th>
            <th>Country</th>
            <th>Aadhar Number</th>
            <th>Salary</th>
            <th>Room id</th>
            </tr>
            ';
        while($row=mysqli_fetch_array($result))
        {    
            $output .= '
                <tr>
                <td>' .$row['emp_code']. '</td>
                <td>' .$row['fname']. '</td>
                <td>' .$row['mname']. '</td>
                <td>' .$row['lname']. '</td>
                <td>' .$row['designation']. '</td>
                <td>' .$row['dob']. '</td>
                <td>' .$row['contact']. '</td>
                <td>' .$row['address']. '</td>
                <td>' .$row['state']. '</td>
                <td>' .$row['country']. '</td>
                <td>' .$row['pincode']. '</td>
                <td>' .$row['email']. '</td>
                <td>' .$row['contact']. '</td>
                <td>' .$row['dept_name']. '</td>
                <td>' .$row['blood_group']. '</td>
                <td>' .$row['joining_date']. '</td>
                <td>' .$row['aadhaar_number']. '</td>
                <td>' .$row['salary']. '</td>
                <td>' .$row['room_id']. '</td>
                </tr>
                ';
        }
        $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Employee_detail.xls");
        echo $output;
    }
    else
    {
        echo "Table is empty";
    }

}
//VACCINATION TABLE EXPORT
if(isset($_POST['vaccination_export']))
{
    $sql=$_POST['vaccination_export'];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
            <tr>
            <th>Employee Code</th>
            <th>Category</th>
            <th>Date of administration</th>
            <th>Location</th>
            <th>Date of next dose</th>
            </tr>
            ';
        while($row=mysqli_fetch_array($result))
        {  
            $output .= '
                <tr>
                <td>' .$row['emp_code']. '</td>
                <td>' .$row['category_name']. '</td>
                <td>' .$row['date_of_administration']. '</td>
                <td>' .$row['location']. '</td>
                <td>' .$row['date_of_next_dose']. '</td>
                </tr>
                ';
        }
    }
    else
    {
        echo "Table is empty";
    }
    $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Vaccination_detail.xls");
        echo $output;
}

//COMPLAINT TABLE EXPORTING
if(isset($_POST['complaint_export']))
{
    $sql=$_POST['complaint_export'];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
        <tr>
            <th>Sr.No</th>
            <th>Raised Time</th>
            <th>Complaint Category</th>
            <th>Description</th>
            <th>Status</th>
            <th>Technician Closure Time</th>
            <th>Security Closure Time</th>
            <th>Warden Closure Time</th>
            <th>Remarks</th>
            <th>Employee Name</th>
            <th>Employee Code</th>
            <th>Accomodation Name</th>
            <th>Room Number</th>
            </th>
        </tr>
        ';
        while($row=mysqli_fetch_array($result))
        {
            $status="";
            if (isset($row['tech_closure_timestamp']) && isset($row     ['sec_closure_timestamp']) && isset($r['warden_closure_timestamp'])) 
            {
                $status="Completed";
            } 
            else if (isset($row['tech_pending_timestamp']) && !isset($row       ['tech_closure_timestamp']) && !isset($r['sec_closure_timestamp']) &&     !isset($row['warden_closure_timestamp'])) 
            {
                $status="Waiting for material";
            } 
            else if (!isset($row['tech_closure_timestamp']) && !isset($row      ['sec_closure_timestamp']) && !isset($r['warden_closure_timestamp'])) 
            {
                $status="Not Started";
            } 
             else 
            {
            $status="In progres";
            }
            if (isset($row['room_no']) && !empty($row['room_no'])) 
            {
                $room_no= $row['room_no'];
            } 
            else 
            {
                $room_no= $row['room_no'] = 'N/A';
            }
            $output .= '
                <tr>
                <td>' .$row['id']. '</td>
                <td>' .$row['raise_timestamp']. '</td>
                <td>' .$row['type']. '</td>
                <td>' .$row['description']. '</td>
                <td>' .$status.'</td>
                <td>' .$row['tech_closure_timestamp']. '</td>
                <td>' .$row['sec_closure_timestamp']. '</td>
                <td>' .$row['warden_closure_timestamp']. '</td>
                <td>' .$row['remarks']. '</td>
                <td>' .$row['fname']. '</td>
                <td>' .$row['emp_code']. '</td>
                <td>' .$row['acc_name']. '</td>
                <td>' .$room_no. '</td>
                </tr>
                ';
        }
    
    }
    else
    {
        echo "Table is empty";
    }
    $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Complaints_detail.xls");
        echo $output;
}

//ROOM EXPORT
if (isset($_POST['room_export'])) 
{
    $sql=$_POST['room_export'];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
        <tr>
        <th>
        <th>Accomodation Name</th>
        <th>Room Number</th>
        <th>Room Capacity</th>
        <th>Status</th>
        <th>Current room occupancy</th>
        </th>
        </tr>
        ';
        while($row=mysqli_fetch_array($result))
        {
            $output .= '
            <tr>
            <td>' .$row['acc_name']. '</td>
            <td>' .$row['room_no']. '</td>
            <td>' .$row['room_capacity']. '</td>
            <td>' .$row['status']. '</td>
            <td>' .$row['current_room_occupancy'].'</td>
            </tr>
            ';
        }
    }
    else
    {
        echo "Table is empty";
    }
    $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Rooms_detail.xls");
        echo $output;
}

//OUTING EXPORT
if(isset($_POST['outing_export']))
{
    $sql=$_POST['outing_export'];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
        <tr>
        <th>
        <th>Employee Name</th>
        <th>Outing Date</th>
        <th>Arrival Date</th>
        <th>Purpose of Outing</th>
        </th>
        </tr>
        ';
        while($row=mysqli_fetch_array($result))
        {
            $empid = $row['emp_id'];
            $queryEmpID = mysqli_query($conn, "SELECT * FROM employee where emp_id='$empid'");
            $EmpID_row = mysqli_fetch_assoc($queryEmpID);
            $fname=$EmpID_row['fname'];
            $lname=$EmpID_row['lname'];
            $empname=$fname." ".$lname;
            $output .= '
            <tr>
            <td>' .$empname. '</td>
            <td>' .$row['outing_date']. '</td>
            <td>' .$row['arrival_date']. '</td>
            <td>' .$row['category']. '</td>
            </tr>
            ';
        }
    }
    else
    {
        echo "Table is empty";
    }
    $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Outing_detail.xls");
        echo $output;
}

//TANKER EXPORT
if(isset($_POST['tanker_export']))
{
    $sql=$_POST['tanker_export'];
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result)>0) 
    {
        $output='<table class="table" bordered="1">
        <tr>
        <th>
        <th>Bill Number</th>
        <th>Quality</th>
        <th>Quantity</th>
        <th>Accomodation</th>
        <th>Vendor</th>
        <th>Date</th>
        <th>Time</th>
        </th>
        </tr>
        ';
        while($row=mysqli_fetch_array($result))
        {
            $vendor_id = $row['vendor_id'];
            $queryvendorId = mysqli_query($conn, "SELECT * FROM tanker_vendors where id='$vendor_id'");
            $vendor = mysqli_fetch_assoc($queryvendorId);
            $accid = $row['acc_id'];
            $queryAccId = mysqli_query($conn, "SELECT * FROM accomodation WHERE acc_id = '$accid'");
            $acc = mysqli_fetch_assoc($queryAccId);
            $timestamp = strtotime($row['timestamp']);  
            $date = date('d-m-Y', $timestamp);
            $time = date('H:i:s', $timestamp);
            $output .= '
            <tr>
            <td>' .$row['bill_no']. '</td>
            <td>' .$row['quality_check']. '</td>
            <td>' .$row['qty']. '</td>
            <td>' .$acc['acc_name']. '</td>
            <td>' .$vendor['vname']. '</td>
            <td>' .$date. '</td>
            <td>' .$time. '</td>
            </tr>
            ';
        }
    }
    else
    {
        echo "Table is empty";
    }
    $output .= "</table>";
        header("Content-Type: application/xls");
        header("Content-Disposition: attachment; filename=Tanker_detail.xls");
        echo $output;

}

                        
                            
                        
?>