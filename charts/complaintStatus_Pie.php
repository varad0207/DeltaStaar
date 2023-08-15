<?php
include('../controllers/includes/common.php');

$complaint_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT count(*) as count FROM complaints where 1=1"));

$count_array = array();
$pending = mysqli_fetch_assoc(mysqli_query($conn, "select count(*) as pending_count from complaints where complaints.tech_closure_timestamp is NULL"));
array_push($count_array, $pending['pending_count']);
array_push($count_array, $complaint_count['count'] - $pending['pending_count']);
$solved = json_encode($count_array);
?>

<!-- Only this div below is included + scripting -->
<div class="chartBox">
    <h5 class="text-center">Complaint Summary</h5>
    <canvas id="myPieChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script> //Pie Chart
    var solved = <?php echo $solved; ?>;
    //Setup Block
    const dataPie = {
        labels: [
            
            'Pending jobs ',
            'Raised jobs'
        ],
        datasets: [{
            label: 'Count',
            data: solved,
            backgroundColor: [
                
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