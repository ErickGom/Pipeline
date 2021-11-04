<?php 
	session_start();
	if(!isset($_SESSION['rol'])){
		header('location: ../login/index.html');
	}else{
	if($_SESSION['rol'] != 1){
		header('location: ../login/index.html');
	}	
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
</head>
<body>
<header>
        <div class="container">
            <nav>
                <a href="#" id="icono" class="icono"><img src="../img/menu-alt-right-regular-24.png" class="img-icon"></a>
                <div class="enlaces uno" id="enlaces">
                    <a href="web/alumnos.php">Alumnos</a>
                    <a href="web/carreras.php">Carreras</a>
                    <a href="web/grupos.php">Grupos</a>
                    <a href="web/tutores.php">Tutores</a>
                    <a href="web/confirmados.php">Permisos confirmados</a>
                    <a href="web/actions/cerrars.php">Cerrar Sesión</a>
                </div>
            </nav>
        </div>

        <div>
            <h1>
                Bienbenido Administrador @
            </h1>
        </div>
    </header>
    <!-- este bloque de codigo hace el efecto de ola de mar en el color del la pagina ya que
    wave significa ¡hola de mar! -->
    <div class="wave">
        <div style="height: 150px; overflow: hidden;" >
            <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
                style="stroke: none; fill: #fff;">
                </path>
            </svg>
        </div>
    </div>

    <center>
        <?php 
            include_once('../bd/db.php');
            $db = new Database();

            $consulta= $db->connect()->prepare('SELECT * FROM tbl_user INNER JOIN solicitudpermiso_tbl_user INNER JOIN solicitudpermiso INNER JOIN status_permiso WHERE solicitudpermiso_tbl_user.tbl_user_idtbl_user = tbl_user.idtbl_user AND solicitudpermiso_tbl_user.solicitudpermiso_idsolicitudpermiso = solicitudpermiso.idsolicitudpermiso AND solicitudpermiso_tbl_user.status_permiso_idstatus_permiso = status_permiso.idstatus_permiso AND idstatus_permiso=2 ORDER BY tx_appaterno ASC');
            $row = $consulta->fetch(PDO::FETCH_NUM);

            if(isset($row)){
            ?>
                <br><br><br><center>
                <table class="tabla_datos">
                    <thead>
                        <tr id='titulo'>
                        <td>Matricula</td>
                        <td>A. paterno</td>
                        <td>A. materno</td>
                        <td>nombre</td>
                        <td>Fecha</td>
                        <td>Tipo de Permiso</td>
                        <td>Status</td>
                        <td></td>
                        </tr>
                    </thead>

                    <?php
                        $sql='SELECT * FROM tbl_user INNER JOIN solicitudpermiso_tbl_user INNER JOIN solicitudpermiso INNER JOIN status_permiso WHERE solicitudpermiso_tbl_user.tbl_user_idtbl_user = tbl_user.idtbl_user AND solicitudpermiso_tbl_user.solicitudpermiso_idsolicitudpermiso = solicitudpermiso.idsolicitudpermiso AND solicitudpermiso_tbl_user.status_permiso_idstatus_permiso = status_permiso.idstatus_permiso AND idstatus_permiso=2 ORDER BY tx_appaterno ASC';
                        $result=mysqli_query($con,$sql);

                        while($mostrar=mysqli_fetch_array($result)){
                    ?>

                            <tr>
                                <td><?php echo $mostrar['matriculauser'] ?></td>
                                <td><?php echo $mostrar['tx_appaterno'] ?></td>
                                <td><?php echo $mostrar['tx_apmaterno'] ?></td>
                                <td><?php echo $mostrar['tx_nombreuser'] ?></td>
                                <td><?php echo $mostrar['dt_permiso'] ?></td>
                                <td><?php echo $mostrar['tx_tipopermiso'] ?></td>
                                <td><?php echo $mostrar['tx_statuspermiso'] ?></td>
                                <td>
                                    <a class="btn-mod" href="#">Mandar al Foro</a>
                                    <!--actions/rechazado.php?id=<?php # print $mostrar['tbl_user_idtbl_user'] ?> este es el codigo que va dentro del href--> 
                                </td>
                            </tr>
                            <?php 
                        }
                    ?>
                </table>
    </center>
  <?php
}
?>

    <script src="../js/script.js"></script>
</body>
</html>