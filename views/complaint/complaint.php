<?php
require '../../controllers/includes/common.php';
require '../../controllers/complaint_controller.php';

if (isset($_SESSION['emp_id']) && isset($_GET['edit'])) {
    $acc = mysqli_fetch_array(
        mysqli_query(
            $conn,
            "SELECT acc_code 
        FROM employee 
        join rooms on rooms.id=employee.room_id
        join accomodation on accomodation.acc_id=rooms.acc_id
        WHERE emp_id='{$_SESSION['emp_id']}'"
        )
    );
    $acc_code = $acc['acc_code'];
}

$update = "";
$acc_code = '';
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM complaints WHERE id=$id");

    $n = mysqli_fetch_array($record);

    $raise_timestamp = $n['raise_timestamp'];
    $category = $n['category'];
    $description = $n['description'];
    $status = $n['status'];
    $tech_closure_timestamp = $n['tech_closure_timestamp'];
    $sec_closure_timestamp = $n['sec_closure_timestamp'];
    $warden_closure_timestamp = $n['warden_closure_timestamp'];
    $remarks = $n['remarks'];
    $emp_code = $n['emp_code'];
    $acc_code = $n['acc_code'];
    $acc_name = $n['acc_name'];
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
    <title>Delta@STAAR | Raise Complaint</title>
    <meta name="description" content="Complaint submission portal for deltin employees">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        /*the container must be positioned relative:*/
        .autocomplete {
            position: relative;
            display: inline-block;
            padding: 0px 0px !important;
            margin-top: 16px !important;
        }





        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            /* padding: 10px; */
            cursor: pointer;
            background-color: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        /*when hovering an item:*/
        .autocomplete-items div:hover {
            background-color: #e9e9e9;
        }

        /*when navigating through the items using the arrow keys:*/
        .autocomplete-active {
            background-color: #e9e9e9 !important;
        }

        .autocompleteinp {
            margin-top: 0px !important;
        }
    </style>
</head>

<body class="b ma2" onload="fetchList()">
    <!-- Sidebar and Navbar-->
    <?php
    if (isset($_SESSION['emp_id'])) {
        include '../../controllers/includes/sidebar.php';
        include '../../controllers/includes/navbar.php';
    }
    ?>
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h1 class="f2 lh-copy tc" style="color: white;">Raise a Complaint</h1>
                        <?php if (isset($_SESSION['message'])) : ?>
                            <div class="msg">
                                <?php
                                echo $_SESSION['message'];
                                unset($_SESSION['message']);
                                ?>
                            </div>
                        <?php endif ?>
                        <form autocomplete="off" class="requires-validation f3 lh-copy" novalidate action="../../controllers/complaint_controller.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $id; ?>">
                            <input type="hidden" name="acc_code" value="<?php echo $acc_code; ?>">

                            <div class="col-md-12 pa2">
                                <label for="empcode">Employee Name</label>
                                <?php
                                $empdet = "select emp_code,concat(fname,' ',lname,' - ',emp_code) as name from employee";
                                $detresult = mysqli_query($conn, $empdet);
                                $detdata = array();
                                while ($detrow = mysqli_fetch_assoc($detresult)) {
                                    $detdata[] = $detrow['name'];
                                }
                                $employees = json_encode($detdata);

                                $accdet = "select acc_id,concat(acc_name,' - ',acc_code) as name from accomodation";
                                $detresult = mysqli_query($conn, $accdet);
                                $accdata = array();
                                while ($detrow = mysqli_fetch_assoc($detresult)) {
                                    $accdata[] = $detrow['name'];
                                }
                                $accomodations = json_encode($accdata);
                                ?>
                                <?php if (isset($_SESSION['emp_id']) && !$update) { ?>
                                    <input class="form-control" id="empcode" value="<?php echo "{$_SESSION['user']} - {$_SESSION['emp_code']}";?>" type="text" name="emp_code" style="pointer-events: auto;">
                                <?php } else { ?>
                                    <!-- <input class="form-control" id="empcode" value="" type="text" name="emp_code" placeholder="Start typing" required autocomplete="off" list="options_list" onkeyup="GetDetail(this.value)"> -->
                                    <div class="autocomplete form-control">
                                        <input class="autocompleteinp form-control" id="empcode" type="text" name="emp_code" placeholder="Employee name" required>
                                    </div>

                                    <datalist id="options_list">
                                        <?php foreach ($detdata as $option) : ?>
                                            <option value="<?= $option; ?>">
                                            <?php endforeach; ?>
                                    </datalist>
                                    <div class="valid-feedback">field is valid!</div>
                                    <div class="invalid-feedback">field cannot be blank!</div>
                                <?php } ?>
                            </div>
                            <div class="col-md-12 pa2">
                                <label for="type">Accomodation name</label>
                                <div class="autocomplete form-control">
                                    <input class="autocompleteinp form-control" id="acccode" type="text" name="acc" placeholder="Accomodation name" required>
                                </div>
                                <div class="invalid-feedback">Please select an option!</div>
                            </div>
                            <div class="col-md-12 pa2">
                                <label for="type">Complaint Type</label>
                                <select class="form-select mt-3" name="category" required>
                                    <option selected disabled value="">Select a category of complaint</option>
                                    <?php
                                    $comp_type = mysqli_query($conn, "SELECT * FROM complaint_type");

                                    foreach ($comp_type as $row) { ?>
                                        <option name="category" value="<?= $row["type_id"] ?>">
                                            <?= $row["complaint_type"]; ?>
                                        </option>
                                    <?php
                                    }

                                    ?>
                                </select>
                                <div class="invalid-feedback">Please select an option!</div>
                            </div>
                            <div class="col-md-12 pa2">
                                <label for="description">Complaint Description</label>
                                <textarea name="description" placeholder="Please describe your problem" cols="30" rows="10" value="<?php echo $description; ?>"></textarea>
                            </div>
                            <div class="form-button mt-3 tc">

                                <?php if ($update == true) : ?>
                                    <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="update" value="update" style="background: #556B2F;">update</button>
                                <?php else : ?>
                                    <button id="submit" class="btn btn-warning f3 lh-copy" style="color: white;" type="submit" name="submit" value="submit">Submit</button>
                                <?php endif ?>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="tc f3 lh-copy mt4">Copyright &copy; 2022 Delta@STAAR. All Rights Reserved</footer>

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
    <script>
        var accomodations = <?php echo $accomodations; ?>;
        autocomplete(document.getElementById("acccode"), accomodations);
    </script>
    <script src="../../js/form.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>