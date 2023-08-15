<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/tanker_controller.php'); 
    if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");
    $isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_tankers'] > 1) {
        $isPrivilaged = $rights['rights_tankers'];
    } else
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    if ($isPrivilaged == 5 || $isPrivilaged == 4)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    $update = false;
$accid = $empsecid = $venid = $quality = $qty = $billno = $amount = $timestamp = "";
if(isset($_GET['edit']))
{
    $id = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM tankers WHERE id=$id");
	$n = mysqli_fetch_array($record);

    $accid = $n['acc_id'];
    $empsecid = $n['security_emp_id'];
    $venid = $n['vendor_id'];
    $quality = $n['quality_check'];
    $qty = $n['qty'];
    $billno = $n['bill_no'];
    $amount = $n['amount'];
    $timestamp = $n['timestamp'];
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
    <title>Delta@STAAR | Add Tanker</title>
    
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
                    <h1 class="f2 lh-copy tc" style="color: white;">Tanker Entry</h1>
                    <form class="f3 lh-copy" id="myForm" action="../../controllers/tanker_controller.php" method="post" name="myForm">
                
                        <div class="col-md-12 pa2">
                            <label for="accid">Accomodation</label>
                            <select class="form-select mt-3" name="acc" id="acc">
                                    <option selected disabled value="">Select Accomodation</option>
                                    <?php
                                    $acc_code=mysqli_query($conn, "SELECT * FROM accomodation");
                                    
                                    foreach ($acc_code as $row){ ?>
                                    <option name="acc" value="<?= $row["acc_id"]?>"
                                    <?php if($accid == $row['acc_id']) { ?>
                                        selected
                                    <?php } ?>>
                                    <?= $row["acc_name"];?></option>	
                                    <?php
                                    }
                                ?>
                            </select>
                            <small></small>
                        </div>

                        <div class="col-md-12 pa2">
                            <label for="empsecid">Employee Security ID</label>
                            <select class="form-select mt-3" name="sec" id="sec">
                                    <option selected disabled value="">Select Security</option>
                                    <?php
                                    $sec_id = mysqli_query($conn, "SELECT * FROM security join employee using(emp_id)");
                                    
                                    foreach ($sec_id as $row){ ?>
                                    <option name="sec" value="<?= $row["emp_id"]?>"
                                    <?php if($empsecid == $row['emp_id']) { ?>
                                        selected
                                    <?php } ?>
                                    ><?php echo($row['emp_code']." - ".$row['fname']);?>
                                    </option>	
                                    <?php
                                    }
                                    
                                    ?>
                            </select>
                            <small></small>
                        </div>

                        <div class="col-md-12 pa2">
                            <label for="vendorid">Vendor Name</label>
                            <select class="form-select mt-3" name="ven" id="ven">
                                    <option selected disabled value="">Select Name</option>
                                    <?php
                                    $vendor_id = mysqli_query($conn, "SELECT * FROM tanker_vendors");
                                    
                                    foreach ($vendor_id as $row){ ?>
                                    <option name="ven" value="<?= $row["id"]?>"
                                    <?php if($venid == $row['id']) { ?>
                                        selected
                                    <?php } ?>
                                    ><?= $row["vname"];?></option>	
                                    <?php
                                    }
                                    ?>
                            </select>
                            <small></small>
                        </div>

                        
                      
                       <div class="col-md-12 pa2">
                        <label for="quality">Quality</label>
                            <select class="form-select mt-3" name="quality" id="quality">
                                    <option selected disabled value="">Select Quality</option>
                                    <option value="Yes"
                                    <?php if($quality == 'Yes') { ?>
                                    selected
                                    <?php } ?>
                                    >Ok</option>
                                    <option value="No"
                                    <?php if($quality == 'No') { ?>
                                    selected
                                    <?php } ?>
                                    >Not Ok</option>
                            </select>
                            <small></small>
                       </div>

                       <div class="col-md-12 pa2">
                        <label for="quantity">Quantity</label>
                            <input class="form-control" type="number" name="qty" placeholder="7000" value="<?= $qty ?>" id="qty">
                            <small></small>
                      </div>

                      <div class="col-md-12 pa2">
                        <label for="billno">Delivery Challan</label>
                            <input class="form-control" type="text" name="billno" placeholder="Bill Number" value="<?= $billno ?>" id="challan">
                            <small></small>
                      </div>

                      <div class="col-md-12 pa2">
                        <label for="amount">Amount (In Thousand Rupees)</label>
                            <input class="form-control" type="text" name="amount" placeholder="Amount" value="<?= $amount ?>" id="amt">
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

    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="../../js/validateTanker.js"></script>
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
