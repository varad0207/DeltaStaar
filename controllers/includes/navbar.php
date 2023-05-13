<?php
require 'common.php';

$link = "";
if (basename($_SERVER['PHP_SELF'], '.php') != "dashboard")
    $link = "../";
?>

<nav class="navbar navbar-expand-lg navbar-dark f3 lh-copy pa3 fw4">
    <div class="container-fluid">
        <button class="openbtn" onclick="openNav()">&#9776; Menu</button>
        <a class="navbar-brand" href="#">
            <img src="../<?php echo $link; ?>images/logo-no-name.png" height="50px" alt="Deltin Logo"
                class="d-inline-block align-text-top" style="border-radius: 50px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
            aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar"
            aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: #fff;">Delta@STAAR</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close">
                </button>
            </div>

            <!-- no login -->

            <?php if (!isset($_SESSION['emp_id'])) { ?>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <!--
                            <li class="nav-item">
                                <a class="nav-link active" href="../../views/dashboard.php">Home</a>
                            </li> 
                        -->
                        <li class="nav-item">
                            <a class="nav-link active" href="../../views/aboutus.html">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="../../views/complaint/complaint.php">Complaints+</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active1" href="../../views/login.php">LogIn</a>
                        </li>
                    </ul>
                </div>
            <?php } else { ?>

                <!-- after login -->

                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <?php 
                        if (basename($_SERVER['PHP_SELF'], '.php') == "dashboard") { ?>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link active " id="dropdownMenuButton" aria-haspopup="true"
                                        aria-expanded="false" aria-current="page" href="#" data-toggle="dropdown"
                                        data-placement="bottom" title="Configure">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                                            class="bi bi-gear" viewBox="0 0 16 16">
                                            <path
                                                d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
                                            <path
                                                d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
                                        </svg>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="../views/config/reset_password.php">Change Password</a>
                                        <?php if ($_SESSION['is_superadmin']) { ?>

                                        <a class="dropdown-item" href="../views/config/vaccination_category.php">Add Vaccination
                                            category</a>
                                        <a class="dropdown-item" href="../views/config/emp_desig.php">Add Employee
                                            Designation</a>
                                        <a class="dropdown-item" href="../views/config/emp_dept.php">Add Employee Department</a>
                                        <a class="dropdown-item" href="../views/config/acc_loc.php">Add Accommodation
                                            Location</a>
                                        <a class="dropdown-item" href="../views/config/tanker_vendor.php">Add Tanker Vendors</a>
                                        <a class="dropdown-item" href="../views/config/security.php">Define Security</a>
                                        <a class="dropdown-item" href="../views/config/technician.php">Define/Add Technician</a>
                                        <a class="dropdown-item" href="../views/config/complaint_type.php">Complaint Type</a>
                                        <a class="dropdown-item" href="../controllers/includes/logs.php">Logs</a>
                                        <?php } ?>

                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="../views/aboutus.html">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="../views/complaint/complaint.php">Complaint+</a>
                            </li>
                        <?php }
                        else { ?>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../../views/dashboard.php">Home</a>
                            </li>
                            <li class="nav-item" style="cursor: pointer;">
                                <a class="nav-link active1" aria-current="page" onclick="window.history.back()">Back</a>
                            </li>
                        <?php } ?>
                        <li class="nav-item">
                            <a class="nav-link active1" id="adminlogin"
                                href="../<?php echo $link; ?>controllers/logout.php">Log Out</a>
                        </li>
                    </ul>
                </div>
            <?php } ?>
        </div>
    </div>
</nav>