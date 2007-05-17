<?php

require_once("Articulus.php");


$ID=(isset($ID))?$ID:1;
$p=newObject("documento",$ID);
$p->editor=$p->cuerpo;
plantHTML($p,"view");


	
?>