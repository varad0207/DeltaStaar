<?php
include 'common.php';
?>
<!--Styles for this are included in securityDashboard.css file with unique class names-->
<div class="containerr">

    <div class="left">
        <div class="security-logo">
            <img src="../images/guard.png" alt="security_logo">
        </div>

    </div>
    <div class="middle">
        <div class="head-icon">
            <img src="../images/calender.png" alt="calender_logo">
        </div>
        <div class="links">
            <h4>Employee<span style="font-family:'Courier New', Courier, monospace;">/</span>Vistor Log</h4>

            <div class="button-con">
                <a href="../views/security/employee_outing.php">
                    <button class="button-56" role="button">Add Employee Outing</button>
                </a>
            </div>
            <div class="button-con">
                <a href="../views/security/visitor_log.php">
                    <button class="button-56" role="button">Visitor Log Form</button>
                </a>
            </div>

        </div>


    </div>
    <!--<div class="separator">.</div>-->
    <div class="right">
        <div class="head-icon">
            <img src="../images/water_tanker.png" alt="tanker_logo">
        </div>
        <div class="links">
            <h4>Tanker Details</h4>

            <div class="button-con">
                <a href="">
                    <button class="button-56" role="button">Add Tanker Details</button>
                </a>
            </div>
        </div>



    </div>
</div>