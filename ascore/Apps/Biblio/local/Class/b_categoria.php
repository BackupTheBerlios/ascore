<?php

function GetFatherName()
{
	$a=newObject("b_categoria",$this->b_cat_padre_id);
	return $a->nombre_cat;
}

?>