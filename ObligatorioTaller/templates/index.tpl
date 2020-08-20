{* Smarty *}

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Obligatorio</title>

        <link rel="stylesheet" href="./css/bootstrap/bootstrap.min.css" />
        <link href='./css/main.css' rel='stylesheet' />
        <script src="./js/jquery/jquery-3.5.1.min.js" type="text/javascript"></script>       
        <script src='./js/jquery/main.js'></script>
        <script src='./js/scripts/script.js'></script>
        <script src="./js/bootstrap/bootstrap.min.js"></script>
        <script src="./js/jquery/moment.min.js" type="text/javascript"></script>
        <script src="./js/jquery/fullcalendar.min.js" type="text/javascript"></script>
        <script src="./js/jquery/jspdf.debug.js" type="text/javascript"></script>
        <link rel="icon" type="image/vnd.microsoft.icon" href="./imgs/icon/icon.ico" />
    </head>
    <body>
        {include file="{$menu}"}

        <div id="errorAlert" class="alert alert-danger alert-dismissible fade show" role="alert" {$errorHidden}>
            {$errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert" {$successHidden}>
            {$successMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <br>
        <div id="container">
            {foreach from=$pages item=page}
                {include file="{$page}"}
            {/foreach}
        </div>
    </body>
</html>
