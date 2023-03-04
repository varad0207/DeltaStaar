<?php
// Change this connection code to commom.php

$username = "root";
$password = "";
$database = "chartjs";

try {
    $pdo = new PDO("mysql:host=localhost;database=$database", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

// Attempt select query execution
try {
    $sql = "SELECT * FROM chartjs.barchart";
    $result = $pdo->query($sql);
    if ($result->rowCount() > 0) {

        $revenue = array();
        while ($row = $result->fetch()) {
            $revenue[] = $row["revenue"];

        }

        unset($result);
    } else {
        echo "No records matching your query were found.";
    }
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($pdo);
?>

<style>
    .chart-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .chartBox {
        width: 48%;

    }
</style>

<div class="chart-container">
    <div class="chartBox">
        <h4 class="text-center p-2">Accommodation Status</h4>
        <canvas id="myChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    //Accommodation Bar Graph
    //Capacity, Occupied, Available

    //Setup Block
    const revenue = <?php echo json_encode($revenue) ?>
                
        const data = {
        //Can be softcoded by fetching this from Accommodation Table
        labels: ['Madhuban', 'Blue', 'Yellow', 'Green', 'Purple'],
        datasets: [{
            //Total Capacity dataset of each Accommodation
            label: 'Capacity',
            //Write SQL
            data: revenue,
            backgroundColor: 'rgba(75, 192, 192, 0.5',
            borderColor: 'rgb(75, 192, 192)',
            borderWidth: 1
        }, {
            //Total Occupied dataset of each Accommodation
            label: 'Occupied',
            //Write SQL
            data: [10, 20, 30, 40, 50],
            backgroundColor: 'rgba(54, 162, 235, 0.5',
            borderColor: 'rgb(54, 162, 235)',
            borderWidth: 1
        }, {
            label: 'Available',
            //Write SQL
            data: [10, 20, 30, 40, 50],
            backgroundColor: 'rgba(153, 102, 255, 0.5)',
            borderColor: 'rgb(153, 102, 255)',
            borderWidth: 1
        }]
    };

    //Config Block
    const config = {
        type: 'bar',
        data: data,
        options: {
            //aspectRatio: 1.2,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    };



    //Render Block
    const myChart = new Chart(
        document.getElementById('myChart'), config
    );
</script>