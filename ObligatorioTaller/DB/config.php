<?php

define("MOTOR", "mysql");
define("SERVIDOR", "localhost");
define("BASE", "obligatorio");
define("USUARIO", "root");
define("CLAVE", "root");

$unregisteredPages = array('./informationPage.tpl');

$adminPages = array('./informationPage.tpl', './approveClient.tpl','registerInstructor.tpl', './confirmDrivingLicense.tpl','classList.tpl');
$userPages = array('./informationPage.tpl', './bookClass.tpl'); 
?>