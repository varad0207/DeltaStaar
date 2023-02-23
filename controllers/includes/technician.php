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