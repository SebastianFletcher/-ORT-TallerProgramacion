<?php

session_start();

include("../../lib/Config/config_SMARTY.php");

$email = $_POST["user"];
$pass = $_POST["password"];

unset($_POST["user"]);
unset($_POST["password"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {
    $sql = "SELECT * FROM usuarios u ";
    $sql .= "INNER JOIN usuarios_tipos ut ON u.usuario_tipo_id = ut.usuario_tipo_id ";
    $sql .= "WHERE u.email = :mail AND u.password = :pass";

    $parametros = array();
    $parametros[0] = array("mail", $email, "string");
    $parametros[1] = array("pass", md5($pass), "string");

    $result = $conn->consulta($sql, $parametros);

    if ($result && $conn->cantidadRegistros() > 0) {
        $_SESSION["userLogged"] = $conn->siguienteRegistro();
    } else {
        unset($_SESSION["userLogged"]);
        $_SESSION["errorMessage"] = "Usuario / Contraseña incorrecto.";
    }
} else {
    $_SESSION["errorMessage"] = "Error de Conexion";
}

header('location: ../../index.php');
$conn->desconectar();
