<?php
include 'common.php';
$logged=$_SESSION['emp_id'];
$tech_id = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM technician where technician.emp_id='$logged'"));
$complaint_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT count(*) as count FROM jobs where technician_id='{$tech_id['id']}'"));
$count_array = array();

$pending=mysqli_fetch_assoc(mysqli_query($conn, "select count(*) as pending_count from complaints join jobs on complaints.id=jobs.complaint_id join technician on jobs.technician_id=technician.id where complaints.tech_closure_timestamp is NULL and jobs.technician_id='{$tech_id['id']}'"));

// $count_array = $complaint_count['count'];
// array_push($count_array,$complaint_count['count']);
array_push($count_array,$pending['pending_count']);
array_push($count_array,$complaint_count['count']- $pending['pending_count']);                           
$solved = json_encode($count_array);
?>


<div class="container">
    <div class="left-side">
        <div class="parent-con">
            <div class="user-icon">

                <img src="../images/technician.png" alt="technician_logo">
            </div>
            <div class="complaint-statistics">

                <!-- <div class="statistics-item">Assigned to you: <?php // $complaint_count['count']?></div> -->
                <div class="statistics-item">Pending jobs: <?= $pending['pending_count']?></div>
                <div class="statistics-item">Solved jobs: <?=$complaint_count['count']- $pending['pending_count']?></div>
            </div>
        </div>

        <div class="button-con">
            <a href="../views/complaint/tech_jobs.php">
                <button class="button-56" role="button">
                    View Jobs

                </button>
            </a>
        </div>

    </div>
    <div class="right-side">



        <canvas id="myDoughnutChart" class="pt-8" style="margin-top: 12%;"></canvas>
        <h4 class="text-center p-2 pt-4 ">Complaints Information</h4>


    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script> //Doughnut Chart
var solved = <?php echo $solved; ?>;
    //Setup Block
    const dataDoughnut = {
        labels: [
            // 'Assigned jobs',
            'Pending jobs ',
            'Solved jobs'
        ],
        datasets: [{
            label: '',
            data: solved,
            backgroundColor: [
                // 'rgb(255, 99, 132)',
                'rgb(38,166,254)',
                'rgb(255, 205, 86)'
            ],
            hoverOffset: 4
        }]
    };

    //Config Block
    const configDoughnut = {
        type: 'doughnut',
        data: dataDoughnut,
        options: {
            aspectRatio: 1.2,

        }

    };

    //Render Block
    const myDoughnutChart = new Chart(
        document.getElementById('myDoughnutChart'), configDoughnut
    );
</script>
<script src="https://kit.fontawesome.com/319379cac6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>