<?php
require_once("Noticias.php");



$ID=(isset($ID))?$ID:1;
$n=newObject("notice",$ID);
$n=newObject("notice",$ID);
	
formAction("action_save_notice.php?ID=$ID","footer","editForm");

$n->boton0=gfxBotonAction("Guardar","getElementById('editForm').submit()",True);

$c=newObject("cat_not");
$d=array(
	"id_cat"=>$c->listAll("nombre_cat")
	
);

plantHTML($n,'add',$d);
formClose();

?>