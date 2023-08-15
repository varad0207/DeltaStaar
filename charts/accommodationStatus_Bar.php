<?php
include('../controllers/includes/common.php'); 

// Attempt select query execution
try {
    $sql = "SELECT accomodation.acc_name,sum(rooms.current_room_occupancy)as occupancy,sum(rooms.room_capacity)as capacity,    (SUM(rooms.room_capacity)-SUM(rooms.current_room_occupancy)) AS available FROM accomodation join rooms using(acc_id) group by rooms.acc_id";
    $res = mysqli_query($conn,$sql);
    $data = array();
    $data1 = array();
    $data2 = array();
    $data3 = array();

    while($row = mysqli_fetch_assoc($res)){
        array_push($data,$row['capacity']);
        array_push($data1,$row['occupancy']);
        array_push($data2,$row['available']);
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

<!-- Only this div below is included + scripting -->
<div class="chartBox">
    <h5 class="text-center">Accommodation Status</h5>
    <canvas id="myChart"></canvas>
</div>


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
        labels: solved3,
        //labels: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC', 'Jan'],
        datasets: [{
            axis: 'y',
            //Total Capacity dataset of each Accommodation
            label: 'Capacity',
            data: solved,
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 255, 255)',
            borderWidth: 1
        }, {
            //Total Occupied dataset of each Accommodation
            axis: 'y',
            label: 'Occupied',
            data: solved1,
            backgroundColor: 'rgb(54, 162, 235)',
            borderColor: 'rgb(255, 255, 255)',
            borderWidth: 1
        }, {
            axis: 'y',
            label: 'Available',
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
            aspectRatio: 1.1, // Default aspect ratio
            indexAxis: 'y',
            scales: {
                x: {
                    beginAtZero: true
                }
            }
        }
    };   

    //Render Block
    const myChart = new Chart(
        document.getElementById('myChart'), config
    );

    // Function to create or update chart instance with modified aspect ratio
    function createOrUpdateChart() {
        const screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

        if (screenWidth <= 768) { // Adjust this value as needed for your mobile breakpoint
            config.options.aspectRatio = 0.8; // Update the aspect ratio for mobile screens
        } else {
            config.options.aspectRatio = 1.1; // Reset aspect ratio for larger screens
        }

        if (myChart) {
            myChart.destroy(); // Destroy the existing chart instance
        }

        myChart = new Chart(
            document.getElementById('myChart'),config
        ); // Create a new chart instance with the updated options
    }

    // Call the function initially
    createOrUpdateChart();

</script>