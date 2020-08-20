<?php

session_start();
include("../../lib/Config/config_SMARTY.php");

$doc = $_POST["document"];

unset($_POST["document"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {
    $sql = "UPDATE usuarios SET usuario_tipo_id = :type WHERE ci = :document";

    $parametros = array();
    $parametros[0] = array("type", 3, "int");
    $parametros[1] = array("document", $doc, "string");

    $result = $conn->consulta($sql, $parametros);

    if ($result) {
        $_SESSION["successMessage"] = "Usuario actualizado con exito.";
    } else {
        $_SESSION["errorMessage"] = "Error al actualziar usuario";
    }
} else {
    $_SESSION["errorMessage"] = "Error de Conexion";
}

header('location: ../../index.php');
$conn->desconectar();
