<?php  

include_once "../../bd/db.php";
$id = $_GET['id'];
$query = "UPDATE solicitudpermiso_tbl_user SET status_permiso_idstatus_permiso=3 WHERE (tbl_user_idtbl_user=$id)";
$res = mysqli_query($con, $query);
if ($res) {
	header('location:../tutor.php');
}
?>