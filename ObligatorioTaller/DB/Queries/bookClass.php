<?php

session_start();
include("../../lib/Config/config_SMARTY.php");

$date = $_POST["date"];
$time = $_POST["time"];

$instructor = $_POST["instructor"];
$dateName = date("w", strtotime($date));

unset($_POST["date"]);
unset($_POST["time"]);
unset($_POST["instructor"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {
    if ($dateName == 0 || $dateName == 6) {
        $_SESSION["errorMessage"] = "No se dictan clases los fines de semana.";
    } else {

        if (strtotime($date) < strtotime(date("Y-m-d"))) {
            $_SESSION["errorMessage"] = "La fecha de reserva no puede ser anterior al dia actual.";
        } else {
            $sql = "SELECT * FROM reservas WHERE fecha = :date AND hora = :time AND instructor_id = :inst";

            $parametros = array();
            $parametros[0] = array("date", $date, "string");
            $parametros[1] = array("time", intval($time), "int");
            $parametros[2] = array("inst", intval($instructor), "int");

            $result = $conn->consulta($sql, $parametros);

            if (!$result || $conn->cantidadRegistros() > 0) {
                $_SESSION["errorMessage"] = "El instructor ya posee una reserva para esa fecha.";
            } else {
                $sql = "INSERT INTO reservas (fecha, hora, instructor_id, usuario_id) ";
                $sql .= "VALUES (:date, :hour, :instructor, :user)";

                $parametros = array();
                $parametros[0] = array("date", $date, "string");
                $parametros[1] = array("hour", intval($time), "int");
                $parametros[2] = array("instructor", intval($instructor), "int");
                $parametros[3] = array("user", intval($_SESSION['userLogged']['usuario_id']), "int");
                
                $result = $conn->consulta($sql, $parametros);
                
                if($result)
                    $_SESSION["successMessage"] = "Reserva almacenada con exito.";
                else
                    $_SESSION["errorMessage"] = "Error al realizar la reserva.";
            }
        }
    }
} else {
    $_SESSION["errorMessage"] = "Error de Conexion";
}

//header('location: ../../index.php');
$conn->desconectar();
