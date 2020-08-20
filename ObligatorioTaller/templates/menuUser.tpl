{* Smarty *}

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">

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
                        <a class="nav-link" target="_self" href="javascript:changeContainer('bookClass')" {$isClient}> Reserva de Clase </a>
                    </li>
                </ul>
            </div>

            <form action="./DB/Queries/logout.php" >
                <p class="navbar-brand"> {$fullName} </p>
                <button type="submit" class="btn btn-outline-info mr-sm-2">Logout</button>
            </form>
        </div>
    </nav>

</body>
</html>