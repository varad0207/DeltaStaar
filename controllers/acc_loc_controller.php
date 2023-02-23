<?php 

    include('includes/common.php');
	
	$id = $loc = "";

	if (isset($_POST['submit'])) 
    {
	    $loc =  $_POST['loc'];
		mysqli_query($conn, "INSERT INTO acc_locations(location) values ('$loc')"); 
        $last_insert_id = mysqli_insert_id($conn);

		$_SESSION['message'] = "Accommodation Location details saved"; 

        //change tracking code
        if($AllowTrackingChanges)
        mysqli_query($conn,"INSERT INTO change_tracking_acc_locations(user,type,loc_id, location) values ('{$_SESSION['user']}','Insert','$last_insert_id','$loc')");

		header('location: ../views/config/acc_loc_table.php');
	}

    if (isset($_POST['update'])) 
    {
        $id = $_POST['id'];
        $loc =  $_POST['loc'];
        echo $id;
        echo $loc;
         //change tracking code
         if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM acc_locations WHERE loc_id = $id"));
            mysqli_query($conn,"insert into change_tracking_acc_locations (user,type,loc_id,location) 
                values ('{$_SESSION['user']}','Update','{$row_affected['loc_id']}', '{$row_affected['location']}')");
         }

        mysqli_query($conn, "UPDATE acc_locations SET location = '$loc' WHERE loc_id = $id");
        $_SESSION['message'] = "Accommodation Location Info updated!"; 
        header('location: ../views/config/acc_loc_table.php');
    }

    if (isset($_GET['del'])) {
        $id = $_GET['del'];

        //change tracking code
        if($AllowTrackingChanges){
            $row_affected=mysqli_fetch_array(mysqli_query($conn,"select * FROM acc_locations WHERE loc_id = $id"));
            mysqli_query($conn,"insert into change_tracking_acc_locations (user,type,loc_id,location) 
                values ('{$_SESSION['user']}','Delete','{$row_affected['loc_id']}', '{$row_affected['location']}')");
        }

        mysqli_query($conn, "DELETE FROM acc_locations WHERE loc_id=$id");
        $_SESSION['message'] = "Accommodation Location deleted!"; 
        header('location: ../views/config/acc_loc_table.php');
    }
?>