<?php
require_once("Noticias.php");



$ID=(isset($ID))?$ID:1;
$n=newObject("notice",$ID);
$n=newObject("notice",$ID);
	
formAction("action_save_notice.php?ID=$ID","footer","editForm");

$sBasePath = $SYS["COREURL"]."/Extensions/FCKeditor/";
debug("Calling FCKEditor! at $sBasePath","yellow");
include("Extensions/FCKeditor/fckeditor.php");
$oFCKeditor = new FCKeditor('FCKeditor1') ;
$oFCKeditor->BasePath = $sBasePath;
$oFCKeditor->Value = $n->body;

$n->editor=$oFCKeditor->Create() ;

$n->boton0=gfxBotonAction("Guardar","getElementById('editForm').submit()",True);

//$d=array(
	//"inputCategoria"=>"fref#cat_not|ListCat");
/*$wRes=new avSelect();
$n->inputCategoria=$wRes->avSelectPrint("id_cat","Noticias","cat_not","nombre_cat",$n->id_cat,"");*/
$c=newObject("cat_not");
$d=array(
	"id_cat"=>$c->listAll("nombre_cat")
	
);

plantHTML($n,'add',$d);
formClose();

?>