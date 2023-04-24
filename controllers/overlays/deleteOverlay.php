<?php require "../../controllers/includes/common.php";
 ?>

    <!-- overlay code start -->
    <div class="overlay" id="overlay" style="z-index:9999;"> 
        <div class="overlay-window">
            <div class="overlay-window-titlebar">
                <span class="overlay-title">Confirm Delete</span>
                <button id="close" class="close material-icons" onclick="document.querySelectorAll('.overlay').forEach(a=>a.style.display = 'none');">close</button>
            </div>
            <div class="overlay-content" style="color:black;text-align:center">
                This action cannot be un-done<br><br>
                    <div class="btns">
                            <Button class="btn btn-warning btn1"  onclick="document.getElementById('del_response').submit();document.getElementById('overlay').style.display='none'">Yes,Delete</Button>
                            <Button class="btn btn-secondary btn2" onclick="document.querySelectorAll('.overlay').forEach(a=>a.style.display = 'none');">No,Cancel</Button>
                    </div>
            </div>
        </div>
    </div>
    <!-- overlay end -->
