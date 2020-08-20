<?php

session_start();
include("../../lib/Config/config_SMARTY.php");

$formName = $_POST['name'];
$formLastName = $_POST['lastname'];
$formDueDate = $_POST['dueDate'];
$formDocument = $_POST['document'];
$formBirthdate = $_POST['birthDate'];

unset($_POST["name"]);
unset($_POST["lastname"]);
unset($_POST["dueDate"]);
unset($_POST["document"]);
unset($_POST["birthDate"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {

    if (!is_numeric($formDocument)) {
        $_SESSION['errorMessage'] = 'El documento ingresado no es valido.';
    } else {
        $age = floor(abs(strtotime($formBirthdate) - strtotime(date("Y-m-d"))) / (365 * 60 * 60 * 24));
        if ($age < 18) {
            $_SESSION['errorMessage'] = 'El Instructor debe tener al menos 18 años.';
        } else {
            if (strtotime($formBirthdate) > strtotime($formDueDate)) {
                $_SESSION['errorMessage'] = 'La fecha de Vencimiento no puede ser menor a la fecha de Nacimiento.';
            } else {
                if (strtotime($formDueDate) < strtotime(date("Y-m-d"))) {
                    $_SESSION['errorMessage'] = 'La libreta se encuentra vencida.';
                } else {
                    $sql = "INSERT INTO instructores (nombre, apellido, fecha_nacimiento, ci, vencimiento) ";
                    $sql .= "VALUES (:name, :lastName, :birthdate, :document, :duedate)";

                    $parametros = array();
                    $parametros[0] = array("name", $formName, "string");
                    $parametros[1] = array("lastName", $formLastName, "string");
                    $parametros[2] = array("birthdate", $formBirthdate, "string");
                    $parametros[3] = array("document", $formDocument, "string");
                    $parametros[4] = array("duedate", $formDueDate, "string");

                    $result = $conn->consulta($sql, $parametros);
                    $_SESSION['successMessage'] = "Instructor creado con exito.";
                }
            }
        }
    }
} else {
    $_SESSION['errorMessage'] = "Error de conexion a la Base de Datos.";
}

header('location: ../../index.php');
$conn->desconectar();
