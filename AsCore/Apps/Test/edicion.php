<?php

require_once("Test.php");

$ID=(isset($ID))?$ID:1;

$ejemplo=newObject("example",$ID);

formAction("action_save_example.php","footer","editForm");

$ejemplo->_boton0=gfxBotonAction("Guardar","getElementById('editForm').submit()",True);
$c=newObject("bookmark");

$datosExternos=array(

	"host"=>$c->listAll("nombre", false)
	//"id_cat"=>array("Uno","Dos")
);

//debug($datosExternos,"yellow");
plantHTML($ejemplo,'example_edicion',$datosExternos);
formClose();


?>
