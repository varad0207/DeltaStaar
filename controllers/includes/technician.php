<?php
include 'common.php';
?>

<div class="container">
    <div class="left-side">
        <div class="parent-con">
            <div class="user-icon">

                <img src="../images/technician.png" alt="technician_logo">
            </div>
            <div class="complaint-statistics">

                <div class="statistics-item">Solved Complaints: 100</div>
                <div class="statistics-item">Pending Complaints: 10</div>
                <div class="statistics-item">Assigned to you: 5</div>
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

    //Setup Block
    const dataDoughnut = {
        labels: [
            'Completed',
            'Assigned',
            'Pending'
        ],
        datasets: [{
            label: 'My First Dataset',
            data: [300, 50, 100],
            backgroundColor: [
                'rgb(255, 99, 132)',
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