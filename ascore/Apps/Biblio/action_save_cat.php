<?php
require_once("Biblio.php");
HTML('action_header');
$u=newObject("b_categoria");
$u->setAll($_POST);

if($u->save()) {
	echo "Guardado correctamente";
	frameGo("fbody",'list_cat.php');
	}
else
	echo $u->error;
HTML('action_footer');
?>