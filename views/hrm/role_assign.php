<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/role_controller.php'); ?>
<?php

if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
    if ($_SESSION['is_superadmin'] == 0)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

// if (isset($_GET['edit'])) {
//     $role_id = $_GET['edit'];
//     $update = true;
//     $record = mysqli_query($conn, "SELECT * FROM roles WHERE role_id=$role_id");

//     // if (count($record) == 1 ) {
//     $n = mysqli_fetch_array($record);

//     $role_id = $n['role_id'];
//     $role_name = $n['role_name'];
//     $rights = $n['rights'];
//     // }
// }
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Assign Role</title>

    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/table.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="b ma2">
    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>
    
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <!-- <div class="form-content"> -->
                <div class="form-items">
                    <h1 class="f2 lh-copy tc" style="color: white;">Assign Role</h1>
                    <form class=" f3 lh-copy" novalidate action="../../controllers/role_assign_controller.php" method="post">
                        <?php $results = mysqli_query($conn, "SELECT * FROM employee JOIN employee_designation ON employee_designation.id = employee.designation and employee.role is null"); ?>
                        <div class="pa1 table-responsive">
                            <table class="table table-bordered tc">
                                <thead>
                                    <tr>
                                        <th scope="col">Employee Code</th>
                                        
                                        <th scope="col" colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>
                                            <?php
                                            $req_id = '';
                                            ?>
                                            <select id="emp-code-dropdown" name="emp_code" oninput="">

                                                <option name="emp_code" selected disabled value="">select </option>
                                                <?php $employees = mysqli_query($conn, "SELECT * FROM employee where role is null");
                                                foreach ($employees as $row) {
                                                    $name = $row['fname'] . " " . $row['lname'];
                                                    ?>
                                                    <option name="emp_code" value="<?= $row["emp_id"] ?>" title="<?= $name ?>">
                                                        <?= $row["emp_code"]; ?>
                                                    </option>
                                                <?php } ?>


                                                <!-- <script type='text/javascript'>
                                                    const myFunction = () => {
                                                        var optionValue = document.getElementById("emp-code-dropdown").value;
                                                       
                                                        document.getElementById("name_emp").innerHTML = "empName";

                                                    }
                                                </script> -->
                                            </select>
                                        </td>
                                       
                                        
                                        <td>
                                            <select name="role_id">
                                                <option name="role_id" selected disabled value="">Assign Role </option>
                                                <?php
                                                $roles = mysqli_query($conn, "SELECT * FROM roles");

                                                foreach ($roles as $row) {
                                                    // $sql = mysqli_query($conn, "SELECT rights.* FROM rights join roles on rights.id=roles.rights and roles.role_id='{$row['role_id']}'");
                                                    // $rights = mysqli_fetch_array($sql);



                                                ?>
                                                    <option name="role_id" value="<?= $row["role_id"] ?>" title="">
                                                        <?= $row["role_name"]; ?>
                                                    </option>
                                                <?php
                                                }

                                                ?>
                                            </select>
                                        </td>
                                    </tr>

                            </table>
                        </div>
                        <div class="form-button mt-3 tc">
                            <?php if ($update == true) : ?>
                                <button id="submit" name="update" value="update" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                            <?php else : ?>
                                <button id="submit" name="submit" value="sumbit" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
                            <?php endif ?>

                        </div>
                    </form>
                    <button class="btn btn-warning f3 lh-copy" style="color: white; margin-top:10px;" onclick="location.href='roles.php'">
                        Add New Role
                    </button>
                </div>
                <!-- </div> -->
            </div>
        </div>
    </div>
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <script src="../../js/form.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>

</html>