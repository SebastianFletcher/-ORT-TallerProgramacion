<?php

session_start();

date_default_timezone_set("America/Santiago");

include("../../lib/Config/config_SMARTY.php");

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {

    // Obtenemos el ultimo id insetado
    $sql = "SELECT fecha, COUNT( reserva_id ) total FROM reservas WHERE Fecha BETWEEN ( 
            SELECT DATE_ADD( DATE_ADD( LAST_DAY( NOW( ) ) , INTERVAL 1
            DAY ) , INTERVAL -1
            MONTH ) AS first_day
            )
            AND LAST_DAY( NOW( ) )
            GROUP BY fecha
            LIMIT 0 , 30";

    $datos = array();
    $result = $conn->consulta($sql, $datos);

    if ($result) {
        //guardamos en un array multidimensional todos los datos de la consulta
        $i = 0;

        while ($row = $conn->siguienteRegistro()) { // realizamos un ciclo while para traer los agenda encontrados en la base de dato
            // Alimentamos el array con los datos de los agenda
            $datos[$i] = $row;
            $i++;
        }

        $instructores = 0;

        $sql = "SELECT count(*) total FROM instructores";
        $result = $conn->consulta($sql);
        if ($result) {
            $instructores = $conn->siguienteRegistro();
        }

        // Transformamos los datos encontrado en la BD al formato JSON
        $respuesta = array(
            "status" => "OK",
            "data" => $datos,
            "instructores" => $instructores
        );

        echo json_encode($respuesta);
    } else {
        // Si no existen agenda mostramos este mensaje.
        $respuesta = array(
            "status" => "OK"
        );

        echo json_encode($respuesta);
    }

    $conn->desconectar();
} else {
    $respuesta = array(
        "status" => "ERROR"
    );

    echo json_encode($respuesta);
}




