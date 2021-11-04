<?php
include_once('../bd/db.php');
session_start();


if (isset($_GET['cerrar_sesion'])) {
	# code...
	session_unset();
	session_destroy();
}

if (isset($_POST['nombre']) && isset($_POST['passwd'])) {
	$nombre=$_REQUEST['nombre'];
	$passwd=$_REQUEST['passwd'];

	$db = new Database();
	$consulta= $db->connect()->prepare('SELECT*FROM tbl_user where tx_username = :nombre and tx_password= :passwd');
	$consulta->execute(['nombre'=> $nombre, 'passwd'=>$passwd]);

	$row = $consulta->fetch(PDO::FETCH_NUM);

	if ($row==true) {
		# code...
		$rol = $row[7];
		$_SESSION['rol']=$rol;

		switch ($_SESSION['rol']) {
		case 1:
			# code...
			header('location: ../admin/index.php');
		break;

		case 2:
			# code...
			header('location: ../web/tutor.php?nombre='.$nombre);
			print $nombre;
		break;
		
		default:
	}

	}else{
		?>
		<link rel="stylesheet" href="css/login.css">
    	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 

		<h1 style="background-color: red; color: white;">No se puede iniciar sesión con esas credenciales</h1>

		<?php
		include('index.html');	
	}
}

if (isset($_POST['nombre']) && isset($_POST['passwd'])) {
	$nombre=$_REQUEST['nombre'];
	$passwd=$_REQUEST['passwd'];

	$db = new Database();
	$consulta= $db->connect()->prepare('SELECT*FROM tutor where cedula = :nombre and tx_password= :passwd');
	$consulta->execute(['nombre'=> $nombre, 'passwd'=>$passwd]);

	$row = $consulta->fetch(PDO::FETCH_NUM);

	if ($row==true) {
		# code...
		$rol = $row[7];
		$_SESSION['rol']=$rol;

		switch ($_SESSION['rol']) {
		case 1:
			# code...
			header('location: ../admin/index.php');
		break;

		case 2:
			# code...
			header('location: ../web/tutor.php?nombre='.$nombre);
			print $nombre;
		break;
		
		default:
	}

	}else{
		?>
		<link rel="stylesheet" href="css/login.css">
    	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 

		<h1 style="background-color: red; color: white;">No se puede iniciar sesión con esas credenciales</h1>

		<?php
		include('index.html');	
	}
}
