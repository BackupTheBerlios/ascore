<?php
ini_set("max_execution_time","500");
//die("Deactivated");
require_once("System.php");

plantHTML(array(),"f_menu");
$ou=newObject("fileh");

$data=$ou->selectA();

$total=sizeof($data);
 ob_end_flush();
foreach($data as $v) {
	
		$a=newObject("fileh",$v["ID"]);
		
		if (!is_file($a->localname())) {
			echo $v["ID"]." ".$v["md5"]. " falló<br>";
			
			$a->delete();
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

echo "$i ficheros tratadas $j existen";
HTML("footer");
?>