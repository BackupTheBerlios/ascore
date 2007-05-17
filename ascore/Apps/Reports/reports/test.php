<?php

require_once("Bilo.php");
	
$bi=getmicrotime();

$r->TITLE="Registro de Usuarios";
$r=newObject("registro");
if (empty($sort))
	$sort="dia DESC ";
$r->searchResults=$r->selectA();
listList($r,array("usuario"=>"xref#user|user_id|username"),"test_report");

$be=getmicrotime();

debug("Informe generado en ".($be-$bi)." segundos","red");
?>


