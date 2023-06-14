<div class="portal">

    <div class="charts-container">
       
        <?php       
        include '../charts/accommodationStatus_Bar.php';
        include '../charts/complaintStatus_Pie.php';
        // include '../charts/complaintTypes_Doughnut.php';
        include '../charts/waterTankers_Line.php';

        ?>
         <!-- <div class="chartBox">
            <h4 class="text-center p-2">Accommodation Status</h4>
            <canvas id="myChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Complaint Types</h4>
            <canvas id="myDoughnutChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Complaint Status</h4>
            <canvas id="myPieChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Water Tankers Line</h4>
            <canvas id="myLineChart"></canvas>
        </div>
        
        <div class="chartBox">
            <h4 class="text-center p-2">Nos.of trips by each Vendor</h4>
            <canvas id=""></canvas>
        </div>-->
        
    </div>

    <h1 class="tc f-subheadline lh-title spr">Super Admin Portal</h1>

    <div class="containeer ma4">
        <!-- FIRST ELEMENT -->
        <div class="containeer-items tc">
            <a>
                <img class="rounded-circle" src="../images/emp.png" alt="EMPLOYEE">
                <p class="f4 lh-copy txt"><a href="./hrm/employee_table.php">Employee</a></p>
                <!-- style="pointer-events: none;color:#a0a6ab;" onMouseOver="this.style.color='red'" -->
                <p class="f4 lh-copy txt"><a href="./hrm/vaccination_table.php">Vaccination</a></p>
                <p class="f4 lh-copy txt"><a href="./hrm/roles_table.php">Roles</a></p>
            </a>
        </div>

        <!-- SECOND ELEMENT -->
        <div class="containeer-items tc">
            <a>
                <img class="rounded-circle" src="../images/acc.png" alt="ACCOMODATION">
                <p class="f4 lh-copy txt"><a href="./accomodation/accomodation_table.php">Accommodation</a></p>
                <p class="f4 lh-copy txt"><a href="./accomodation/room_table.php">Rooms</a></p>
            </a>
        </div>

        <!-- THIRD ELEMENT -->
        <div class="containeer-items tc">
            <a>
                <img class="rounded-circle" src="../images/complaint.png" alt="COMPLAINT">
                <p class="f4 lh-copy txt"><a href="./complaint/complaint_table.php">Complaints</a></p>
                <p class="f4 lh-copy txt"><a href="./complaint/jobs_table.php">Jobs</a></p>
            </a>
        </div>

        <!-- FOURTH ELEMENT -->
        <div class="containeer-items tc">
            <a>
                <img class="rounded-circle" src="../images/tanker.png" alt="SECURITY">
                <p class="f4 lh-copy txt"><a href="./security/employee_outing_table.php">Outing</a></p>
                <p class="f4 lh-copy txt"><a href="./security/tanker_table.php">Tankers</a></p>
                <p class="f4 lh-copy txt"><a href="./security/visitor_log_table.php">Visitors</a></p>
            </a>
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>