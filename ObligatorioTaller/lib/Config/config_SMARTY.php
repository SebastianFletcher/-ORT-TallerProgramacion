<?php

//Incluyo configuraciones
require_once($_SERVER['DOCUMENT_ROOT']."/ObligatorioTaller/DB/config.php");
require_once($_SERVER['DOCUMENT_ROOT']."/ObligatorioTaller/lib/Smarty/Smarty.class.php");
require_once($_SERVER['DOCUMENT_ROOT']."/ObligatorioTaller/lib/DB/ConexionDB.php");

//Defino directorios
define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'/ObligatorioTaller/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'/ObligatorioTaller/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'/ObligatorioTaller/tmp/configs/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'/ObligatorioTaller/tmp/cache/');

//Inicializo Smarty
$smarty = new Smarty;
//Designacion de Directorios
$smarty->template_dir = TEMPLATE_DIR;
$smarty->compile_dir = COMPILER_DIR;
$smarty->config_dir = CONFIG_DIR;
$smarty->cache_dir = CACHE_DIR;

?>