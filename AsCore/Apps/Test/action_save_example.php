<?php
require_once("Test.php");
plantHTML(array(),'action_header');

$ID=(isset($_POST["ID"]))?$ID:1;

if($ID>1)
	$n=newObject("example",$ID);
else 
	$n=newObject("example");

$f=newObject("foto");
$f->CaptureFile='adjunto';
//$f->familia_fileh_ID=_NOTICIAS;)
if(!empty($_FILES[$f->CaptureFile]["name"]))
	$n->adjunto=$f->save();
else
	$n->adjunto=$_POST["adjunto"];
$n->setAll($_POST);

if($n->save()) {
	echo "Example  '{$n->titulo}' guardado correctamente";
	frameGo("fbody",'index.php');
	}
else
	echo "Error:  {$n->ERROR}";
	
	
HTML('action_footer');

?>