{* Smarty *}

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">

            <a class="navbar-brand" href="#"> 
                <img src="./imgs/logos/AcademyLogo.png" height="40" width="50"/>
                Academy
            </a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" target="_self" href="javascript:changeContainer('mainPage')"> Inicio </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" target="_self" href="javascript:changeContainer('addInstructor')"> Alta de Instructor </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:changeContainer('approveClient')"> Aprobacion de Cliente </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:changeContainer('confirmDrivingLicense')"> Confirmacion de Libreta </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" target="_self"  href="javascript:changeContainer('classList')"> Listado de Clases </a>
                    </li>
                </ul>
            </div>

            <form action="./DB/Queries/logout.php" >            
                <p class="navbar-brand"> {$fullName} </p>
                <button type="submit" class="btn btn-outline-info mr-sm-2">Logout</button>
            </form>
        </nav>

    </body>
</html>