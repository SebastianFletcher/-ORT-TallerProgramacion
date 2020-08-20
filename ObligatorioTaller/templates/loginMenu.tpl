{* Smarty *}

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark justify-content-between">
            <a class="navbar-brand" href="#"> 
                <img src="./imgs/logos/AcademyLogo.png" height="40" width="50"/>
                Academy
            </a>

            <form class="form-inline" method="POST" action="./DB/Queries/login.php" >
                <input name="user" class="form-control mr-sm-2" type="text" placeholder="Username" required>
                <input name="password" class="form-control mr-sm-2" type="password" placeholder="Password" required>
                <button type="submit" class="btn btn-outline-success mr-sm-2">Login</button>
                <button type="button" class="btn btn-outline-info mr-sm-2" data-toggle="modal" data-target="#registerModal">Register</button>
            </form>
        </nav>

        {include file="./registerUser.tpl"}
        
    </body>
</html>