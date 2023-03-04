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

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../images/logo-no-name-circle.png">
    <title>Admin Dashboard</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


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
</head>

<body>

    <?php
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



    <div class="chart-container">
        <div class="chartBox">
            <h4 class="text-center p-2">Accommodation Status</h4>
            <canvas id="myChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Complaint Types</h4>
            <canvas id="myDoughnutChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Complaint Status</h4>
            <canvas id="myPieChart"></canvas>
        </div>
        <div class="chartBox">
            <h4 class="text-center p-2">Water Tankers Line</h4>
            <canvas id="myLineChart"></canvas>
        </div>
        <!--
        <div class="chartBox">
            <h4 class="text-center p-2">Nos.of trips by each Vendor</h4>
            <canvas id=""></canvas>
        </div>
        -->
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
                //Total Capacity dataset of each Accommodation
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

</body>

</html>