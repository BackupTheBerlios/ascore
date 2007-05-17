<?php
$ID=(isset($ID))?$ID:1;
$thumb=(isset($thumb))?$thumb:"";
require_once("Noticias.php");
require_once("Forus/Forus.php");
if (($ID>1)&&($thumb != "")) 
{
	
	$t=newObject("fileh",$ID);
	header("Content-Type: {$t->mime}");
	$extension=explode("/",$t->mime);
	if($thumb=="true")
	header("Content-Disposition: inline; filename=imagen$ID.{$extension[1]}");
	
	echo $t->getRawData();
	
}

?>