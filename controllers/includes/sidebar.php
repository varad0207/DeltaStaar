<?php
require 'common.php';
$rights = unserialize($_SESSION['rights']);
$link = "";
if (basename($_SERVER['PHP_SELF'], '.php') != "dashboard")
    $link = "../";

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Sidebar</title>

    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body style="background-color: #1b1c1e;">
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a class="navbar-brand mb-2" href="#" style="padding: 8px;">
            <img src="../<?php echo $link; ?>images/logo-no-name-circle.png" height="120px" alt="Deltin Logo" class="">
        </a>
        <ul class="nav flex-column p-4" id="nav_accordion" style="--bs-nav-link-hover-color: #f8f9fa;">

            <!-- accomodation -->
            <?php if ($rights['rights_accomodation'] > 0 || $rights['rights_rooms'] > 0) { ?>
                <li class="nav-item has-submenu">
                    <a class="nav-link border-dark border-bottom" href="#">
                        <i class="bi bi-building"></i>
                        Accommodation
                        <i class="bi bi-chevron-down"></i>
                    </a>
                    <ul class="submenu collapse">
                        <?php if ($rights['rights_accomodation'] > 0) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/accomodation/accomodation.php">
                                    Add Accommodation
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/accomodation/accomodation_table.php">
                                    Accommodation Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/acc_loc_table.php">
                                    Accommodation Location Table
                                </a>
                            </li>
                        <?php }
                        if ($rights['rights_rooms'] > 0) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/accomodation/rooms.php">
                                    Add Rooms
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/accomodation/room_table.php">
                                    Rooms Table
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>

            <!-- complaint -->
            <?php if ($rights['rights_complaints'] > 0 || $rights['rights_jobs'] > 0) { ?>
                <li class="nav-item has-submenu">
                    <a class="nav-link border-dark border-bottom" href="#">
                        <i class="bi bi-file-text"></i>Complaints<i class="bi bi-chevron-down"></i>
                    </a>
                    <ul class="submenu collapse">
                        <li>
                            <a class="nav-link border-dark border-bottom"
                                href="../<?php echo $link; ?>views/complaint/complaint.php">
                                Raise A Complaint
                            </a>
                        </li>
                        <li>
                            <a class="nav-link border-dark border-bottom"
                                href="../<?php echo $link; ?>views/complaint/complaint_table.php">
                                Complaint Table
                            </a>
                        </li>
                        <?php if ($isSecurity): ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/complaint/security_jobs.php">
                                    View Jobs
                                </a>
                            </li>
                        <?php elseif ($isTechnician): ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/complaint/tech_jobs.php">
                                    View Jobs
                                </a>
                            </li>
                        <?php else: ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/complaint/jobs_table.php">
                                    View Jobs
                                </a>
                            </li>
                        <?php endif ?>
                        <?php if ($_SESSION['is_superadmin']) { ?>
                            <!-- 
                    <li>
                        <a class="nav-link border-dark border-bottom" href="../<?php //echo $link; ?>views/config/complaint_type.php">
                            Add Complaint Type
                        </a>
                    </li> -->
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/complaint_type_table.php">
                                    Complaint Type Table
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>

            <!-- hrm -->
            <?php if ($rights['rights_employee_details'] > 0 || $rights['rights_vaccination'] > 0 || $rights['rights_vaccination_category'] > 0) { ?>
                <!-- check more things like vaccintion and outing -->
                <li class="nav-item has-submenu">
                    <a class="nav-link border-dark border-bottom" href="#">
                        <i class="bi bi-person"></i> HRM <i class="bi bi-chevron-down"></i>
                    </a>
                    <ul class="submenu collapse">
                        <?php if ($rights['rights_employee_details'] > 0) { ?>
                            <!-- <li>
                        <a class="nav-link border-dark border-bottom" href="../<?php //echo $link; ?>views/config/emp_desig.php">
                            Add Designation Details
                        </a>
                    </li> -->
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/emp_desig_table.php">
                                    Employees Designation Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/emp_dept_table.php">
                                    Employees Department Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/hrm/employee.php">
                                    Add Employee Details
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/hrm/employee_table.php">
                                    Employees Table
                                </a>
                            </li>
                        <?php }
                        if ($_SESSION['is_superadmin']) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom" href="../<?php echo $link; ?>views/hrm/roles.php">
                                    Add Role </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/hrm/roles_table.php">
                                    Roles Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/security_table.php">
                                    Security Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/technician_table.php">
                                    Technician Table
                                </a>
                            </li>
                        <?php }
                        if ($rights['rights_vaccination'] > 0 || $rights['rights_vaccination_category'] > 0) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/hrm/vaccination.php">
                                    Add Vacination Details
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/hrm/vaccination_table.php">
                                    Vacination Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/vaccination_category_table.php">
                                    Vacination Category Table
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>

            <!-- security -->
            <?php if ($rights['rights_tankers'] > 0 || $rights['rights_employee_outing'] > 0 || $rights['rights_visitor_log'] > 0) { ?>
                <li class="nav-item has-submenu">
                    <a class="nav-link border-dark border-bottom" href="#">
                        <i class="bi bi-shield"></i> Security <i class="bi bi-chevron-down"></i>
                    </a>
                    <ul class="submenu collapse">
                        <?php if ($rights['rights_employee_outing'] > 0) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/employee_outing.php">
                                    Add Employee Outing
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/employee_outing_table.php">
                                    Employee Outings Table
                                </a>
                            </li>
                        <?php }
                        if ($rights['rights_tankers'] > 0) {
                            ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/tanker.php">
                                    Add Tanker Entry
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/tanker_table.php">
                                    Tanker Table
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/config/tanker_vendor_table.php">
                                    Tanker Vendor Table
                                </a>
                            </li>
                        <?php }
                        if ($rights['rights_visitor_log'] > 0) { ?>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/visitor.php">
                                    Visitor Log Form
                                </a>
                            </li>
                            <li>
                                <a class="nav-link border-dark border-bottom"
                                    href="../<?php echo $link; ?>views/security/visitor_log_table.php">
                                    Visitor Log Table
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>
            <!--
            <li class="nav-item">
                <a class="nav-link" href="#"> Other link </a>
            </li>
            -->
        </ul>

    </div>

    <script src="../<?php echo $link; ?>js//Sidebar//sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>