<?php require "../../controllers/includes/common.php";

if(isset($_REQUEST['employeecode'])){

    $employeecode = $_REQUEST['employeecode'];
    if ($employeecode != "") {
        $row12 = mysqli_fetch_array(mysqli_query($conn, "SELECT employee.*,count(*) as freq FROM employee JOIN employee_outing using(emp_code) where employee.emp_code='$employeecode'"));
        if(empty($row12)){
            die();
        }
    }
}

 ?>
<style>
    #outing-freq {
      position: fixed;
      max-width:240px;
      /* width: 100%; */
      display: none;
      transition: display 1s ease-in-out;
      margin-right: 70vw;
      margin-left: 0;
      margin-bottom: 70vh;
      justify-content: center;
      pointer-events: auto;
    }
    .titlebar{
        height: 5px;
        background: transparent;
        display: flex;
        align-items: center;
        justify-content: right;
    }
    .close {
        font-size: smaller;
        font-weight: bold;
        width: 20px;
        height: 20px;
        outline: none;
        border: none;
        background: red;
        color: #eeeeee;
        cursor: pointer;
        border-radius: 50%;
        align-items: center;
        display: flex;
        justify-content: center;
}

.close:active {
    transform: scale(0.9);
}
.f-div{
    border: 3px solid #fff;
    padding: 10px;
    color:white;
    font-size: smaller;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    text-align: left;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
    @media only screen and (max-width: 1130px) {
      #outing-freq {
        margin-right: 75vw;
      }
    }

    @media only screen and (max-width: 1066px) {
      #outing-freq {
        position: relative;
        margin: 5px auto auto auto;
      }
    }
  </style>
<!-- Frequency div -->
<div class="titlebar">
        <button id="close" class="close material-icons" onclick="document.querySelectorAll('#outing-freq').forEach(a=>a.style.display = 'none');">close</button>
    </div>
<div class="f-div" style="max-width:262px">
    
    <div>
        <p>Employee Name: <?php echo $row12['fname']; ?></p>
        <p>Frequency: <?php echo $row12['freq']; ?></p>
    </div>
</div>