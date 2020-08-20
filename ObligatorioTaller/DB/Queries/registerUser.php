<?php

session_start();

include("../../lib/Config/config_SMARTY.php");

$formEmail = $_POST["formEmail"];
$formName = $_POST["formName"];
$formLastName = $_POST["formLastName"];
$formDocument = $_POST["formDocument"];
$formBirthdate = $_POST["formBirthdate"];
$formAddress = $_POST["formAddress"];
$formPass = $_POST["formPass"];
$formRePass = $_POST["formRePass"];
$formType = 2;

unset($_POST["formEmail"]);
unset($_POST["formName"]);
unset($_POST["formLastName"]);
unset($_POST["formDocument"]);
unset($_POST["formBirthdate"]);
unset($_POST["formAddress"]);
unset($_POST["formPass"]);
unset($_POST["formRePass"]);

$conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
$conn->conectar();

if ($conn) {

    if (!is_numeric($formDocument)) {
        $_SESSION['errorMessage'] = 'El documento ingresado no es valido.';
    } else {
        $age = floor(abs(strtotime($formBirthdate) - strtotime(date("Y-m-d"))) / (365 * 60 * 60 * 24));
        if ($age < 18) {
            $_SESSION['errorMessage'] = 'El usuario debe ser mayor a 18 años.';
        } else {

            if ($formPass != $formRePass) {
                $_SESSION['errorMessage'] = 'Las contraseñas no coinciden.';
            } else {
                $sql = "SELECT * FROM usuarios WHERE email = :email";
                $parametros = array();
                $parametros[0] = array("email", $formEmail, "string");

                $result = $conn->consulta($sql, $parametros);

                if (!$result || $conn->cantidadRegistros() > 0) {
                    $_SESSION['errorMessage'] = 'El email ya se encuentra registrado.';
                } else {
                    //Register 
                    $sql = "INSERT INTO usuarios (email, password, nombre, apellido, ci, direccion, usuario_tipo_id, fecha_nacimiento) ";
                    $sql .= "VALUES (:email, :password, :name, :lastName, :document, :address, :type, :birthdate)";

                    $parametros[0] = array("email", $formEmail, "string");
                    $parametros[1] = array("password", md5($formPass), "string");
                    $parametros[2] = array("name", $formName, "string");
                    $parametros[3] = array("lastName", $formLastName, "string");
                    $parametros[4] = array("document", $formDocument, "string");
                    $parametros[5] = array("address", $formAddress, "string");
                    $parametros[6] = array("type", $formType, "int");
                    $parametros[7] = array("birthdate", $formBirthdate, "string");

                    $result = $conn->consulta($sql, $parametros);
                    
                    //Login 
                    $sql = "SELECT * FROM usuarios u ";
                    $sql .= "INNER JOIN usuarios_tipos ut ON u.usuario_tipo_id = ut.usuario_tipo_id ";
                    $sql .= "WHERE u.email = :mail";

                    $parametros = array();
                    $parametros[0] = array("mail", $formEmail, "string");

                    $result = $conn->consulta($sql, $parametros);
                    
                    $_SESSION["userLogged"] = $conn->siguienteRegistro();
                    $_SESSION["successMessage"] = 'Usuario creado con exito.';
                }
            }
        }
    }
} else {
    $_SESSION['errorMessage'] = 'Error de conexion a la Base de Datos.';
}

header('location: ../../index.php');
$conn->desconectar();
