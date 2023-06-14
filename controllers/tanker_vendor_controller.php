<?php
    if (isset($_POST['submit'])|| isset($_POST['update'])||isset($_GET['del'])) {
        include('includes/common.php');
    }else{
        include('includes/common.php');
    }
?>

<?php
    if(!isset($_SESSION))
    {
        session_start();
    }
    $id = $vname = $cname = $add = $num = $price = "";

    if(isset($_POST['submit']) && !empty($_POST['submit']))
    {
        date_default_timezone_set('Asia/Kolkata');
        $vname = $_POST['vname'];
        $cname = $_POST['cname'];
        $add = $_POST['add'];
        $num = $_POST['num'];
        $price = $_POST['price'];
        $time_stamp = date('Y-m-d H:i:s');

        echo $time_stamp;
        mysqli_query($conn, "INSERT INTO tanker_vendors(vname, company_name, address, number, price, time_stamp) VALUES('$vname','$cname','$add','$num','$price','$time_stamp')");
        $_SESSION['message'] = "Tanker Vendor Info Added!";
        header("location: ../views/config/tanker_vendor_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['id'];
        $vname = $_POST['vname'];
        $cname = $_POST['cname'];
        $add = $_POST['add'];
        $num = $_POST['num'];
        $price = $_POST['price'];
        $time_stamp = date('Y-m-d H:i:s');

        mysqli_query($conn, "UPDATE tanker_vendors SET vname = '$vname', company_name = '$cname', address = '$add', number = '$num', price = '$price', time_stamp = '$time_stamp' WHERE id = '$id'");
        $_SESSION['message'] = "Tanker Vendor Info Updated!";
        header("location: ../views/config/tanker_vendor_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];

        mysqli_query($conn, "DELETE FROM tanker_vendors WHERE id = $id");
        $_SESSION['message'] = "Tanker Vendor Info Deleted!";
        header("location: ../views/config/tanker_vendor_table.php");
    }
?>