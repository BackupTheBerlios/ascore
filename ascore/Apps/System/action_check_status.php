<?php
require_once("System.php");
plantHTML(array(),"action_header");
$err=0;
echo "Dyn OO Engine..";
if (class_exists("Ente")) 
	echo "<span style='color:green;'>[OK]</span>";
else {
	echo "<span style='color:red;'>[KO]</span>";
	$err++;
}
echo " :: Template engine..";
if (function_exists("plantHTML")) 
	echo "<span style='color:green;'>[OK]</span>";
else {
	echo "<span style='color:red;'>[KO]</span>";
	$err++;
}

echo " :: $err Fallos";
plantHTML(array(),"action_footer");
?>