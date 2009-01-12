<?php

require_once("Biblio.php");

$libro=newObject("b_libro");

setLimitRows(15);

$libro->searchResults=$libro->selectAll($offset,$sort);

$extk=array(
	//"_xref_b_categoria_id"=>$libro->get_external_reference("b_categoria_id"),
	//"nombre_categoria_padre"=>$libro->get_external_method("b_categoria_id","GetFatherName")

);
listList($libro,$extk,"listadolibro");


resetLimitRows();




?>
