<div class="chart-container">
    <!-- Ignore Comments for now, only this div below is included + scripting -->
    <!-- Refer accommodationStatus_Bar.php if needed -->
    <div class="chartBox">
        <h4 class="text-center p-2">Water Tankers</h4>
        <!-- <canvas id="myLineChart"></canvas> -->
    </div>
    <!-- </div> -->

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <?php include('../controllers/includes/common.php');
    // try {
    //     $tanker_detail = "SELECT
    //     MONTH(t.timestamp) AS 'month',
    //     YEAR(t.timestamp) AS 'year',
    //     tv.id AS vendor_id,
    //     tv.vname AS 'vendor_name',
    //     COUNT(*) AS 'count_per_month'
    //     FROM
    //         tankers t
    //     JOIN
    //         tanker_vendors tv ON tv.id = t.vendor_id
    //     GROUP BY
    //         MONTH(t.timestamp),
    //         YEAR(t.timestamp),
    //         tv.id,
    //         tv.vname
    //     ORDER BY
    //         YEAR(t.timestamp),
    //         MONTH(t.timestamp),
    //         tv.id";
    // $result = mysqli_query($conn, $tanker_detail);

    // $months = array();
    // for ($i = 1; $i <= 12; $i++) {
    //     $months[$i] = array();
    // }

    // while ($row = mysqli_fetch_assoc($result)) {
    //     $entry = array(
    //         'month' => $row['month'],
    //         'year' => $row['year'],
    //         'vendor_id' => $row['vendor_id'],
    //         'vendor_name' => $row['vendor_name'],
    //         'count_per_month' => $row['count_per_month']
    //     );

    //     $month = $entry['month'];
    //     $months[$month][] = $entry;
    // }

    // foreach ($months as $month => $data) {
    //     echo $month . ': ' . count($data) . '<br>';
    // }
    // $tanker_detail = "SELECT
    //     MONTH(t.timestamp) AS 'month',
    //     YEAR(t.timestamp) AS 'year',
    //     tv.id AS vendor_id,
    //     tv.vname AS 'vendor_name',
    //     COUNT(*) AS 'count_per_month'
    //     FROM
    //         tankers t
    //     JOIN
    //         tanker_vendors tv ON tv.id = t.vendor_id
    //     GROUP BY
    //         MONTH(t.timestamp),
    //         YEAR(t.timestamp),
    //         tv.id,
    //         tv.vname
    //     ORDER BY
    //         YEAR(t.timestamp),
    //         MONTH(t.timestamp),
    //         tv.id";
    // $result = mysqli_query($conn, $tanker_detail);

    // $months = array();
    // for ($i = 1; $i <= 12; $i++) {
    //     $months[$i] = 0;
    // }

    // while ($row = mysqli_fetch_assoc($result)){
    //     $month = $row['month'];
    //     $count = $row['count_per_month'];
    //     $months[$month] = $count;
    // }


    // //     // Use the $months array as needed for further processing or display
    // } catch (mysqli_sql_exception $e) {
    //  die("ERROR: Could not able to execute. " . $e->getMessage());
    //  }
    ?>

    <script>
        //Dummy data, Write SQL queries here
        //     var xValues = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
        // var yValues = [
        //
        // ];

        // new Chart("myLineChart", {
        //     type: "bar",
        //     data: {
        //         labels: xValues,
        //         datasets: [{
        //             label: "Number of Trips",
        //             fill: false,
        //             lineTension: 0,
        //             backgroundColor: 'rgb(54, 162, 235)',
        //             borderColor: 'rgba(153, 102, 255, 0.5)',
        //             data: yValues
        //         }]
        //     },
        //     options: {
        //         scales: {
        //             y: {
        //                 beginAtZero: true
        //             }
        //         }
        //     }
        // });


        //      function getRandomColor() {
        //         var letters = "0123456789ABCDEF";
        //         var color = "#";
        //         for (var i = 0; i < 6; i++) {
        //             color += letters[Math.floor(Math.random() * 16)];
        //         }
        //         return color;
        //     }

        // var xValues = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
        //     var yValues = [
        //     <?php echo ($months[1]); ?>,
        //     <?php echo ($months[2]); ?>,
        //     <?php echo ($months[3]); ?>,
        //     <?php echo ($months[4]); ?>,
        //     <?php echo ($months[5]); ?>,
        //     <?php echo ($months[6]); ?>,
        //     <?php echo ($months[7]); ?>,
        //     <?php echo ($months[8]); ?>,
        //     <?php echo ($months[9]); ?>,
        //     <?php echo ($months[10]); ?>,
        //     <?php echo ($months[11]); ?>,
        //     <?php echo ($months[12]); ?>
        //     ];

        //     new Chart("myBarChart", {
        //         type: "bar",
        //         data: {
        //             labels: xValues,
        //             datasets: [{
        //                 label: "Number of Trips",
        //                 backgroundColor: 'rgb(54, 162, 235)',
        //                 borderColor: 'rgba(153, 102, 255, 0.5)',
        //                 data: yValues
        //             }]
        //         },
        //         options: {
        //             scales: {
        //                 y: {
        //                     beginAtZero: true
        //                 }
        //             }
        //         }
        //     });
        var x = 0;
    </script>

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

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <canvas id="myBarChart"></canvas>
    <script>
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
</div>