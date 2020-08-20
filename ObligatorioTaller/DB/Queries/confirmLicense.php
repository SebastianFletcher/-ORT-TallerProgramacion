<?php

session_start();
include("../../lib/Config/config_SMARTY.php");

$doc = $_POST["document"];

unset($_POST["document"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {

    $sql = "SELECT usuario_id as id FROM usuarios WHERE ci = :document";
    $parametros = array();
    $parametros[0] = array("document", $doc, "string");

    $result = $conn->consulta($sql, $parametros);
    $user = $conn->siguienteRegistro();

    $sql = "INSERT INTO libretas (fecha, usuario_id) ";
    $sql .= "VALUES (:todayDate, :userId)";

    $parametros = array();
    $parametros[0] = array("todayDate", date("Y-m-d"), "string");
    $parametros[1] = array("userId", intval($user["id"]), "int");

    $result = $conn->consulta($sql, $parametros);

    if ($result) {
        $_SESSION["successMessage"] = "Licencia otorgada con exito.";
    } else {
        $_SESSION["errorMessage"] = "Error al otorgada licencia";
    }
} else {
    $_SESSION["errorMessage"] = "Error de Conexion";
}

header('location: ../../index.php');
$conn->desconectar();
