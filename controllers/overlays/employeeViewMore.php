<?php require "../../controllers/includes/common.php";
    // die();

if(isset($_REQUEST['employeecode'])){

    $employeecode = $_REQUEST['employeecode'];
    if ($employeecode != "") {
        $row12 = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM employee JOIN employee_designation ON employee_designation.id = employee.designation AND employee.emp_code='$employeecode'"));
    }
}

 ?>
 <style>
    @media only screen and (max-width: 695px) {
        .overlay-content{
            overflow-y: auto;
            height:475px;
        }
        .wrap{
            flex-direction: column;
        }

    }
</style>

    <!-- overlay code start -->
        <div class="overlay" id="overlay" style="z-index:9999;"> 
            <div class="overlay-window" style="width: 80vw;max-width:100vw;height:80vh; min-height:475px;min-width:350px;">
                <div class="overlay-window-titlebar">
                    <span class="overlay-title">Employee Details</span>
                    <button id="close" class="close material-icons" onclick="document.querySelectorAll('.overlay').forEach(a=>a.style.display = 'none');">close</button>
                </div>
                <div class="overlay-content" style="color:black;text-align:center;">
                    <div class="wrap" style="display:flex;justify-content:space-around;">
                        <div class="left" style="display:block;text-align: left;">
                            <p class="card-text">Employee code :<b><?php echo $row12['emp_code']; ?></b></p>
                            <p class="card-text">Department : <b><?php echo $row12['department']; ?></b></p>

                            <p class="card-text">Designation : <b><?php echo $row12['designation']; ?></b></p>
                            <p class="card-text">Salary : <b><?php echo $row12['salary']; ?></b></p>                        
                            <p class="card-text">Joining Date : <b><?php echo date('d-m-Y', strtotime($row12['joining_date'])); ?></b></p>
                            <p class="card-text">Contact : <b><?php echo $row12['contact']; ?></b></p>
                            <p class="card-text">Email : <b><?php echo $row12['email']; ?></b></p>
                        </div>
                            
                        <div class="right" style="display:block;text-align: left;">
                            <p class="card-text">Employee Name : <b><?php echo $row12['fname'];echo " "; echo $row12['lname']; ?></b></p>
                            <p class="card-text">Address : <b><?php echo $row12['address']; ?></b></p>
                            <p class="card-text">State :  <b><?php echo $row12['state']; ?></b></p>
                            <p class="card-text">Country : <b><?php echo $row12['country']; ?></b></p>
                            <p class="card-text">Pincode : <b><?php echo $row12['pincode']; ?></b></p>
                            <p class="card-text">Date of birth : <b><?php echo date('d-m-Y', strtotime($row12['dob'])); ?></b></p>
                            <p class="card-text">Blood group : <b><?php echo $row12['blood_group']; ?></b></p>
                            <p class="card-text">Aadhar number : <b><?php echo $row12['aadhaar_number']; ?></b></p>
                        </div>
                    </div>
                    <div class="overlay-window-footer" style="display:flex;justify-content:center;margin-top:50px;margin-bottom:10px;">
                        <Button class="btn btn-secondary btn2" onclick="document.querySelectorAll('.overlay').forEach(a=>a.style.display = 'none');">Back</Button>
                    </div>
                </div>
                
            </div>
        </div>
    <!-- overlay end -->
