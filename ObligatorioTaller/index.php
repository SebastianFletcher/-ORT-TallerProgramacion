<?php

session_start();
include_once("./lib/Config/config_SMARTY.php");

if (!isset($_SESSION['userLogged'])) {
    $smarty->assign("menu", "./loginMenu.tpl");
    $smarty->assign("pages", $unregisteredPages);
} else {
    $smarty->assign("fullName", $_SESSION['userLogged']['nombre'] . " " . $_SESSION['userLogged']['apellido']);
    $isAdmin = $_SESSION['userLogged']['descripcion'] == 'Administrador';
    $isClient = $_SESSION['userLogged']['descripcion'] == 'Cliente';

    if ($isAdmin) {
        $smarty->assign("menu", "./menuAdmin.tpl");
        $smarty->assign("pages", $adminPages);
    } else {
        $smarty->assign("pages", $userPages);
        $smarty->assign("menu", "./menuUser.tpl");
        if($isClient)
            $smarty->assign("isClient", "");
        else
             $smarty->assign("isClient", "hidden");
    }
}

include './DB/Queries/information.php';

$smarty->assign("registerUsers", $_SESSION['countRegisteredUsers']);
$smarty->assign("approvedUsers", $_SESSION['countApprovedUsers']);
$smarty->assign("successHidden", 'hidden');
$smarty->assign("errorHidden", 'hidden');

if (isset($_SESSION['errorMessage'])) {
    $smarty->assign("errorMessage", $_SESSION['errorMessage']);
    $smarty->assign("errorHidden", '');
    unset($_SESSION['errorMessage']);
}

if (isset($_SESSION['successMessage'])) {
    $smarty->assign("successMessage", $_SESSION['successMessage']);
    $smarty->assign("successHidden", '');
    unset($_SESSION['successMessage']);
}

if (isset($_SESSION['pendingClients'])) {
    $smarty->assign("pendingClients", $_SESSION['pendingClients']);
}

if (isset($_SESSION['pendingLicences'])) {
    $smarty->assign("pendingLicences", $_SESSION['pendingLicences']);
}

if (isset($_SESSION['allInstructors'])) {
    $smarty->assign("allInstructors", $_SESSION['allInstructors']);
}

if (isset($_SESSION['clasesUsuarios'])) {
    $smarty->assign("clasesUsuarios", $_SESSION['clasesUsuarios']);
}

$smarty->display("index.tpl");
