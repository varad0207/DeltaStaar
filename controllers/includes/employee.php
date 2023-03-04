<?php /*
 <?php
 include('../../controllers/includes/common.php');
 $rights = unserialize($_SESSION['rights']);
 ?>
 <div class="portal">
 <h1 class="tc f-subheadline lh-title spr">Dashboard</h1>
 <div class="containeer ma4">
 <div class="containeer-items tc">
 <?php if ($rights['rights_employee_details'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./hrm/employee_table.php">Employee</a></p>
 <?php } ?>
 <?php if ($rights['rights_vaccination'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./hrm/vaccination_table.php">Vaccination</a></p>
 <?php } ?>
 <?php if ($rights['rights_roles'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./hrm/roles_table.php">Roles</a></p>
 <?php } ?>
 <?php if ($rights['rights_accomodation'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./accomodation/accomodation_table.php">Accommodation</a></p>
 <?php } ?>
 <?php if ($rights['rights_rooms'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./accomodation/room_table.php">Rooms</a></p>
 <?php } ?>
 <?php if ($rights['rights_complaints'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./complaint/complaint_table.php">Complaints</a></p>
 <?php } ?>
 <?php if ($rights['rights_jobs'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./complaint/jobs_table.php">Jobs</a></p>
 <?php } ?>
 <?php if ($rights['rights_employee_outing'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./security/employee_outing_table.php">Outing</a></p>
 <?php } ?>
 <?php if ($rights['rights_tankers'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./security/tanker_table.php">Tankers</a></p>
 <?php } ?>
 <?php if ($rights['rights_visitor_log'] > 0) { ?>
 <p class="f4 lh-copy txt"><a href="./security/visitor_log_table.php">Visitors</a></p>
 <?php } ?>
 </div>
 </div>
 </div>
 <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
 integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
 crossorigin="anonymous">
 </script>
 <!-- JavaScript Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
 crossorigin="anonymous">
 </script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
 integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
 crossorigin="anonymous">
 </script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
 integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
 crossorigin="anonymous">
 </script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
 integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
 crossorigin="anonymous">
 </script>
 */?>

<?php
include 'common.php';
?>

<!--Styles for this are included in employeeDashboard.css file with unique class names-->
<div class="containerrr">

    <div class="one">
        <div class="employee-logo">
            <img src="../images/employee.png" alt="employee_logo" width="80%">
        </div>

    </div>
    <div class="two">
        <div class="head-icon">
            <img src="../images/checklistHand.png" alt="forms_logo">
        </div>
        <div class="links">
            <h4>Forms</h4>

            <div class="button-con">
                <a href="">
                    <button class="button-56" role="button">Add Details</button>
                </a>
            </div>
            <div class="button-con">
                <a href="">
                    <button class="button-56" role="button">Vaccination Form</button>
                </a>
            </div>

        </div>


    </div>
    <!--<div class="separator">.</div>-->
    <div class="three">
        <div class="head-icon">
            <img src="../images/complaint_icon.png" alt="complaint_logo">
        </div>
        <div class="links">
            <h4>Complaints</h4>

            <div class="button-con">
                <a href="">
                    <button class="button-56" role="button">Lodge a Complaint</button>
                </a>
            </div>
            <div class="button-con">
                <a href="">
                    <button class="button-56" role="button">Check Complaint Status</button>
                </a>
            </div>
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