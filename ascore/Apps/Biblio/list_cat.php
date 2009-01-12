<?php
require_once("Biblio.php");
$c=newObject("b_categoria");
$c->isAdmin=BILO_isAdmin();

$c->searchResults=$c->selectAll($offset,$sort);
//if($c->nRes==0)
//	$c->nohay="NO HAY CATEGORIAS DISPONIBLES";
$extk=array(
	"nombre_categoria_padre"=>$c->get_external_reference("b_cat_padre_id")
);
listList($c,$extk,'list_cat');
?>