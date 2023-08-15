<?php include('../../controllers/includes/common.php'); ?>
<?php include('../../controllers/vaccination_controller.php'); ?>
<?php
if (!isset($_SESSION["emp_id"]))
header("location:../../index.php");
$isPrivilaged = 0;
    $rights = unserialize($_SESSION['rights']);
    if ($rights['rights_vaccination'] > 1) {
        $isPrivilaged = $rights['rights_vaccination'];
    } else
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    if ($isPrivilaged == 5 || $isPrivilaged == 4)
        die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
    

if (isset($_GET['edit'])) {
    $vaccination_id = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "select employee.fname,last_dose.emp_id,employee.emp_code emp_code,vaccination_category.category_name category_name,last_dose.date_of_administration date_of_administration,last_dose.category_id category_id,last_dose.vaccination_id vaccination_id,last_dose.location location,last_dose.date_of_next_dose date_of_next_dose from employee join last_dose on employee.emp_id=last_dose.emp_id join vaccination_category on vaccination_category.category_id=last_dose.category_id where last_dose.vaccination_id=$vaccination_id");

    $n = mysqli_fetch_array($record);
    $emp_code = $n['emp_code'];
    $name=$n['fname'];
    $vaccination_id = $n['vaccination_id'];
    $emp_id = $n['emp_id'];
    $category = $n['category_id'];
    $dateofadministration = date('Y-m-d', strtotime($n['date_of_administration']));
    $location = $n['location'];
    // $nextdose = date('Y-m-d', strtotime($n['date_of_next_dose']));
}
?>
<!DOCTYPE html>
<html>

