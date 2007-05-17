<?php
ini_set("max_execution_time","500");
//die("Deactivated");
require_once("System.php");

plantHTML(array(),"f_menu");
$ou=newObject("foto");

$data=$ou->selectA();
$total=sizeof($data);
ob_end_flush();
foreach($data as $v) {
	
	
		if ($v["id_foto"]==0) {
			echo $v["ID"]." ".$v["desc"]. " falló<br>";
			$dm=newObject("foto",$v["ID"]);
			$dm->delete();
		}
		else
			$j++;
				
		$i++;
		if ($i%25==0) {
			$p=$i*100/$total;
			jsAction("setProgress('$p');");
			flush();
		}
	
	
}

echo "$i fotos tratadas $j existen";
HTML("footer");
?>