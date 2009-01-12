<?php
require_once("Biblio.php");
$c=newObject("b_categoria");
$c->isAdmin=BILO_isAdmin();

$ID=(isset($ID))?$ID:1;

if($ID>1)
{
	$u=newObject("b_categoria",$ID);
	$u->delete();
}else
	echo "ERROR";
	
FrameGo("fbody","list_cat.php");


?>