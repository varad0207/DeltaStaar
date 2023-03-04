<div class="chart-container">

    <div class="chartBox">
        <h4 class="text-center p-2">Complaint Types</h4>
        <canvas id="myDoughnutChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script> //Doughnut Chart

    //Setup Block
    const dataDoughnut = {
        labels: [
            'Plumbing',
            'Electrical',
            'Yellow'
        ],
        datasets: [{
            label: 'My First Dataset',
            data: [300, 50, 100],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
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
            aspectRatio: 2
        }

    };

    //Render Block
    const myDoughnutChart = new Chart(
        document.getElementById('myDoughnutChart'), configDoughnut
    );
</script>