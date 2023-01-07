<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

    <link rel="stylesheet" type="text/css" href="../css/AccommodationView.css">

    <!--Favicon link-->
    <link rel="icon" type="image/x-icon" href="../images/logo-no-name-circle.png">
    <title>Accommodation View</title>

</head>

<body>
    <div style="color:white;">Add Navbar</div>
    <div class="" style="margin: 0% 5.1%;">
        <div class="row">
            <div class="col-1">
                <!--Link back page, remmove target and rel if you dont want it to open the link in a new tab-->
                <a role="button" href="#" target="_blank" rel="noopener noreferrer">
                    <i class="bi bi-arrow-left-circle" style="font-size: 2rem; color: white;"></i>
                </a>
            </div>
            <div class="col-9">
                <h1 class="text-center">Accommodation</h1>
            </div>
            <div class="col ml-5 sort">
                <a class="button" role="button" href="#">
                    <i class="bi bi-sort-down-alt" style="font-size: 1.5rem; color: white;">Sort by</i>
                </a>

            </div>
        </div>
    </div>

    <div class="table-div">

        <div class="table-responsive bg-white">
            <table class="table table-hover m-0">
                <thead style="border: 2px solid black;">
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>LOCATION</th>
                        <th>WARDEN INCHARGE</th>
                        <th>SECURITY INCHARGE</th>
                        <th>STATUS</th>
                        <th>EDIT</th>
                    <tr>
                </thead>
                <tbody>


                    <tr>
                        <td>
                            1
                        </td>
                        <td>
                            Madhuban
                        </td>
                        <td>
                            Panjim
                        </td>
                        <td>
                            Varad Kelkar
                        </td>
                        <td>
                            Sanketh Shenoy
                        </td>
                        <td>
                            <!--Green Circle-->
                            <!--if else lagao available/not-->
                            <i class="bi bi-circle-fill" style="font-size: 1.2rem; color: lightgreen;"></i>

                        </td>
                        <td>
                            <a class="button" role="button" href="#">
                                <i class="bi bi-pencil-square" style="font-size: 1.2rem; color: black;"></i>
                            </a>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            2
                        </td>
                        <td>
                            Soccer
                        </td>
                        <td>
                            Miramar
                        </td>
                        <td>
                            Vadiraj Inamdar
                        </td>
                        <td>
                            Shubham Tendulkar
                        </td>
                        <td>
                            <!--Red Circle-->
                            <i class="bi bi-circle-fill" style="font-size: 1.2rem; color: red;"></i>

                        </td>
                        <td>

                        </td>
                    </tr>



                </tbody>
            </table>
        </div>
        <br>


    </div>
    <div class="" style="margin:2% 5%;">
        <div class="row">
            <div class="col-2 sort">

                <!--Link back page, remmove target and rel if you dont want it to open the link in a new tab-->
                <a role="button" href="#" target="_blank" rel="noopener noreferrer">
                    <i class="bi bi-file-earmark-pdf" style="font-size: 1.5rem; color: white;">Export</i>
                </a>
            </div>
            <div class="col-8">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-2">

                <a role="button" class="btn btn-light" href="#">
                    Add Accommodation
                </a>

            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>