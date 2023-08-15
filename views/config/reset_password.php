<?php 
    include('../../controllers/includes/common.php'); 
    if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");
    $n = mysqli_fetch_array(mysqli_query($conn, "SELECT fname,emp_code,emp_id FROM employee WHERE emp_code='{$_SESSION['emp_code']}'"));
    $emp_id = $n['emp_id'];
    $emp_code = $n['emp_code'];
    $name = $n['fname'];

    if(isset($_POST['submit']))
    {
        $password=md5($_POST['password']);
        $new_password=md5($_POST['new_password']);
        $re_new_password=md5($_POST['re_new_password']);
        $result=mysqli_fetch_array(mysqli_query($conn,"SELECT * from login_credentials WHERE `emp_id`='{$_SESSION['emp_id']}'"));
        if($result['pass']==$password)
        {
            if($new_password==$re_new_password)
            {
                mysqli_query($conn,"UPDATE login_credentials SET `pass`='$new_password' WHERE `emp_id`='$emp_id'");
            }
            else
            {
                die("New password does not match with re entered password");
            }
        }
        else
        {
            die("Invalid password");
        }
        header("location:../../views/dashboard.php");
    }


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
    <style>
        #oldpassword{
            font-weight: bold;
        }
        </style>
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
                            action="" method="POST">
                            <div class="col-md-12 pa2">
                                <label class="d-block mb-4">Employee Code</label>
                                <input type="hidden" name="emp_code" value="<?php echo $emp_code ?>">
                                <input type="text" readonly value="<?php echo $emp_code ?>">
                            </div>
                            <div class="col-md-12 pa2">
                                <label class="d-block mb-4">Employee Name</label>
                                <input type="text" readonly value="<?php echo $name ?>">
                            </div>
                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">Current Password</label>
								<input type="password" name="password" id="oldpassword" onkeyup="GetDetail(this.value,<?php echo $emp_id; ?>)">
                            </div>

                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">New Password</label>
								<input type="password" name="new_password" id="newpassword" disabled onkeyup="newPass(this.value)"> 
                                <p id="message" style="margin-top:5px">&nbsp</p>
                            </div>

                            <div class="col-md-12 pa2">
                            <label class="d-block mb-4">Re-enter new Password</label>
								<input type="password" name="re_new_password" id="confirmpassword" disabled onkeyup="confirmPass(this.value)">
                            </div>
                            
                            <div class="form-button mt-3 tc">
                            <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit" disabled>Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/md5.js"></script>

    <script>
        function GetDetail(str,id) {
            // console.log(CryptoJS.MD5(str).toString());
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var myObj = JSON.parse(this.responseText);
                        //console.log(myObj[0]);
                        if(CryptoJS.MD5(str).toString()==myObj[0]){
                            document.getElementById('oldpassword').style.color = "green";
                            document.getElementById('newpassword').disabled =false;
                        }
                        else{
                            document.getElementById('oldpassword').style.color = "red";
                            document.getElementById('newpassword').disabled =true;
                            document.getElementById('confirmpassword').disabled =true;
                        }

                    }
                };
                xmlhttp.open("GET", "../../controllers/validation.php?id=" + id, true);
                xmlhttp.send(); 
        }
        function newPass(str){
            document.getElementById('confirmpassword').disabled =false;
            var message = document.getElementById("message");
            if(str=="password"){	
                document.getElementById('confirmpassword').disabled =true;		
                document.getElementById('newpassword').style.color = "red";	
                message.innerHTML = "Your new password cannot be same as old password!";
                message.style.color="red";
                message.style.fontSize="10px";	
                message.style.marginTop="5px";
            }
            else{
                message.innerHTML = "&nbsp";
                message.style.marginTop="5px";
                document.getElementById('confirmpassword').disabled =false;	
                document.getElementById('newpassword').style.color = "grey";			
            }
        }
        function confirmPass(str){
            if(str==document.getElementById('newpassword').value){
                document.getElementById('confirmpassword').style.color = "green";
                document.getElementById('submit').disabled =false;

            }
            else{
                document.getElementById('submit').disabled =true;
                document.getElementById('confirmpassword').style.color = "red";
            }
        }
    
    </script>
    <script src="../../js/form.js"></script>
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