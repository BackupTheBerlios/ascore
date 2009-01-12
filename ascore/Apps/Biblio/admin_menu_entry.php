<?php

/* Link, Frame, Label and Variable to check to show */

$menu_entry=array(
"label"=>"Biblio",
"active"=>True,
"items"=>array(
		array("Biblio/main.php","fbody","Listado"),
    		array("Biblio/add_libro.php?ID=1","fbody","Nuevo libro"),
		array("Biblio/add_categoria.php?ID=1", "fbody", "Nueva categoría"),
		array("Biblio/list_cat.php","fbody","Categorías")
	      )
);

?>