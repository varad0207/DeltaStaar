<?php include('../../controllers/includes/common.php');
include('../../controllers/rooms_controller.php');

if (!isset($_SESSION["emp_id"]))
    header("location:../../index.php");
// check rights
$isPrivilaged = 0;
$rights = unserialize($_SESSION['rights']);
if ($rights['rights_rooms'] > 1) {
    $isPrivilaged = $rights['rights_rooms'];
} else
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');
if ($isPrivilaged == 5 || $isPrivilaged == 4)
    die('<script>alert("You dont have access to this page, Please contact admin");window.location = history.back();</script>');

$update = "";
$acc_id = "";
if (isset($_GET['edit'])) {
    $room_id = $_GET['edit'];
    $update = true;
    $record = mysqli_query($conn, "SELECT * FROM rooms WHERE id='$room_id'") or die(mysqli_error($conn));

    $n = mysqli_fetch_array($record);

    $acc_id = $n['acc_id'];
    // echo $acc_id;
    $room_no = $n['room_no'];
    $room_cap = $n['room_capacity'];
    $status = $n['status'];
    $curr_room_cap = $n['current_room_occupancy'];
    $accRow = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM accomodation where acc_id={$acc_id}"));
    $acc_name = $accRow['acc_name'];
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
    <title>Delta@STAAR | Add Room</title>
    <link rel="stylesheet" href="../../css/sidebar.css">
    <link rel="stylesheet" href="../../css/form.css">
    <link rel="stylesheet" href="../../css/style1.css">
    <link rel="stylesheet" href="../../css/autocompleteCSS.css">

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/tachyons@4.12.0/css/tachyons.min.css" />
</head>

<body class="b ma2">
    <style>
        span {
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
                        <?php if ($update == true) { ?>
                            <h1 class="f2 lh-copy tc" style="color: white;">Edit Room Details</h1>
                        <?php } else { ?>
                            <h1 class="f2 lh-copy tc" style="color: white;">Enter Room Details</h1>
                        <?php } ?>
                        <form class="f3 lh-copy" action="../../controllers/rooms_controller.php" method="post" id="myForm">

                            <?php if ($update == true) { ?>
                                <input class="form-control" type="hidden" name="id" value="<?php echo $room_id ?>">

                                <div class="col-md-12 pa2">
                                    <label for="accomodation">Accomodation</label>
                                    <input class="form-control" type="hidden" name="acc" id="acc" value="<?php echo $acc_id ?>">
                                    <input class="form-control" type="text" value="<?php echo $acc_name ?>" readonly>
                                    <small></small>
                                </div>
                                <div class="col-md-12 pa2">
                                    <label for="room_no">Room Number</label>
                                    <input class="form-control" type="text" name="room_no" id="rommno" value="<?php echo $room_no ?>" readonly>
                                    <small></small>
                                </div>
                            <?php } else { 
                                $accdet = "select acc_id,concat(acc_name,' - ',acc_code) as name from accomodation";
                                $detresult = mysqli_query($conn, $accdet);
                                $accdata = array();
                                while ($detrow = mysqli_fetch_assoc($detresult)) {
                                    $accdata[] = $detrow['name'];
                                }
                                $accomodations = json_encode($accdata);
                                ?>
                                <div class="col-md-12 pa2 autocomplete">
                                    <label for="accomodation">Accomodation</label>
                                    <input class="autocompleteinp form-control" id="acccode" type="text" name="acc" placeholder="Accomodation name" required>
                                    <small></small>
                                </div>
                                <div class="col-md-12 pa2">
                                    <label for="room_no">Room Number</label>
                                    <input class="form-control" type="text" name="room_no" id="rommno" placeholder="Room Number">
                                    <small></small>
                                </div>
                            <?php } ?>

                            <div class="col-md-12 pa2">
                                <label for="room_cap">Room Capacity</label>
                                <input class="form-control" type="number" name="room_cap" id="roomcap" value="<?php echo $room_cap ?>" placeholder="Room Capacity">
                                <small></small>
                            </div>

                            <div class="form-button mt-3 tc">
                                <?php if ($update == true) : ?>
                                    <button id="submit" name="update" value="update" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Update</button>
                                <?php else : ?>
                                    <button id="submit" name="submit" value="submit" type="submit" class="btn btn-warning f3 lh-copy" style="color: white;">Submit</button>
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
    <script src="../../js/validateRoom.js"></script>
    <script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- For dropdown function in User Profile / Config button -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
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
        var accomodations = <?php echo $accomodations; ?>;
        autocomplete(document.getElementById("acccode"), accomodations);
    </script>
</body>

</html>