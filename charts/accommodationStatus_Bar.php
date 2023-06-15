<?php
// establishing db connection
// $username = "root";
// $password = "";
// $database = "deltastaar";

// try {
//     $pdo = new PDO("mysql:host=localhost;dbname=$database", $username, $password);
//     // Set the PDO error mode to exception
//     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// } catch (PDOException $e) {
//     die("ERROR: Could not connect. " . $e->getMessage());
// }
include('../controllers/includes/common.php'); 

// Attempt select query execution
try {
    $sql = "SELECT no_of_rooms,occupied_rooms,available_rooms,acc_name FROM accomodation";
    $res = mysqli_query($conn,$sql);
    $data = array();
    $data1 = array();
    $data2 = array();
    $data3 = array();

    while($row = mysqli_fetch_assoc($res)){
        array_push($data,$row['no_of_rooms']);
        array_push($data1,$row['occupied_rooms']);
        array_push($data2,$row['available_rooms']);
        array_push($data3,$row['acc_name']);
    }

    $solved = json_encode($data);
    $solved1 = json_encode($data1);
    $solved2 = json_encode($data2);
    $solved3 = json_encode($data3);

    // print json_encode($data3);

} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($pdo);
?>

<!--<style>
    .chart-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .chartBox {
        width: 48%;

    }
</style>-->

<!-- <div class="chart-container"> -->
    <!-- Ignore Comments for now, only this div below is included + scripting -->
    <div class="chartBox">
        <h4 class="text-center p-2">Accommodation Status</h4>
        <canvas id="myChart"></canvas>
    </div>
<!-- </div> -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
    //Accommodation Bar Graph
    //Capacity, Occupied, Available

    //Setup Block
    var solved = <?php echo $solved; ?>;
    var solved1 = <?php echo $solved1; ?>;
    var solved2 = <?php echo $solved2; ?>;
    var solved3 = <?php echo $solved3; ?>;

    const data = {
        //Can be softcoded by fetching this from Accommodation Table
        labels: solved3,
        datasets: [{
            //Total Capacity dataset of each Accommodation
            label: 'Capacity',
            //Write SQL
            data: solved,
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 255, 255)',
            borderWidth: 1
        }, {
            //Total Occupied dataset of each Accommodation
            label: 'Occupied',
            //Write SQL
            data: solved1,
            backgroundColor: 'rgb(54, 162, 235)',
            borderColor: 'rgb(255, 255, 255)',
            borderWidth: 1
        }, {
            label: 'Available',
            //Write SQL
            data: solved2,
            backgroundColor: 'rgb(255, 205, 86)',
            borderColor: 'rgb(255, 255, 255)',
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