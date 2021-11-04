<?php  
include_once "../../../bd/db.php";
$id = $_GET['id'];
$queryd = "SELECT * FROM tutor WHERE id_cedula=$id";
$resd = mysqli_query($con, $queryd);
while($mostrar=mysqli_fetch_array($resd)){
?>

<html lang="en">

<head>
    <title></title>
    <link rel="stylesheet" href="../../css/estilos.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
</head>

<body>
    <header>
    <div class="container">
        <nav>
            <a href="#" id="icono" class="icono"><img src="../../../img/menu-alt-right-regular-24.png" class="img-icon"></a>
            <div class="enlaces uno" id="enlaces">
                <a href="../index.php">Inicio Administrador</a>
                <a href="../alumnos.php">Alumnos</a>
                <a href="../carreras.php">Carreras</a>
                <a href="../grupos.php">Grupos</a>
                <a href="../tutores.php">Tutores</a>
                <a href="cerrars.php">Cerrar Sesión</a>
            </div>
        </nav>
    </div>

    <div>
        <h1>
            Modificar Tutor
        </h1>
    </div>
    </header>
    <!-- este bloque de codigo hace el efecto de ola de mar en el color del la pagina ya que
    wave significa ¡hola de mar! -->
    <div class="wave">
        <div style="height: 150px; overflow: hidden;" >
            <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" 
                style="stroke: none; fill: #B7EFC5;">
                </path>
            </svg>
        </div>
    </div>
    <center>
    <form method="post">
        <input type="text" name="cedula" value="<?php echo $mostrar['cedula'] ?>"><br><br>
        <input type="text" name="nombre" value="<?php echo $mostrar['tx_nombreuser'] ?>"><br><br>
        <input type="text" name="apellidop" value="<?php echo $mostrar['tx_appaterno'] ?>"><br><br>
        <input type="text" name="apellidom" value="<?php echo $mostrar['tx_apmaterno'] ?>"><br><br>
        <input type="text" name="usuario" value="<?php echo $mostrar['tx_username'] ?>"><br><br>
        <input type="text" name="contraseña" value="<?php echo $mostrar['tx_password'] ?>"><br><br>
        Carrera:
            <select name="carrera">
                <?php
                include_once "../../../bd/db.php";
                $cons="SELECT * FROM carrera";

                $result=mysqli_query($con,$cons);
                $querys = "SELECT * FROM tutor INNER JOIN carrera WHERE tutor.id_cedula=$id and carrera.idcarrera= tutor.carrera_idcarrera";
                $ress = mysqli_query($con, $querys);
                while($mostrars=mysqli_fetch_array($ress)){
                ?>
                    <option value="<?php echo $mostrars['id_cedula'] ?>"><?php echo $mostrars['tx_carrera'] ?></option> <!-- devo hacer esto con las q siguen para vizualizar los datps de mamera correcta-->
                    <option value=""></option> <!-- devo hacer esto con las q siguen para vizualizar los datps de mamera correcta-->
                <?php
                }
                while($mostra=mysqli_fetch_array($result)){

                                
                ?>
                    <option value="<?php echo $mostra['idcarrera'] ?>"><?php echo $mostra['tx_carrera'] ?></option>
                <?php 
                } 
                ?>
            </select>
        
        Cuatrimestre:
            <select name="cuatrimestre">
                <?php
                include_once "../../../bd/db.php";
                $cons="SELECT * FROM cuatrimestre";
                $querys = "SELECT * FROM tutor INNER JOIN cuatrimestre WHERE tutor.id_cedula=$id and cuatrimestre.idcuatrimestre= tutor.cuatrimestre_idcuatrimestre";
                $ress = mysqli_query($con, $querys);
                while($mostrars=mysqli_fetch_array($ress)){
                ?>
                    <option value="<?php echo $mostrars['idcuatrimestre'] ?>"><?php echo $mostrars['tx_cuatrimestre'] ?></option> <!-- devo hacer esto con las q siguen para vizualizar los datps de mamera correcta-->
                    <option value=""></option>
                <?php
                }
                $result=mysqli_query($con,$cons);

                while($mostra=mysqli_fetch_array($result)){

                                
                ?>
                    <option value="<?php echo $mostra['idcuatrimestre'] ?>"><?php echo $mostra['tx_cuatrimestre'] ?></option>
                <?php 
                } 
                ?>
            </select>

        Grupo:
            <select name="grupo">
                <?php
                include_once "../../../bd/db.php";
                $cons="SELECT * FROM grupo";
                $querys = "SELECT * FROM tutor INNER JOIN grupo WHERE tutor.id_cedula=$id and grupo.idgrupo= tutor.grupo_idgrupo";
                $ress = mysqli_query($con, $querys);
                while($mostrars=mysqli_fetch_array($ress)){
                ?>
                    <option value="<?php echo $mostrars['idgrupo'] ?>"><?php echo $mostrars['tx_grupo'] ?></option> <!-- devo hacer esto con las q siguen para vizualizar los datps de mamera correcta-->
                    <option value=""></option>
                <?php
                }
                $result=mysqli_query($con,$cons);

                while($mostra=mysqli_fetch_array($result)){

                                
                ?>
                    <option value="<?php echo $mostra['idgrupo'] ?>"><?php echo $mostra['tx_grupo'] ?></option>
                <?php 
                } 
                ?>
            </select><br><br>

            <button type="submit" class="btn-mod" name="guardar">Guardar</button>
    </form>
    </center>
    <?php }
    if (isset($_REQUEST['regresar'])) {
        # code...
        header('location: ../alumnos.php');
    }

    if (isset($_REQUEST['guardar'])) {
            $cedula = trim($_POST['cedula']);
            $nombre = trim($_POST['nombre']);
            $apellidop = trim($_POST['apellidop']);
            $apellidom = trim($_POST['apellidom']);
            $usuario = trim($_POST['usuario']);
            $contraseña = trim($_POST['contraseña']);
            $carrera = trim($_POST['carrera']);
            $cuatrimestre = trim($_POST['cuatrimestre']);
            $grupo = trim($_POST['grupo']);
        if($cedula=="" and $nombre=="" and $apellidop=="" and $apellidom=="" and $usuario=="" and $contraseña==""){
            ?>
                <h1 style="background-color: #FF9185;
                font-size: 12px;
                padding: 10px;">Asegurese de llenar campos</h1>
            <?php
        }else{
        if (isset($_POST['nombre'])) {
            $cedula = trim($_POST['cedula']);
            $nombre = trim($_POST['nombre']);
            $apellidop = trim($_POST['apellidop']);
            $apellidom = trim($_POST['apellidom']);
            $usuario = trim($_POST['usuario']);
            $contraseña = trim($_POST['contraseña']);
            $carrera = trim($_POST['carrera']);
            $cuatrimestre = trim($_POST['cuatrimestre']);
            $grupo = trim($_POST['grupo']);

            include_once "../../../bd/db.php";

            $query = "UPDATE tutor SET cedula='".$cedula."', tx_nombreuser='".$nombre."', tx_appaterno='".$apellidop."', tx_apmaterno='".$apellidom."', tx_username='".$usuario."', tx_password='".$contraseña."', carrera_idcarrera='".$carrera."', cuatrimestre_idcuatrimestre='".$cuatrimestre."', grupo_idgrupo='".$grupo."', dt_registro=NOW()
            WHERE (id_cedula=$id)";
            $res = mysqli_query($con, $query);
            if ($res) {
                ?>
                <script>
                    window.location.replace("../tutores.php");
                </script>
            <?php
            } else {
            ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    Error <?php echo mysqli_error($con); ?>
                </div>
    <?php

            }
        }  
        }
    }
    ?>
    <script src="../../../js/script.js"></script>
</body>

</html> 