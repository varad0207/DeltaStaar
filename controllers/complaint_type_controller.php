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
    $type = $description = "";

    if(isset($_POST['submit']))
    {
        $type = $_POST['type'];
        $description = $_POST['description'];

        mysqli_query($conn, "INSERT INTO complaint_type (id, type, description) VALUES ('', '$type', '$description')");
        $_SESSION['message'] = "Complaint Type Info Added!";
        header("location: ../views/config/complaint_type_table.php");
    }

    if(isset($_POST['update']))
    {
        $id = $_POST['id'];
        $type = $_POST['type'];
        $description = $_POST['description'];

        mysqli_query($conn, "UPDATE complaint_type SET type = '$type', description = '$description') WHERE id = '$id'");
        $_SESSION['message'] = "Complaint Type Info Updated!";
        header("location: ../views/config/complaint_type_table.php");
    }

    if(isset($_GET['del']))
    {
        $id = $_GET['del'];
        
        mysqli_query($conn, "DELETE FROM complaint_type WHERE id = $id");
        $_SESSION['message'] = "Complaint Type Deleted!";
        header("location: ../views/config/complaint_type_table.php");
    }
?>