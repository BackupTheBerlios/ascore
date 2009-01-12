<?php
require_once("Biblio.php");
require_once("Lib/lib_tree.php");

$c=newObject("b_categoria",$ID);
formAction("action_save_cat.php","footer","editForm");
$c->boton0=gfxBotonAction("Guardar","getElementById('editForm').submit()",True);
	
	$e=newObject("b_categoria");
	
	$d=array(	
	"b_cat_padre_id"=>$e->listAll("nombre_cat")
	);
// --
$wRes=new avSelectTree();
$c->b_cat_padre_id=$wRes->avSelectPrintTree("b_cat_padre_id","Biblio","b_categoria","b_cat_padre_id","nombre_cat",$c->b_cat_padre_id);
// --
//plantHTML($c,'add_cat',$d);
plantHTML($c,'add_cat',array());
formClose();

?>