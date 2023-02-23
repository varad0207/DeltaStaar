<?php 
    include('../../controllers/includes/common.php');
    include('../../controllers/vaccination_controller.php'); 

    if (!isset($_SESSION["emp_id"]))header("location:../../views/login.php");
    // check rights
    $isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_vaccination'] > 0) {
    $isPrivilaged = $rights['rights_vaccination'];
}
else
die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>DELTA@STAAR | Vaccination</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Tachyons -->
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css"/>
    <!-- CSS files -->
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/table.css">
    <!-- Live Search -->
    <script type="text/javascript">
		function search() {
		    // Declare variables
		    var input, filter, listing, i, txtValue;
		    input = document.getElementById("form1");
		    filter = input.value.toUpperCase();
		    listing = document.getElementsByTagName("tr");
		    // Loop through all 
		    for (i = 0; i < listing.length; i++) {
		      if (listing[i]) {
		        txtValue = listing[i].textContent || listing[i].innerText;
		        if (txtValue.toUpperCase().indexOf(filter) > -1) {
		          listing[i].style.display = "";
		        } else {
		          listing[i].style.display = "none";
                //   document.getElementById("demo").innerHTML = "No Results Found";
		        }
		      }
		    }
		 }
	</script>
</head>
<body class="bg">

    <!-- Sidebar and Navbar-->
   <?php
    include '../../controllers/includes/sidebar.php';
    include '../../controllers/includes/navbar.php';
    ?>

    
    <div class="table-header">
    <h1 class="tc f1 lh-title spr">Employee Vaccination Details</h1>
    <div class="fl w-75 form-outline srch">
        <input type="search" id="form1" class="form-control" placeholder="Live Search" aria-label="Search" oninput="search()" />
        <h4 id="demo"></h4>
    </div>
    <div class="fl w-25 tr pa1">
    <button class="btn btn-dark" class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
    <i class="bi bi-filter-circle"> Sort By</i> </button>
    
    </div>
    </div>

    
    <!-- FILTERING DATA -->
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <div class="pa1">
        <br>
        <form action="" method="GET">
            <label style="color:white;">Filter By</label>
            <button type="sumbit" class="btn btn-light">Go</button>
            <!-- <button type="reset" class="btn btn-light">Reset</button> -->
            <br>
            <br>
            <table class="table">
                <thead>
                    <th>Category : </th>
                    <th>Administration Date : </th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <?php
                            $fetch_category = "SELECT * FROM vaccination_category";
                            $fetch_category_run = mysqli_query($conn, $fetch_category);
                            if (mysqli_num_rows($fetch_category_run) > 0) 
                            {
                                foreach ($fetch_category_run as $cat) 
                                {
                                    $checked1 = [];
                                    if (isset($_GET['category'])) 
                                    {
                                        $checked1 = $_GET['category'];
                                    }
                                    ?>
                                    <div>
                                    <input type="checkbox" name="category[]" value="<?= $cat['category_id']; ?>" 
                                    <?php 
                                    if (in_array($cat['category_id'], $checked1)) 
                                    {
                                        echo "checked";
                                    }
                                    ?>>
                                    <label><?= $cat['category_name']; ?></label>
                                    </div>
                                    <?php
                                }
                            } 
                            else 
                            {
                                echo "No designation availabe";
                            }
                            ?>
                        </td>
                        <td>
                            <label>From : </label>
                            <input type="date" name="start_date" value="<?php if (isset($_POST['start_date']))
                            echo $_POST['start_date']; ?>">
                            <br>
                            <br>
                            <label>To : </label>
                            <input type="date" name="end_date" value="<?php  if (isset($_POST['end_date']))
                            echo $_POST['end_date']; ?>"><br>

                        </td>
                        <!-- <td>
                        <div class="input-group mb-3">
                            <select name="sort_alpha" class="form-control">
                                <option value="">--Select Option--</option>
                                <option value="a-z" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "a-z") echo "selected"; ?>>A-Z(Ascending Order)</option>
                                <option value="z-a" <?php if (isset($_POST['sort_alpha']) && $_POST['sort_alpha'] == "z-a") echo "selected"; ?>>Z-A(Descending Order)</option>
                            </select>
                        </div>
                        </td> -->
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    </div>

    <?php
    $sql="select last_dose.emp_id emp_id, employee.emp_code emp_code,vaccination_category.category_name category_name,last_dose.date_of_administration date_of_administration,last_dose.category_id category_id,last_dose.vaccination_id vaccination_id,last_dose.location location,last_dose.date_of_next_dose date_of_next_dose from employee join last_dose on employee.emp_id=last_dose.emp_id join vaccination_category on vaccination_category.category_id=last_dose.category_id where 1=1";
    if(isset($_GET['category']))
    {
        $category_checked = [];
        $category_checked = $_GET['category'];
        $sql.=" and ( ";
        foreach ($category_checked as $row_cat) {
            $sql .= " vaccination_category.category_id=$row_cat or";
        }
        $sql=substr($sql,0,strripos($sql,"or"));  
        $sql.=" ) ";
        
    }
    if (isset($_GET['start_date'])) 
    {
        $_GET['start_date']!=""?$sql .= " and date_of_administration>='{$_GET['start_date']}' ":$a=0;
        

    }
    if (isset($_GET['end_date'])) {
         
        $_GET['end_date']!=""?$sql .= " and date_of_administration<='{$_GET['end_date']}' ":$a=0;
    }
    $vaccination_qry=$sql;
    ?>
    <!-- Displaying Database Table -->
    <?php
    /* ***************** PAGINATION ***************** */
    $limit=10;
    $page=isset($_GET['page'])?$_GET['page']:1;
    $start=($page-1) * $limit;
    $sql .=" LIMIT $start,$limit";
    $result=mysqli_query($conn,$sql);

    $q1="SELECT * FROM vaccination";
    $result1=mysqli_query($conn,$q1);
    $total=mysqli_num_rows($result1);
    $pages=ceil($total/$limit);
    $Previous=$page-1;
    $Next=$page+1;
    /* ************************************************ */
    ?>
    <div class="table-div">
        <?php if (isset($_SESSION['message'])): ?>
                <div class="msg">
                    <?php
                    echo $_SESSION['message'];
                    unset($_SESSION['message']);
                    ?>
                </div>
        <?php endif ?>
    
        <div class="pa1 table-responsive">
            <table class="table table-bordered tc">
                <thead>
                    <tr>
                    <th scope="col">Employee Code</th>
                    <th scope="col">Category</th>
                    <th scope="col">Date of Administration</th>
                    <th scope="col">Location</th>
                    <th scope="col">Date of Next Dose</th>
                    <th scope="col" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($result)) { ?>
                    <?php $employeeid = $row['emp_id'];
                
                    $categoryid = $row['category_id'];
                    
                    ?>
                    <tr>
                    <th scope="row"><?php echo $row['emp_code']; ?></th>
                        
                        <td>
                            <?php echo $row['category_name']; ?>
                        </td>
                        <td>
                            <?php echo $row['date_of_administration']; ?>
                        </td>
                        <td>
                            <?php echo $row['location']; ?>
                        </td>
                        <td>
                            <?php echo $row['date_of_next_dose']; ?>
                        </td>
                        <td>
                        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>
                            <a href="./vaccination.php?edit=<?php echo '%27' ?><?php echo $row['vaccination_id']; ?><?php echo '%27' ?>"
                                class="edit_btn"><i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            <?php } ?>
                                &nbsp;
                                <?php if($isPrivilaged>=4){ ?>
                            <a href="../../controllers/vaccination_controller.php?del=<?php echo '%27' ?><?php echo $row['vaccination_id']; ?><?php echo '%27' ?>"
                                class="del_btn"><i class="bi bi-trash" style="font-size: 1.2rem; color: black;"></i>
                            </a>
                            <?php } ?>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="vaccination_table.php?page=<?=$Previous;?>" aria-label="Previous"><span aria-hidden="true">&laquo; Previous</span></a></li>
            <?php for($i=1;$i<=$pages;$i++) :?>
    <li class="page-item"><a class="page-link" href="vaccination_table.php?page=<?=$i?>">
                <?php echo $i; ?>
            </a></li>
            <?php endfor;?>
            <li class="page-item"><a class="page-link" href="vaccination_table.php?page=<?=$Next;?>" aria-label="Next"><span aria-hidden="true">Next &raquo;</span></a></li>
        </ul>
    </nav>

    <div class="table-footer pa4">
        <div class="fl w-75 tl">
            <form action="../EXCEL_export.php" method="post">
                <button class="btn btn-warning" name="vaccination_export" value="<?php echo $vaccination_qry;?>"><h4><i class="bi bi-file-earmark-pdf"> Export</i></h4></button>
            </form>
        </div>
        <?php if($isPrivilaged>1 && $isPrivilaged!=5 && $isPrivilaged!=4){ ?>
        <div class="fl w-25 tr">
            <button class="btn btn-light">
                <h4><a href="vaccination.php">Add Vaccination</a></h4>
            </button>   
        </div>
        <?php } ?>
    </div>
    
    <!-- Footer -->
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

    <!-- Script Files -->
    <script src="../../js/form.js"></script>
    <script src="../../js/Sidebar/sidebar.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script> -->
</body>
</html>