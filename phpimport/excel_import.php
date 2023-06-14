
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Excel Imports</title>
</head>

<body>
    <div class="container">
        <div class="row">
           
                <!-- Accomodation Import -->
                <div class="card mt-3">
                    <div class="card-header">
                        <h4>ACCOMODATION IMPORT</h4>
                    </div>
                    <div class="card-body">
                        <form action="../phpimport/code.php" method="post" enctype="multipart/form-data">
                            <input type="file" name="accomodation_import" class="form-control">
                            <button class="btn btn-success mt-3" type="submit" name="accomodation">Import</button>
                        </form>
                    </div>
                </div>

                <!-- Rooms Import -->
                <div class="card mt-3">
                    <div class="card-header">
                        <h4>ROOMS IMPORT</h4>
                    </div>
                    <div class="card-body">
                        <form action="../phpimport/code.php" method="post" enctype="multipart/form-data">
                            <input type="file" name="rooms_import" class="form-control">
                            <button class="btn btn-success mt-3" type="submit" name="rooms">Import</button>
                        </form>
                    </div>
                </div>

                 <!-- Employee Import -->
            <div class="col-md-12 mt-4">
                <div class="card">
                    <div class="card-header">
                        <h4>EMPLOYEE IMPORT</h4>
                    </div>
                    <div class="card-body">
                        <form action="../phpimport/code.php" method="post" enctype="multipart/form-data">
                            <input type="file" name="employee_import" class="form-control">
                            <button class="btn btn-success mt-3" type="submit" name="employee">Import</button>
                        </form>
                    </div>
                </div>
                <!--Vaccination Import  -->
                <div class="card mt-3">
                    <div class="card-header">
                        <h4>VACCINATION IMPORT</h4>
                    </div>
                    <div class="card-body">
                        <form action="../phpimport/code.php" method="post" enctype="multipart/form-data">
                            <input type="file" name="vaccination_import" class="form-control">
                            <button class="btn btn-success mt-3" type="submit" name="vaccination">Import</button>
                        </form>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <br>
    <br>
</body>

</html>