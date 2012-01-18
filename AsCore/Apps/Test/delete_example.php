<?php
require_once("Test.php");
$ID=(isset($ID))?$ID:1;
if ($ID>1)
{
	$n=newObject("example",$ID);
	$n->delete();

}
FrameReload("fbody");
?>