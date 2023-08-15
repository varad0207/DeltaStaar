<!-- Only this div below is included + scripting -->
<div class="chartBox">
    <h5 class="text-center">Water Tankers</h5>
    <canvas id="myBarChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<?php include('../controllers/includes/common.php');?>

<?php
try {
    $tanker_detail = "SELECT
    MONTH(t.timestamp) AS 'month',
    YEAR(t.timestamp) AS 'year',
    tv.id AS vendor_id,
    tv.vname AS 'vendor_name',
    COUNT(*) AS 'count_per_month'
    FROM
        tankers t
    JOIN
        tanker_vendors tv ON tv.id = t.vendor_id
    GROUP BY
        MONTH(t.timestamp),
        YEAR(t.timestamp),
        tv.id,
        tv.vname
    ORDER BY
        YEAR(t.timestamp),
        MONTH(t.timestamp),
        tv.id";
    $result = mysqli_query($conn, $tanker_detail);

    $months = array();
    for ($i = 1; $i <= 12; $i++) {
        $months[$i] = 0;
    }

    while ($row = mysqli_fetch_assoc($result)) {
        $month = $row['month'];
        $count = $row['count_per_month'];
        $months[$month] = $count;
    }
} catch (mysqli_sql_exception $e) {
    die("ERROR: Could not able to execute. " . $e->getMessage());
}
?>
<script>
    //var xValues = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP'];
    var xValues = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
    var yValues = [
        <?php echo $months[1]; ?>,
        <?php echo $months[2]; ?>,
        <?php echo $months[3]; ?>,
        <?php echo $months[4]; ?>,
        <?php echo $months[5]; ?>,
        <?php echo $months[6]; ?>,
        <?php echo $months[7]; ?>,
        <?php echo $months[8]; ?>,
        <?php echo $months[9]; ?>,
        <?php echo $months[10]; ?>,
        <?php echo $months[11]; ?>,
        <?php echo $months[12]; ?>
    ];

    new Chart("myBarChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                label: "Number of Trips",
                backgroundColor: 'rgb(54, 162, 235)',
                borderColor: 'rgba(153, 102, 255, 0.5)',
                data: yValues
                //data: [65, 59, 80, 81, 56, 55, 40, 150]
            }]
        },
        options: {           
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>