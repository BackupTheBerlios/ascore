<?php

/* Bloques */
/********** Construccion de la portada */

ob_start();



//require("Bilo/Blocks/public_login.php");


$data=ob_get_contents();
ob_end_clean();

/* Construccion de laportada **********/
$DESCRIPTION='
asCore Development Branch
';
$KEYWORDS='
core
';

ob_start();
global $SYS;

plantHTML(
	array(
		"ROOT"=>$SYS["ROOT"],
		"SITEMAP"=>"Portada",
		"DESCRIPTION"=>$DESCRIPTION,
		"KEYWORDS"=>$KEYWORDS,
		"fecha"=>time(),
		"header"=>$isnotlogged,
		"link_login"=>"",
		"left_block"=>$islogged,
		"right_block"=>"",
		"mainview"=>$data
		),
	"Public/portada");
	

	
	
?>