<?php

require_once("Bilo.php");

if(BILO_isOperator()){
	$u=newObject("user");
	$u->isAdmin=BILO_isAdmin();
	$u->searchResults=$u->selectAll($offset,$sort);
	dataDump($u);
	listList($u,array("grupos_nombre"=>"fref#user|ID|listGroupsNames"),"list_users","",1,"plParseTemplateFast");

}else
	echo "<h4 align=\"center\">PRIVILEGIOS INSUFICIENTES</H4>";


?>