<head>

    <link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../../images/logo-no-name-circle.png">
    <title>Delta@STAAR | Add Vaccination</title>

    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <link rel="stylesheet" href="../../css/autocompleteCSS.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
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
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Enter Vaccination Details</h1>
                        <form class="f3 lh-copy" action="../../controllers/vaccination_controller.php" method="post" id="myForm">

                            <?php if (!$update) { ?>
                                <!-- <div class="form-field col-md-12 pa2">
                                    <label for="empcode">Employee Code</label>
                                    <select class="form-select mt-3" name="emp_id" id="empcode">
                                        <option selected disabled value="" name="employee_code">Select Employee Code
                                        </option>
                                        <?php
                                        // $emp_code = mysqli_query($conn, "SELECT * FROM employee");

                                        // foreach ($emp_code as $row) {?>
                                        <option name="employee_code" value="<?php //$row["emp_id"] ?>"><?php //echo $row["emp_code"]." - ".$row["fname"]; ?>
                                        </option>
                                        <?php
                                        //}

                                        ?>
                                    </select>
                                    <small></small>
                                </div> -->


                                <?php
                                $empdet = "select emp_code,concat(fname,' - ',emp_code) as name from employee";
                                $detresult = mysqli_query($conn, $empdet);
                                $detdata = array();
                                while ($detrow = mysqli_fetch_assoc($detresult)) {
                                    $detdata[] = $detrow['name'];
                                }
                                $employees = json_encode($detdata);
                                ?>
                                 <div class="autocomplete form-control form-field col-md-12 pa2">
                                        <input class="autocompleteinp form-control" id="empcode" type="text" name="emp_code" placeholder="Employee name" required>
                                    </div>

                                    <datalist id="options_list">
                                        <?php foreach ($detdata as $option) : ?>
                                            <option value="<?= $option; ?>">
                                            <?php endforeach; ?>
                                    </datalist>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>

                                <div class="form-field col-md-12 pa2">
                                    <label for="category">Vaccination Category</label>
                                    <select class="form-select mt-3" name="cat_id" id="cat">
                                        <option selected disabled value="">Select Category</option>
                                        <?php
                                        $vac_cat = mysqli_query($conn, "SELECT * FROM vaccination_category");

                                        foreach ($vac_cat as $row1) { ?>
                                            <option name="category_name" value="<?= $row1["category_id"] ?>">
                                                <?= $row1["category_name"]; ?>
                                            </option>
                                        <?php
                                        }

                                        ?>
                                    </select>
                                    <small></small>
                                </div>
                            <?php } else { ?>
                                <div class="form-field col-md-12 pa2">
                                    <input class="form-control" type="hidden" name="emp_id" class="empcode" value="<?php echo $emp_id ?>">
                                    <input class="form-control" type="hidden" name="vaccination_id" value="<?php echo $vaccination_id ?>">
                                    <input class="form-control" type="hidden" name="emp_code" value="<?php echo $emp_code ?>">

                                    <label for="empcode">Employee Code</label>

                                    <input class="form-control" type="text" readonly value="<?php echo $emp_code." - ".$name ?>">
                                    <small></small>
                                </div>

                                <div class="form-field col-md-12 pa2">
                                    <label for="category">Vaccination Category</label>
                                    <select class="form-select mt-3" name="cat_id" id="cat">
                                        <option selected disabled value="">Select Category</option>
                                        <?php
                                        $vac_cat = mysqli_query($conn, "select * from vaccination_category where category_id not in (select category_id from vaccination where emp_id = '$emp_id')");

                                        foreach ($vac_cat as $row1) { ?>
                                            <option name="category_name" value="<?= $row1["category_id"] ?>">
                                                <?= $row1["category_name"]; ?>
                                            </option>
                                        <?php
                                        }

                                        ?>
                                    </select>
                                    <small></small>
                                </div>
                            <?php } ?>



                            <div class="form-field col-md-12 pa2">
                                <label for="date_of_administration">Date of Administration</label>
                                <input class="form-control" type="date" name="doa" id="doa" value="<?php echo $dateofadministration ?>">
                                <small></small>
                            </div>

                            <div class="form-field col-md-12 pa2">
                                <label for="location">Location</label>
                                <input class="form-control" type="text" name="loc" id="loc" value="<?php echo $location ?>"
                                    placeholder="Location">
                                <small></small>
                            </div>

                            <div class="form-button mt-3 tc">
                                <?php if ($update == true): ?>
                                    <button id="submit" name="update" value="update" type="submit"
                                        class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                                <?php else: ?>
                                    <button id="submit" name="submit" value="sumbit" type="submit"
                                        class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
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
    <script src="../../js/validateVacc.js"></script>
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
    <script>
        function autocomplete(inp, arr) {
            var currentFocus;
            inp.addEventListener("input", function(e) {
                var a, b, i, val = this.value;
                closeAllLists();
                if (!val) return false;
                currentFocus = -1;
                a = document.createElement("DIV");
                a.setAttribute("id", this.id + "autocomplete-list");
                a.setAttribute("class", "autocomplete-items");
                this.parentNode.appendChild(a);
                for (i = 0; i < arr.length; i++) {
                    if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                        b = document.createElement("DIV");
                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                        b.innerHTML += arr[i].substr(val.length);
                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                        b.addEventListener("click", function(e) {
                            inp.value = this.getElementsByTagName("input")[0].value;
                            closeAllLists();
                        });
                        a.appendChild(b);
                    }
                }
            });
            inp.addEventListener("keydown", function(e) {
                if (e.keyCode === 13) {
                    // insert the value for the autocomplete text field:
                    var selectedOption = document.querySelector(".autocomplete-active");
                    if (selectedOption) {
                        inp.value = selectedOption.getElementsByTagName("input")[0].value;
                    }
                    // close the list of autocompleted values
                    closeAllLists();
                }
            });
            inp.addEventListener("keydown", function(e) {
                var x = document.getElementById(this.id + "autocomplete-list");
                if (x) x = x.getElementsByTagName("div");
                if (e.keyCode == 40) {
                    currentFocus++;
                    addActive(x);
                } else if (e.keyCode == 38) {
                    currentFocus--;
                    addActive(x);
                } else if (e.keyCode == 13) {
                    e.preventDefault();
                    if (currentFocus > -1) {
                        if (x) x[currentFocus].click();
                    }
                }
            });

            function addActive(x) {
                if (!x) return false;
                removeActive(x);
                if (currentFocus >= x.length) currentFocus = 0;
                if (currentFocus < 0) currentFocus = (x.length - 1);
                x[currentFocus].classList.add("autocomplete-active");
            }

            function removeActive(x) {
                for (var i = 0; i < x.length; i++) {
                    x[i].classList.remove("autocomplete-active");
                }
            }

            function closeAllLists(elmnt) {
                var x = document.getElementsByClassName("autocomplete-items");
                for (var i = 0; i < x.length; i++) {
                    if (elmnt != x[i] && elmnt != inp) {
                        x[i].parentNode.removeChild(x[i]);
                    }
                }
            }
            document.addEventListener("click", function(e) {
                closeAllLists(e.target);
            });
        }
        var employees = <?php echo $employees; ?>;
        autocomplete(document.getElementById("empcode"), employees);
    </script>
</body>

</html>