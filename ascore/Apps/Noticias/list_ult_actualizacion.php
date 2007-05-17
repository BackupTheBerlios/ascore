<?php
require_once("Noticias.php");
$ID=(isset($ID))?$ID:1;

if($ID > 1)
{
	$c=newObject("notice");
	$cat=newObject("cat_not",$ID);
	$c->isAdmin=BILO_isAdmin();
	setLimitRows(5);
	$sort="fech_ult_consulta DESC";
	$c->searchResults=$c->select("id_cat=$ID",$offset,$sort);
	resetLimitRows();

	if($c->nRes==0)
		$c->nohay="NO HAY CATEGORIAS DISPONIBLES";
	else
		$cat->filas=$c->nRes;

	plantHTML($cat,"info_cat_not_ult");

	listList($c,array(),'list_prim_ult_notice');
}else
	echo "<div align=\"center\"><B>ERROR EN LA PÁGINA</B></div>";
?>