<?php

// PROBAR ARCHIVO
if (@$_GET['dataTest']) {
    echo "DATA TEST OK.";
    echo '<pre>';
    var_dump($_POST);

    exit();
}

// EMAIL ENVIADO AL MOMENTO QUE EL CLIENTE AGENDA SU CITA
if (@$_GET['correoRegistro']) {
    $nombre     = @$_POST['nombre'];
    $cedula     = @$_POST['cedula'];
    $telf       = @$_POST['telefono'];
    $fechaCita  = @$_POST['fecha_cita'];
    $horaCita   = @$_POST['hora_cita'];
    $estacion   = @$_POST['estacion'];

    $asunto         = 'Rhelen Arnica Xperience';
    $destinatario   = $_POST['correo'];

    $mensaje = "
    Ud ha agendado una cita en <b>Rhelen Arnica Xperience</b> con los siguientes datos:
    <ul>
        <li><b>Nombre:</b> $nombre</li>
        <li><b>Cedula:</b> $cedula</li>
        <li><b>Teléfono:</b> $telf</li>
        <li><b>Fecha cita:</b> $fechaCita</li>
        <li><b>Hora cita:</b> $horaCita</li>
        <li><b>Estacion:</b> $estacion</li>
    </ul>
    
    Estaremos gustosos de vivir con usted la <b>Rhelen Árnica Xperiences</b> ¡Lo esperamos!
    <br>
    <br>
    Saludos.";

    $cabeceras  = 'MIME-Version: 1.0' . "\r\n";
    $cabeceras .= 'Content-type: text/html; charset=utf-8' . "\r\n";
    $cabeceras .= 'From: Rhelen Arnica Xperience <rhelen.arnica@intervit.com>';

    try {
        if (@!mail($destinatario, $asunto, $mensaje, $cabeceras)) {
            throw new Exception('Mensaje no enviado.');
        } else {
            echo json_encode(['stmt' => "Mensaje enviado"]);
        }
    } catch (Exception $err) {
        echo 'ERROR: ' . $err->getMessage();
    }

    exit();
}

// EMAIL ENVIADO AL CONCLUIR LA CITA CON EL CLIENTE
if (@$_GET['correoFinal']) {

    $nombre         = @$_POST['nombre'];
    $asunto         = 'Rhelen Arnica Xperience';
    $destinatario   = @$_POST['correo'];

    $mensaje = " $nombre, ha sido un inmenso placer para nosotros haber vivido junto a ti la <b>Rhelen Árnica 
    Xperience</b> esperamos compartas tu experiencia en etiquetándonos en tus redes sociales.<br><br>Saludos.
    ";

    $cabeceras  = 'MIME-Version: 1.0' . "\r\n";
    $cabeceras .= 'Content-type: text/html; charset=utf-8' . "\r\n";
    $cabeceras .= 'From: Rhelen Arnica Xperience <rhelen.arnica@intervit.com>';

    try {
        if (@!mail($destinatario, $asunto, $mensaje, $cabeceras)) {
            throw new Exception('Mensaje no enviado.');
        } else {
            echo json_encode(['stmt' => "Mensaje enviado"]);
        }
    } catch (Exception $err) {
        echo 'ERROR: ' . $err->getMessage();
    }

    exit();
}
