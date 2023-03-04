<div class="chart-container">

    <div class="chartBox">
        <h4 class="text-center p-2">Water Tankers Line</h4>
        <canvas id="myLineChart"></canvas>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
    const data = {
        labels: labels,
        datasets: [{
            label: 'My First Dataset',
            data: [65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        }]
    };

    const configLine = {
        type: 'line',
        data: data,
    };

    var myLineChart = new Chart(
        document.getElementById('myLineChart'), configLine
    );


</script>