<?php include('../../controllers/includes/common.php'); 
 include('../../controllers/security_controller.php'); 
 if (!isset($_SESSION["emp_id"]))
    header("location:../../views/login.php");
?>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Reset Password</title>
    <meta name="description" content="Reset password">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
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
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Reset Password</h1>
                        <form class="requires-validation f3 lh-copy" novalidate
                            action="" method="GET">
                            <div class="col-md-12 pa2">
                                <label class="d-block mb-4">Employee Code</label>
                                <input type="text" name="emp_code">
						
                            </div>

                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">Current Password</label>
								<input type="password" name="password">
                            </div>

                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">New Password</label>
								<input type="password" name="new_password"> 
                            </div>

                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">Re-enter new Password</label>
								<input type="password" name="re_new_password">
                            </div>
                            
                            <div class="form-button mt-3 tc">
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Verification of entered password -->
    <?php
    if(isset($_GET['submit']))
    {
        $emp_code=$_GET['emp_code'];
        $password=md5($_GET['password']);
        $new_password=md5($_GET['new_password']);
        $re_new_password=md5($_GET['re_new_password']);

        $qry="SELECT * FROM `employee` WHERE `emp_code`='$emp_code'";
        $res=mysqli_query($conn,$qry);
        while($result=mysqli_fetch_array($res))
            $emp_id=$result['emp_id'];
        
        $qry="SELECT * from login_credentials WHERE `emp_id`='$emp_id'";
        $res=mysqli_query($conn,$qry);
        while($result=mysqli_fetch_array($res))
        if($result['pass']==$password)
        {
            echo "match";
            if($new_password==$re_new_password)
            {
                $qry="UPDATE login_credentials SET `pass`='$new_password' WHERE `emp_id`='$emp_id'";
                mysqli_query($conn,$qry);
                ?>
                <h3>Updation succesful</h3>
            <?php
            }
            else
            {
                echo "New password does not match with re entered password";
            }
        }
        else
        {
            echo "Invalid password";
        }


    }
    ?>
    <script src="../../js/form.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>