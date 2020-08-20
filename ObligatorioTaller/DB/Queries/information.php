<?php

session_start();

include_once("./lib/Config/config_SMARTY.php");

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {

    //CANTIDAD DE USUARIOS CURSANDO 
    $sql = "SELECT count(distinct(usuario_id)) reservs FROM reservas WHERE fecha >= :todayDate";

    $parametros = array();
    $parametros[0] = array("todayDate", date("Y-m-d"), "string");

    $result = $conn->consulta($sql, $parametros);

    if ($result)
        $_SESSION["countRegisteredUsers"] = $conn->siguienteRegistro()['reservs'];
    else
        unset($_SESSION["countRegisteredUsers"]);

    //CANTIDAD DE USUARIOS QUE APROBARON
    $sql = "SELECT count(*) as libs FROM libretas ";

    $result = $conn->consulta($sql, $parametros);

    if ($result)
        $_SESSION["countApprovedUsers"] = $conn->siguienteRegistro()['libs'];
    else
        unset($_SESSION["countApprovedUsers"]);

    //CANTIDAD CLIENTES A APROVAR
    $sql = "SELECT * FROM usuarios ";
    $sql .= "WHERE usuario_tipo_id = :userType ";

    $parametros = array();
    $parametros[0] = array("userType", 2, "int");

    $result = $conn->consulta($sql, $parametros);

    if ($result)
        $_SESSION["pendingClients"] = $conn->restantesRegistros();
    else
        unset($_SESSION["pendingClients"]);

    //LICENCIAS PENDIENTES 
    $sql = "SELECT u.* FROM reservas r ";
    $sql .= "INNER JOIN usuarios u ON u.usuario_id = r.usuario_id ";
    $sql .= "WHERE r.usuario_id NOT IN ( SELECT usuario_id FROM libretas ) ";
    $sql .= "GROUP BY u.usuario_id ";
    $sql .= "HAVING COUNT(*) >= :countClass ";

    $parametros = array();
    $parametros[0] = array("countClass", 15, "int");

    $result = $conn->consulta($sql, $parametros);

    if ($result)
        $_SESSION["pendingLicences"] = $conn->restantesRegistros();
    else
        unset($_SESSION["pendingLicences"]);

    //INSTRUCTORES
    $sql = "SELECT * FROM instructores ";

    $parametros = array();

    $result = $conn->consulta($sql, $parametros);
    
    

    if ($result)
        $_SESSION["allInstructors"] = $conn->restantesRegistros();
    else
        unset($_SESSION["allInstructors"]);
    
    
    //CLASES DE INSTRUCTORES
    $sql = "SELECT * FROM reservas r ";
    $sql .= "INNER JOIN usuarios u ON u.usuario_id = r.usuario_id ";
    $sql .= "ORDER BY fecha, hora";
    
    $result = $conn->consulta($sql);

    if ($result)
        $_SESSION["clasesUsuarios"] = $conn->restantesRegistros();
    else
        unset($_SESSION["clasesUsuarios"]);


} else {
    $_SESSION["errorMessage"] = "Error de Conexion";
}

$conn->desconectar();
