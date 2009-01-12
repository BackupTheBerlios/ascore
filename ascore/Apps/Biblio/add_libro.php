<?php

require_once("Biblio.php");
require_once("Lib/lib_tree.php");

$libro=newObject("b_libro",$ID);

//$wRes=new avSelectTree();
/*
$libro->b_categoria_id=$wRes->avSelectPrintTree("b_categoria_id","Biblio","b_categoria","b_cat_padre_id","nombre_cat",$p->b_categoria_padre_id);
*/
//$libro->b_categoria_id=$wRes->avSelectPrintTree("b_categoria_id","Biblio","b_categoria","b_cat_padre_id","nombre_cat",$libro->b_categoria_id);

formAction("action_save_libro.php","footer","editForm");
$libro->boton0=gfxBotonAction("Guardar","getElementById('editForm').submit()",True);
$c=newObject("b_categoria");

$libro->b_categoria=$libro->get_selected_options("b_categoria");

$d=array(
	"b_categoria"=>$c->listAll("nombre_cat")	// b_categoria tiene que existir en el .def
);

plantHTML($libro,"fichalibro",$d);
formClose();

?>