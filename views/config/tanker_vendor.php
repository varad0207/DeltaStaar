<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/tanker_vendor_controller.php'); 
if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
if ($_SESSION['is_superadmin'] == 0)
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
$update = "";
if(isset($_GET['edit']))
{
    $id = $vname = $cname = $add = $num = $price = "";
    $id = $_GET['edit'];
    $update = true;

    $record = mysqli_query($conn, "SELECT * FROM tanker_vendors WHERE id=$id");

	$n = mysqli_fetch_array($record);

    $vname = $n['vname'];
    $cname = $n['company_name'];
    $add = $n['address'];
    $num = $n['number'];
    $price = $n['price'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Tanker Vendor</title>
    
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
    
</head>
<body class="b ma2">
    <style>
        span{
            color: gold;
            font-size: 14px;
        }
    </style>
    <!-- Sidebar and Navbar-->
    <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>
    <div class="form-body">
    <div class="row">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h1 class="f2 lh-copy tc" style="color: white;">Tanker Vendor Entry</h1>
                    <form class="f3 lh-copy" action="../../controllers/tanker_vendor_controller.php" method="post" id="myForm">
                        <div class="col-md-12 pa2">
                            <label for="vname">Vendor Name</label> 
                            <input class="form-control" type="text" name="vname" id="vname" placeholder="Vendor Name" value = "<?= $vname; ?>">
                            <small></small>
                       </div>

                        <div class="col-md-12 pa2">
                            <label for="cname">Company Name</label> 
                            <input class="form-control" type="text" name="cname" id="cname" placeholder="Company Name" value = "<?= $cname; ?>">
                            <small></small>
                        </div>

                        <div class="col-md-12 pa2">
                            <label for="number">Contact Number</label>
                            <input class="form-control" type="number" name="num" id="num" placeholder="Contact Number" value = "<?= $num; ?>">
                            <small></small>
                        </div>

                        <div class="col-md-12 pa2">
                            <label for="address">Vendor Address</label> 
                            <input class="form-control" type="text" name="add" id="add" placeholder="Vendor Address" value = "<?= $add; ?>">
                            <small></small>
                        </div>
                       
                        <div class="col-md-12 pa2">
                            <label for="price">Price</label>
                            <input class="form-control" type="number" name="price" id="price" placeholder="Annual Price" value="<?= $price; ?>">
                            <small></small>
                        </div>

                        <div class="form-button mt-3 tc">  
                            <?php if ($update == true): ?>
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="update" value="update"
                                style="background: #556B2F;">update</button>
                            <?php else: ?>
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit"
                                value="submit">Submit</button>
                            <?php endif ?>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <!-- Script files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateVendor.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
</body>
</html>
