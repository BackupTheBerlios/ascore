<?php

require_once("coreg2.php");
require_once("Bilo/API_exports.php");


if ($_POST["proceder"]) 
	if (BILO_login()) {
		PlantHTML(array("location"=>$_POST["REFERER"]),"redirect");
		die();
	}
else
	$SYS["MESSAGES"]="Error, su usuario o contraseña no es correcta";
?>