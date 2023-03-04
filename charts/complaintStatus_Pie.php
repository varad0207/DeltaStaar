<div class="chart-container">
    <div class="chartBox">
        <h4 class="text-center p-2">Complaint Status</h4>
        <canvas id="myPieChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script> //Pie Chart

    //Setup Block
    const dataPie = {
        labels: [
            'Red',
            'Blue',
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
    const configPie = {
        type: 'pie',
        data: dataPie,
        options: {
            aspectRatio: 2
        }
    };



    //Render Block
    const myPieChart = new Chart(
        document.getElementById('myPieChart'), configPie
    );
</script>