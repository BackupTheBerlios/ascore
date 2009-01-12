<?php

require_once("Biblio.php");
HTML("action_header");

$libro=newObject("b_libro",$ID);
if ($libro->delete()) {

	echo _("Borrado correctamente");
	frameGo("fbody","main.php");
}
else
	echo _("No borrado");



?>